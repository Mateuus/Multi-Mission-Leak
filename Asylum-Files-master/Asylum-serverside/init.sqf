














server_query_running = false;
life_DB_queue = [];
life_item_pickups = [];
serv_sv_use = [];

_handle = [] execVM "\life_server\vars.sqf";
waitUntil {scriptDone _handle};

if (!isServer) then { [] execVM "\life_server\eventhandlers.sqf"; };

_extDB = false;


if(isNil {uiNamespace getVariable "life_sql_id"}) then {
life_sql_id = round(random(9999));
uiNamespace setVariable ["life_sql_id",life_sql_id];


_result = "extDB" callExtension "9:VERSION";
diag_log format ["extDB: Version: %1", _result];
if(_result == "") exitWith {};
if ((parseNumber _result) < 14) exitWith {diag_log "Error: extDB version 14 or Higher Required";};


_result = "extDB" callExtension "9:DATABASE:Database";
if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
_result = "extDB" callExtension format["9:ADD:DB_RAW_V2:%1",life_sql_id];
if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
"extDB" callExtension "9:LOCK";
_extDB = true;
diag_log "extDB: Connected to Database";
} else {
life_sql_id = uiNamespace getVariable "life_sql_id";
_extDB = true;
diag_log "extDB: Still Connected to Database";
};



if (!_extDB) exitWith {
life_server_extDB_notLoaded = true;
publicVariable "life_server_extDB_notLoaded";
diag_log "extDB: Error checked extDB/logs for more info";
};

