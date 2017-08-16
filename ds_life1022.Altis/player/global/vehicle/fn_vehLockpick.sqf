/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Lockpicks a vehicle
*/

private ["_tempNum","_upgraded","_vehicle","_vehicleString","_sleep","_isValid","_progress","_ui","_chance","_distance","_targets"];

if((player inArea "safezone")||(player inArea "safezone_1"))exitwith{hint "You can not use this item in this area"};
closeDialog 0;
if(!isNull objectParent player) exitWith {};
_vehicle = DS_cursorTarget;
DS_moved = false;
_isValid = false;
DS_doingStuff = true;
_sleep = 0.12;//Alter later on for moral and mechanics
_chance = random 100;
_upgraded = _vehicle getVariable ["security",false];
_distance = 10;
if((typeOf _vehicle) in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"])then {
	_distance = 15;
};
if(_upgraded)then {
	_sleep = 0.3;
	_chance = random 75;
};
if(_vehicle getVariable ["realMode",false])then {
	_chance = random 60;
};
if((DS_infoArray select 15) > 30)then{_sleep = (_sleep*0.7);};
_pods = ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F",
				"B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"];
if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(_vehicle isKindOf "Tank")||(typeOf _vehicle in _pods))then {
	_isValid = true;
};
if(!_isValid)exitwith{DS_doingStuff = false;hint "This is an invalid vehicle type"};
if(player distance _vehicle > _distance)exitwith{DS_doingStuff = false;};
if(_vehicle in DS_keyRing)exitwith{DS_doingStuff = false;hint "You already have the key to this vehicle"};

_vehicleString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_upp = format["Lock picking %1",_vehicleString];
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

[] spawn {
	while{true}do {
		if(!DS_doingStuff)exitwith{};
		_targets = allPlayers select {(_x distance player) < 200};
		[player,"lockpick",true] remoteExecCall ["DS_fnc_playSounds",_targets];
		sleep 2.5;
	};
};

_targets = allPlayers select {(_x distance player) < 200};
[player,"AinvPknlMstpSnonWnonDnon_medicUp3"] remoteExecCall ["DS_fnc_animSync",_targets];

while{true} do {
	sleep _sleep;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(!isNull objectParent player) exitWith {};
	if(DS_moved) exitWith {};
};
DS_doingStuff = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitwith{};
if(!isNull objectParent player) exitWith {hint "You must remain outside the vehicle to lock pick it"};
if(DS_moved) exitWith {DS_moved = false;hint "You must not move while lock picking a vehicle"};

if(_vehicle getVariable ["securityAdv",false])exitwith{hint "This vehicles security level prevents it from being lockpicked";systemchat "This vehicles security level prevents it from being lockpicked"};

if(_chance > 50)then {
	DS_keyRing pushBack _vehicle;
	titleText [format ["You have now got the keys to this %1",_vehicleString],"PLAIN"];
	if((DS_infoArray select 15) == 5)then { [1] call DS_fnc_questCompleted };
	if((DS_infoArray select 15) == 14)then {
		_tempNum = (DS_infoArray select 16) + 1;
		if(_tempNum > 2)then {
			[1] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [16,_tempNum];
		};
	};
} else {
	titleText ["Your lock pick broke","PLAIN"];
	["lockpick",false,1] call DS_fnc_handleInventory;
};