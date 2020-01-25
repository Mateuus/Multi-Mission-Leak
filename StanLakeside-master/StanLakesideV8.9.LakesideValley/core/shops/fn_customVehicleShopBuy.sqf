/*
	fn_customVehicleShopBuy.sqf
	Pennyworth
*/

disableSerialization;

_display = findDisplay 2700;
_salesmanList = _display displayCtrl 2701;
_salesman = _salesmanList lbData (lbCurSel _salesmanList);
_salesman = call compile _salesman;

if(isNil "life_showRoomVehicle" || isNull life_showRoomVehicle) exitWith {};
if(!(playerSide isEqualTo civilian) && !(playerSide isEqualTo east)) exitWith {["You cannot purchase while on duty.", false] spawn domsg};
if(!isNil "_salesman" && {_salesman isEqualTo player}) exitWith {["You cannot purchase a vehicle from yourself.", false] spawn domsg};
_className = typeOf life_showRoomVehicle;

_list = ["showroom_car"] call life_fnc_vehicleListCfg;
_price = -1;

{
	if((_x select 0) find _className != -1) exitWith {
		_price = _x select 1
	};
} count _list;

if(_price isEqualTo -1) exitWith {};
if!(isNil "_salesman") then {
	_price = _price * .9;
};
if(cash_in_hand < _price) exitWith {[format[localize "STR_Shop_Veh_NotEnough",[_price - cash_in_hand] call life_fnc_numberText], false] spawn domsg;};

_spawnPoints = [["showroom_spawn_1",8.2],["showroom_spawn_2",4],["showroom_spawn_3",5.4]];
_spawnPoint = "";

//Check if there is multiple spawn points and find a suitable spawnpoint.
{
	if(count(nearestObjects[[getMarkerPos (_x select 0) select 0, getMarkerPos (_x select 0) select 1, (_x select 1)],["Car","Motorcycle","Ship","Air"],5]) isEqualTo 0) exitWith {
		_spawnPoint = _x
	};
} foreach _spawnPoints;


if(_spawnPoint isEqualTo "") exitWith {[localize "STR_Shop_Veh_Block", false] spawn domsg};
["cash","take",_price] call life_fnc_handleCash;
if!(isNil "_salesman") then {
	_salesmanCut = _price * (1/9);
	["cash","bank",_salesmanCut] remoteExecCall ["life_fnc_handleCash",_salesman];
	[format["You received $%1 for assisting %2 in their purchase of a %3.",_salesmanCut,profileName,getText(configFile >> "CfgVehicles" >> _className >> "displayName")], false] remoteExec ["domsg",_salesman];
};
[format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_price] call life_fnc_numberText], false] spawn domsg;

[] spawn {
	waitUntil {closeDialog 0; (isNull findDisplay 2700 && isNull findDisplay 2700)};
};

_availableAnims = [0,life_showRoomVehicle] call life_fnc_animateJonzies; 
_currentAnims = [];
if!(_availableAnims isEqualTo []) then {
	_currentAnims = [1,life_showRoomVehicle,_availableAnims] call life_fnc_animateJonzies;
};
_red = life_showRoomVehicle getVariable "Red";
_green = life_showRoomVehicle getVariable "Green";
_blue = life_showRoomVehicle getVariable "Blue";

_vehicle = createVehicle [_className, [getMarkerPos (_spawnPoint select 0) select 0, getMarkerPos (_spawnPoint select 0) select 1, (_spawnPoint select 1)], [], 0, "NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle setVariable ["Red",_red,true];
_vehicle setVariable ["Green",_green,true];
_vehicle setVariable ["Blue",_blue,true];
if!(_availableAnims isEqualTo []) then {
	[2,_vehicle,_currentAnims] call life_fnc_animateJonzies;
};
_vehicle allowDamage false;
_vehicle lock 2;
_vehicle setVectorUp [0,0,1];
_vehicle setDir (markerDir (_spawnPoint select 0));
_vehicle setPosATL [getMarkerPos (_spawnPoint select 0) select 0, getMarkerPos (_spawnPoint select 0) select 1, (_spawnPoint select 1)];
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle setVariable["trunk_in_use",false,true];
_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];

_vehicle allowDamage true;
_color = [parseNumber(_red),parseNumber(_green),parseNumber(_blue)];
if!(_currentAnims isEqualTo []) then {
	_color pushBack _currentAnims;
};
diag_log format ["Outside I fucked it: %1",_color];	
life_vehicles pushBack _vehicle; //Add err to the chain.

[(getPlayerUID player),playerSide,_vehicle,_color] remoteExecCall ["TON_fnc_vehicleCreate",(call life_fnc_HCC)];

true;