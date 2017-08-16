/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Refuels vehicle
*/

private ["_vehicle","_vehicleString","_sleep","_isValid","_progress","_ui"];
closeDialog 0;
_vehicle = DS_cursorTarget;
DS_moved = false;
_isValid = false;
DS_doingStuff = true;
_sleep = 0.12;//Alter later on for moral and mechanics
_pods = ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F",
				"B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"];
if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(_vehicle isKindOf "Tank")||(typeOf _vehicle in _pods))then
	{
	_isValid = true;
	};
if(!_isValid)exitwith{hint "This is an invalid vehicle type";DS_doingStuff = false;};
if(player distance _vehicle > 12)exitwith{DS_doingStuff = false;};
["refuelKit",false,1] call DS_fnc_handleInventory;

_vehicleString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_upp = format["Refuelling %1",_vehicleString];
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

_targets = allPlayers select {(_x distance player) < 200};
[player,"AinvPknlMstpSnonWnonDnon_medicUp3"] remoteExecCall ["DS_fnc_animSync",_targets];

player playMoveNow "AinvPknlMstpSnonWnonDnon_medicUp3";

while{true} do
	{
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
if((typeOf _vehicle) in ["B_UAV_01_F"])exitWith{_vehicle setDamage 1;hint "You just dumped gas all over an electronic drone... Nice one"};
if(!isNull objectParent player) exitWith {hint "You must remain outside the vehicle to refuel it";["refuelKit",true,1] call DS_fnc_handleInventory;};
if(DS_moved) exitWith {DS_moved = false;hint "You must not move while refuelling a vehicle";["refuelKit",true,1] call DS_fnc_handleInventory;};

if(_vehicle isKindOf "Car")then {
	if(!local _vehicle) then {
		if((DS_infoArray select 13) > 16)then {
			[[_vehicle],{_this select 0 setFuel ((fuel (_this select 0)) + 0.8);}] remoteExec ["BIS_fnc_spawn",_vehicle];
		} else {
			[[_vehicle],{_this select 0 setFuel ((fuel (_this select 0)) + 0.4);}] remoteExec ["BIS_fnc_spawn",_vehicle];
		};
	} else {
		if((DS_infoArray select 13) > 16)then {
			_vehicle setFuel ((fuel _vehicle) + 0.8);
		} else {
			_vehicle setFuel ((fuel _vehicle) + 0.4);
		};
	};
};
if(_vehicle isKindOf "Ship")then {
	if(!local _vehicle) then {
		if((DS_infoArray select 13) > 16)then {
			[[_vehicle],{_this select 0 setFuel ((fuel (_this select 0)) + 1);}] remoteExec ["BIS_fnc_spawn",_vehicle];
		} else {
			[[_vehicle],{_this select 0 setFuel ((fuel (_this select 0)) + 0.9);}] remoteExec ["BIS_fnc_spawn",_vehicle];
		};
	} else {
		if((DS_infoArray select 13) > 16)then {
			_vehicle setFuel ((fuel _vehicle) + 1);
		} else {
			_vehicle setFuel ((fuel _vehicle) + 0.9);
		};
	};
};
if(_vehicle isKindOf "Air")then {
	if(!local _vehicle) then {
		if((DS_infoArray select 13) > 16)then {
			[[_vehicle],{_this select 0 setFuel ((fuel (_this select 0)) + 0.6);}] remoteExec ["BIS_fnc_spawn",_vehicle];
		} else {
			[[_vehicle],{_this select 0 setFuel ((fuel (_this select 0)) + 0.3);}] remoteExec ["BIS_fnc_spawn",_vehicle];
		};
	} else {
		if((DS_infoArray select 13) > 16)then {
			_vehicle setFuel ((fuel _vehicle) + 0.6);
		} else {
			_vehicle setFuel ((fuel _vehicle) + 0.3);
		};
	};
};

titleText [format ["You have refuelled this %1",_vehicleString],"PLAIN"];

sleep 10;
if((DS_infoArray select 13) == 16)then {
	[0] call DS_fnc_questCompleted;
};