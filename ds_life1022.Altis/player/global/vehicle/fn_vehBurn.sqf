/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Burns out a vehicle
*/

private ["_tempNum","_owner","_vehicleData","_vehicle","_vehicleString","_sleep","_isValid","_progress","_ui","_chance","_copCar","_targets"];

if((player inArea "safezone")||(player inArea "safezone_1"))exitwith{hint "You can not use this item in this area"};
closeDialog 0;
_copCar = false;
if(!isNull objectParent player) exitWith {};
_vehicle = DS_cursorTarget;
DS_moved = false;
_isValid = false;
if(!alive _vehicle)exitwith{};
DS_doingStuff = true;
if(_vehicle getVariable ["policeVehicle",false])then{_copCar = true};
_sleep = 0.12;//Alter later on for moral and mechanics
if((DS_infoArray select 17) > 40)then {
	_sleep = (_sleep*0.5);
};
_chance = random 100;
_pods = ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F",
				"B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"];
if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(_vehicle isKindOf "Tank")||(typeOf _vehicle in _pods))then {
	_isValid = true;
};
if(!_isValid)exitwith{DS_doingStuff = false;hint "This is an invalid vehicle type"};
if(player distance _vehicle > 7)exitwith{DS_doingStuff = false;};
if((locked _vehicle) == 2)exitwith{DS_doingStuff = false;hint "The vehicle must be unlocked before you can do this"};
_vehicleData = _vehicle getVariable["vehicle_owners",[]];
_owner = (_vehicleData select 0) select 0;
if(((_vehicleData select 0)select 1) == name player)exitwith{DS_doingStuff = false;hint "You can not use this on your own vehicle"};
["lighter",false,1] call DS_fnc_handleInventory;

_vehicleString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_upp = format["Lighting the fuel tank of this %1",_vehicleString];
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

_targets = allPlayers select {(_x distance player) < 100};
[player,"lighter"] remoteExecCall ["DS_fnc_playSounds",_targets];

_targets = allPlayers select {(_x distance player) < 200};
[player,"AinvPknlMstpSnonWnonDnon_medicUp3"] remoteExecCall ["DS_fnc_animSync",_targets];

player playMoveNow "AinvPknlMstpSnonWnonDnon_medicUp3";

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
if(player distance _vehicle > 10) exitWith {hint "You moved too far from the vehicle";["lighter",true,1] call DS_fnc_handleInventory;};
if(!isNull objectParent player) exitWith {hint "You must remain outside the vehicle to light its fuel tank";["lighter",true,1] call DS_fnc_handleInventory;};
if(DS_moved) exitWith {DS_moved = false;hint "You must not move while lighting a fuel tank";["lighter",true,1] call DS_fnc_handleInventory;};

titleText ["Fuse lit, run!!!!","PLAIN"];

_sp = (position player);
_smoke = "SmokeShellRed";
_smokeSpawn = _smoke createVehicle _sp;
sleep 20;
_vehicle setDamage 1;
["521"] spawn DS_fnc_addCharge;

if((DS_tokenMission == 15)&&(_copCar))then {
	DS_tokenMission = -1;
	[40,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
};

if((DS_infoArray select 17) == 2)then { [2] call DS_fnc_questCompleted };
if((_copCar)&&((DS_infoArray select 17) == 40))then {
	_tempNum = (DS_infoArray select 18) + 1;
	if(_tempNum > 9)then {
		[2] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [18,_tempNum];
	};
};