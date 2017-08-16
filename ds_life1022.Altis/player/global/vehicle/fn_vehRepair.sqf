/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Takes inventory items from vehicles
*/

private ["_distance","_vehicle","_vehicleString","_sleep","_isValid","_progress","_ui","_sleep2","_highwayPatrol","_targets"];
closeDialog 0;
_vehicle = DS_cursorTarget;
if(!alive _vehicle)exitwith{hint "You can not use this on a destroyed vehicle"};
if(isNil "DS_mechanicMission")then{DS_mechanicMission = false};
if((player getVariable ["mechanic",false])&&(_vehicle getVariable ["mechanicMission",false])&&(!DS_mechanicMission))exitWith {
	DS_mechanicMission = true;
};

if(_vehicle getVariable ["mechanicMission",false])exitwith{};

DS_moved = false;
_highwayPatrol = false;
_isValid = false;
_sleep2 = 0;
_sleep = 0.18;
if((player getVariable ["policeSquad",""]) == "Highway Patrol")then{_highwayPatrol = true};
if(DS_moral > 100)then {
	_sleep2 = (DS_moral/8333);
};
_sleep = _sleep - _sleep2;
if(DS_realMode)then {
	_sleep = 0.05;
};

if(((DS_infoArray select 19) > 36)&&(player getVariable ["security",false]))then {
	_sleep = (_sleep/2);
};

if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(_vehicle isKindOf "Tank"))then {
	_isValid = true;
};
if(!_isValid)exitwith{hint "This is an invalid vehicle type"};
_distance = 7;
if((typeOf _vehicle) in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"])then {
	_distance = 30;
};
if(player distance _vehicle > _distance)exitwith{};
if(!_highwayPatrol)then {
	["repairKit",false,1] call DS_fnc_handleInventory;
};
DS_doingStuff = true;
_vehicleString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_upp = format["Repairing %1",_vehicleString];
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

[]spawn {
	while{true}do {
		if(!DS_doingStuff)exitwith{};
		if((random 6) > 3)then {
			_targets = allPlayers select {(_x distance player) < 100};
			[player,"repair"] remoteExecCall ["DS_fnc_playSounds",_targets];
			sleep 2.5;
		} else {
			player say3D "repair";
			sleep 2.5;
		};
	};
};

_targets = allPlayers select {(_x distance player) < 200};
[player,"AinvPknlMstpSnonWnonDnon_medicUp3"] remoteExecCall ["DS_fnc_animSync",_targets];

player playMoveNow "AinvPknlMstpSnonWnonDnon_medicUp3";

if((player getVariable ["policeSquad",""]) == "Rapid Response")then{_sleep = 0.03};
if((player getVariable ["mechanic",false])&&((DS_infoArray select 23) > 18))then{_sleep = 0.03};
while{true} do {
	sleep _sleep;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player distance _vehicle > 10) exitWith {};
	if(!isNull objectParent player) exitWith {};
	if(DS_moved) exitWith {};
};
DS_doingStuff = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitwith{};
if(player distance _vehicle > 10) exitWith {hint "You moved too far from the vehicle";["repairKit",true,1] call DS_fnc_handleInventory;};
if(!isNull objectParent player) exitWith {hint "You must remain outside the vehicle to repair it";["repairKit",true,1] call DS_fnc_handleInventory;};
if(DS_moved) exitWith {DS_moved = false;hint "You must not move while repairing a vehicle";["repairKit",true,1] call DS_fnc_handleInventory;};

_vehicle setDamage 0;
if(fuel _vehicle < 0.01)then {
	if(!local _vehicle) then {
		[[_vehicle],{_this select 0 setFuel ((Fuel (_this select 0)) + 0.2);}] remoteExec ["BIS_fnc_spawn",_vehicle];
	} else {
		_vehicle setFuel ((fuel _vehicle) + 0.2);
	};
};
titleText [format ["You have repaired this %1",_vehicleString],"PLAIN"];

if((DS_infoArray select 13) == 2)then {
	[0] call DS_fnc_questCompleted;
};