if (worldName == "Australia") then { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", "CALL resetAusVehicles();"]; }
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", "CALL resetLifeVehicles();"]; };
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", "CALL updateLifeHouses();", life_server_instance]; 

[] call DB_fnc_queryConfig;
[] call ASY_fnc_govMaint;


if(!hasInterface) then
{

};

life_fnc_wantedAdd = compileFinal PreprocessFileLineNumbers "\life_server\wanted_add.sqf";
life_fnc_wantedRemove = compileFinal PreprocessFileLineNumbers "\life_server\wanted_remove.sqf";
life_group_list = [];
publicVariable "life_group_list";
life_wanted_list = [];
client_session_list = [];














[] spawn
{
private["_logic","_queue","_chopOptions","_vehClass"];
while {true} do
{

life_chopVehicle = [];
_chopOptions = ["C_Hatchback_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Van_01_transport_F","B_G_Offroad_01_F","I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_box_F","B_Truck_01_box_F","B_Truck_01_box_F"];
for "_i" from 1 to 3 do
{
while {true} do
{
_vehClass = _chopOptions call BIS_fnc_selectRandom;
if (!(_vehClass in life_chopVehicle)) exitWith { life_chopVehicle pushBack _vehClass; };
};
};
publicVariable "life_chopVehicle";

sleep (30 * 60);


_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
_queue = _logic getvariable "life_fnc_MP_queue";
_logic setVariable["life_fnc_MP_queue",[],TRUE];


_rand = floor (random 3);
if (_rand == 0) then
{
[] spawn ASY_fnc_initEvent;
};
};
};

[] spawn {
if (worldName == "Stratis") then { life_restart_delay = 6000; };

[] spawn
{
private ["_rand","_max"];
_max = life_restart_delay;
_rand = floor random (_max * 2);
if (_rand < _max) then
{
sleep _rand;
_rand = ceil random 4;
[[_rand],"BIS_fnc_earthquake",true,false] spawn life_fnc_MP;
sleep 12;
[[[0,1],format["A factor %1 earthquake has been detected on the island of %2.",_rand,worldName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};
};

[] spawn
{
while {true} do
{
_max = life_restart_delay * 0.5;
_rand = floor random (_max - 300);
if (_rand < 960) then { _rand = 960; };
sleep _rand;
_largest = [nil,nil,nil,0,nil];
{
if (_x select 3 > _largest select 3 && !((_x select 1) in life_past_APB)) then
{
_wanted = _x;
_online = false;
{ if (_wanted select 1 == getPlayerUID _x && side _x == civilian && !(_x getVariable ["prisoner",false])) then { _online = true; } } forEach allPlayers;
if (_online) then {	_largest = _x; };
};
} forEach life_wanted_list;
if (_largest select 3 > 0) then
{
life_allpoints = [_largest select 0, _largest select 1, _largest select 3];
life_past_APB pushBack (_largest select 1);
publicVariable "life_allpoints";
[] spawn
{
sleep 900;
if (count life_allpoints > 0) then
{
[[life_allpoints select 1],"life_fnc_removeBounty",west,false] spawn life_fnc_MP;
_online = objNull;
{ if (life_allpoints select 1 == getPlayerUID _x) then { _online = _x; } } forEach allPlayers;
if (!isNull _online) then { [[6,1],"life_fnc_addStatistic",_online,false] spawn life_fnc_MP; };
life_allpoints = [];
publicVariable "life_allpoints";
};
};
};
};
};
};

fnc_serv_kick = {endMission "loser";};
publicVariable "fnc_serv_kick";


[] spawn ASY_fnc_queryHouses;
[] spawn ASY_fnc_queryGangs;
[] spawn DB_fnc_queryCaptures;


publicVariable "ASY_fnc_addVehicle2Chain";
publicVariable "ASY_fnc_experienceReq";

[] spawn DB_fnc_queryStock;


[] spawn
{
private ["_toCap","_capIndex","_turf","_delay","_started"];
_toCap = [0,1,2]; 
_delay = (life_restart_delay / (count life_turf_list)) - (life_restart_delay / (life_restart_delay / 1000));
while {count _toCap > 0} do
{
sleep _delay;
[] spawn ASY_fnc_reduceMarket;
_capIndex = _toCap call BIS_fnc_selectRandom;
_turf = life_turf_list select _capIndex;
_toCap = _toCap - [_capIndex];
life_active_turf = _capIndex;
publicVariable "life_active_turf";
_marker = format["turf_label_%1", _capIndex + 1];
_marker setMarkerColor "ColorRed";
(format["turf_area_%1", _capIndex + 1]) setMarkerColor "ColorRed";
life_turf_captor = [];
publicVariable "life_turf_captor";
_started = time;
waitUntil { (time - _started) > 900 };
life_active_turf = -1;
publicVariable "life_active_turf";
_marker setMarkerColor "ColorUNKNOWN";
(format["turf_area_%1", _capIndex + 1]) setMarkerColor "ColorUNKNOWN";
_benefits = switch (_capIndex) do
{
case 0: { "double gathering speed of most drugs" };
case 1: { "increased gas station robbery and chop shop payouts" };
case 2: { "reduced material cost at the black market" };
};
if (count life_turf_captor > 0) then
{
_pdist = if (worldName == "Stratis") then { 700 } else { 2000 };
_members = []; { if (_x getVariable ["gang","0"] == (life_turf_captor select 2) && (getMarkerPos _marker) distance _x < _pdist) then { _members pushBack _x; }} forEach allPlayers;
if (count _members > 5) exitWith
{
{
[[1, format["<t color='#ff0000'><t size='2'><t align='center'>Gang Turf<br/><br/><t size='1'><t color='#ffffff'>The gang turf of <t color='#ff0000'>%1</t> failed to be taken by your gang due to too many gang members in the region!", _turf select 0]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
} forEach _members;
};
_turf set [1, life_turf_captor select 2];
_turf set [2, life_turf_captor select 1];
life_turf_list set [_capIndex, _turf];
publicVariable "life_turf_list";
_owned = 0; { if (_x select 1 == life_turf_captor select 2) then { _owned = _owned + 1 } } forEach life_turf_list;
if (_owned > 1) then { _benefits = _benefits + " as well as reduced weapon prices for holding multiple turf areas"; };
[[1, format["<t color='#ff0000'><t size='2'><t align='center'>Gang Turf<br/><br/><t size='1'><t color='#ffffff'>The gang turf of <t color='#ff0000'>%1</t> was captured by %2 for <t color='#ff0000'>%3</t>! Gang benefits are %4.", _turf select 0, life_turf_captor select 0, life_turf_captor select 1, _benefits]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
[] spawn DB_fnc_updateTurf;

{
[[2,3],"life_fnc_addStatistic",_x,false] spawn life_fnc_MP;
} forEach _members;
};
};
};


[] spawn
{
private ["_query"];
_query = format["SELECT p.`name` FROM `arma3life`.`%1` as p LEFT JOIN `arma3life`.`players_global` as g ON p.playerid=g.playerid AND g.`wealth` > 0 AND g.`adminlevel` = '0' AND p.`lastupdated` > DATE_SUB(NOW(), INTERVAL 2 WEEK) ORDER BY g.`wealth` DESC LIMIT 10", srv_table_players];
life_topWealth = [_query,2,true] call DB_fnc_asyncQuery;
};

[] spawn ASY_fnc_monitorCaptures;





[] spawn
{
private ["_changed"];
while {true} do
{
sleep 300;
{
if (typeName _x == "OBJECT") then
{
_changed = _x getVariable["lootModified", false];
if (_changed) then
{
[_x] spawn DB_fnc_updateStorage;
sleep 2;
};
};
} forEach life_storage_array;
[] spawn DB_fnc_updateCaptures;
10 setFog 0;

};
};


[] spawn
{
private ["_numDoors"];
waitUntil {!isNil "life_bank_vaults"};
{
_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "numberOfDoors");
_x setVariable["life_locked", 1, true];
for "_i" from 1 to _numDoors do
{
_x setVariable[format["bis_disabled_Door_%1", _i], 1, true];
};
} forEach life_bank_vaults;
waitUntil {!isNil "life_bank_safes"};
{
_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "numberOfDoors");
_x setVariable["life_locked", 1, true];
for "_i" from 1 to _numDoors do
{
_x setVariable[format["bis_disabled_Door_%1", _i], 1, true];
};
} forEach life_bank_safes;
};
if (worldName in ["Altis","Australia","Tanoa"]) then { [] spawn ASY_fnc_spawnGoldBars; }; 


[] spawn
{
waitUntil { !isNil "life_bank_building" };
life_bank_building setVariable ["bis_disabled_Door_4", 1, true];
life_bank_building animate ["door4_rot", 0];
life_bank_drilling = false;
life_bank_last = -2000;
publicVariable "life_bank_drilling";
publicVariable "life_bank_funds";
publicVariable "life_bank_last";
_bankInc = if (worldName == "Altis") then { 7000 } else { 5000 };
while {true} do
{
sleep 300;
life_bank_funds = life_bank_funds + _bankInc;
publicVariable "life_bank_funds";
};
};


[] spawn
{
{
if(!isPlayer _x) then {
removeAllWeapons _x;
removeBackpack _x;


};
} foreach allUnits;
};

ASYObjectWhitelist = ["Rope","Box_East_Support_F","Box_East_WpsSpecial_F","Land_WaterBarrel_F","Steerable_Parachute_F","Land_BagBunker_Small_F","Land_BagFence_Corner_F","Land_BagFence_Long_F","Land_BagFence_Round_F","Land_Hbarrier_3_F","Land_Hbarrier_Big_F","Land_CamoNet_open_F","Land_Razorwire_F","Land_HBarrierTower_F","Land_BagFence_End_F","Land_HBarrierWall4_F","Land_Hbarrier_1_F","Land_BagBunker_Tower_F","Land_FieldToilet_F","Land_Pier_small_F","Land_BagFence_Short_F","Land_Research_house_V1_F","Land_Research_HQ_F"];
{
if (!((typeOf _x) in ASYObjectWhitelist)) then
{
ASYObjectWhitelist pushBack (typeOf _x);
};
} forEach vehicles;


[] spawn  {
while{true} do
{
sleep 300;
[] call ASY_fnc_cleanup;


_filled = [];
{
if (_x select 5 == "life_inv_dirty_money") then
{
_container = call compile (format["capture_container_%1", _forEachIndex+1]);
_var = _container getVariable ["gangContainer", ["life_inv_dirty_money",0]];
_newAmount = (_var select 1) + 3100;
if (_newAmount > 100000) then { _newAmount = 100000; };
_var set [1, _newAmount];
_container setVariable ["gangContainer", _var, true];

if (_newAmount > 85000) then { _filled pushBack (_x select 0) };
};
if (_x select 5 == "life_inv_rubber") then
{
_container = call compile (format["capture_container_%1", _forEachIndex+1]);
_var = _container getVariable ["gangContainer", ["life_inv_rubber",0]];
_newAmount = (_var select 1) + 2;
if (_newAmount > 200) then { _newAmount = 200; };
_var set [1, _newAmount];
_container setVariable ["gangContainer", _var, true];

if (_newAmount > 150) then { _filled pushBack (_x select 0) };
};
} forEach life_capture_list;

if (count _filled > 0) then

{
[[0,format["The container at %1 is near or at maximum capacity!", _filled joinString ", "]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};
};
};


[] spawn  {
while{true} do
{
sleep 420;
[] spawn DB_fnc_flushAllPlayers;
};
};

if (worldName == "Australia") then
{

[] spawn
{
_obj = nearestObjects [[25000,25000,0], ["Land_CommonwealthBank","Land_PoliceStation"], 15000];
{
switch (typeof _x) do
{
case "Land_PoliceStation": { _x animate ["gatedoor_1", -1.6]; _x animate ["gatedoor_2", 1.6]; };
case "Land_CommonwealthBank": { _x animate ["LeftSlideDoor",-1.7]; _x animate ["RightSlideDoor",1.7] };
}
} forEach _obj;
};


life_prison_building = nearestObject [getMarkerPos "corrections", "Land_MainSection"];
life_prison_building animate ["Door3", 1];
life_prison_building animate ["Door4", 1];
life_prison_building animate ["Door7", 1];
life_prison_building animate ["Door13", 1];
life_prison_building animate ["Door14", 1];
};

[] spawn DB_fnc_restoreVehicles;
[] spawn ASY_fnc_laserTag;


[] spawn { sleep 20; { _x setDamage 1; } forEach (nearestObjects [getMarkerPos "fed_reserve", ["Land_Cargo_Patrol_V1_F"], 200]); };


[] spawn
{
_query = format["DELETE FROM `online` WHERE `instance`='%1'", life_server_instance];
[_query] call DB_fnc_asyncQuery;
};


{
_x animate ["Door_1_rot", 1];
} forEach allMissionObjects "Land_BarGate_F";
[] spawn KBW_fnc_fixBadOffers;
_forSaleHouses = [format["SELECT worldspace,sale FROM asylumlife%1.houses WHERE sale>0",life_server_instance],2,true] call DB_fnc_asyncQuery;
life_forSaleHouses = [];
{nearestBuilding (call compile(_x select 0)) setVariable["salePrice",_x select 1,true]; life_forSaleHouses pushBack (call compile(_x select 0))} forEach _forSaleHouses;
publicVariable "life_forSaleHouses";
[] spawn {
while{true} do {
sleep 3600;
_query = "UPDATE exchange SET timer=timer+1";
[_query,1] call DB_fnc_asyncQuery;
};
};






































