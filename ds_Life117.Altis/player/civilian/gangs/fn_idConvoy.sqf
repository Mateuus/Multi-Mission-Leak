/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Gang area ID convoy
*/
private["_counter","_infoArray","_playerCount","_randomSpawn","_vehArray","_randomVeh","_veh","_vehicle","_failed","_markerojb","_copsNeeded"];

if(!([] call DS_civ_myHideout))exitwith{hint "You must own this gang hideout to do this mission"};

_copsNeeded = 3;
_randomFinish =
[
getmarkerpos "cop_spawn_4",getmarkerpos "cop_spawn_3",getmarkerpos "police_hq_2",getmarkerpos "cop_spawn_5"
];

_newmarker = (floor(random(count _randomFinish)));
_markerlocation = (_randomFinish select _newmarker);

if(!([_copsNeeded] call DS_fnc_countPlayers))exitWith	
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>There needs to be at least %1 whitelisted police officers on to begin this mission<br/></t>",_copsNeeded];
	hint _str;	
	};

_action = [
	"This mission requires $150k to start, you must drive a rigged vehicle to a marked area. If your vehicle remains there for 20 seconds it will explode, rewarding you with an ID hiding item",
	"ID Convoy",
	"Start",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action )exitwith{};

_action = [
	"Air Lifting your convoy will cause it to blow up, Understand?",
	"Warning",
	"Yes",
	"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};	

if([150000,true] call DS_fnc_checkMoney)exitwith{hint "You need at least $150k in your bank to begin this mission"};
[150000,true,false] call DS_fnc_handleMoney;

if(count(nearestObjects[(getMarkerPos (DS_spawnPoint select 0)),["Car","Ship","Air"],15]) != 0)exitWith{hint "There is a vehicle blocking the spawn point"};
if(DS_convoy)exitwith {hint "You already have a convoy mission active";};
DS_convoy = true;	

deleteMarkerLocal "convoymarker";
_newmarker = (floor(random(count _randomFinish)));
_markerlocation = (_randomFinish select _newmarker);
_markerobj = createmarkerlocal ["convoymarker",[0,0]];
_markername = "convoymarker";
"convoymarker" setmarkertypelocal "hd_warning";
"convoymarker" setmarkercolorlocal "colorblack";
"convoymarker" setmarkersizelocal [1, 1];
"convoymarker" setmarkertextlocal "Park Rigged Vehicle Here";
_markername Setmarkerposlocal _markerlocation;

_vehArray = ["B_Truck_01_box_F","B_Truck_01_covered_F","B_Truck_01_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","C_Truck_02_transport_F"];
_randomVeh = (floor(random(count _vehArray)));
_veh = (_vehArray select _randomVeh);
_vehicle = createVehicle [_veh, (getMarkerPos (DS_spawnPoint select 0)), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName]],true];
_vehicle setVariable ["carBomb",true,true];
_vehicle lock 2;
DS_keyRing set[count DS_keyRing,_vehicle];
_vehicle setVariable["boot_open",true,true];
hint "You must travel to the police HQ that is marked on your map";
systemchat "You must travel to the police HQ that is marked on your map";

_counter = 0;

while{true}do
	{
	if(_vehicle distance _markerlocation < 15)then{_counter = _counter + 1;hint "Your vehicle is in the area, get out and run before it explodes. Make sure police do not move it";};
	if ((getPos (_vehicle) select 2) > 20) then {_vehicle setDamage 1};
	if(!alive _vehicle)exitwith{_failed = true;};
	sleep 10;
	if(_counter > 2)exitwith{_failed = false;};
	};
	
if(_failed)exitwith
	{
	DS_convoy = false;
	player say3D "fail";
	deleteMarkerLocal "convoymarker";
	hint "You have failed this mission";
	systemchat "You have failed this mission";
	deleteVehicle _vehicle;
	};
	
_sp = getPos _vehicle;
_typeOfVeh = "M_PG_AT";
_explosion = _typeOfVeh createVehicle _sp;
sleep 0.1;
_sp = getPos _vehicle;
_typeOfVeh = "M_PG_AT";
_explosion = _typeOfVeh createVehicle _sp;
sleep 0.1;
_sp = getPos _vehicle;
_typeOfVeh = "M_PG_AT";
_explosion = _typeOfVeh createVehicle _sp;
sleep 0.1;
_vehicle setDamage 1;
	
sleep 5;
if((!alive player)||(player distance spawnIsland < 500))exitWith
	{
	hint "You have died therefore failed your mission";
	DS_convoy = false;
	deleteMarkerLocal "convoymarker";
	};
	
player say3D "success";	
hint "You have completed your mission and an ID changer has been added to your inventory";
systemchat "You have completed your mission and an ID changer has been added to your inventory";

deleteMarkerLocal "convoymarker";
DS_convoy = false;
["idChanger",true,1] call DS_fnc_handleInventory;

if((DS_infoArray select 15) == 31)then
	{
	[1] call DS_fnc_questCompleted;
	};