/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];
_vehicle = param [0,Objnull,[Objnull]];
if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Land_Suitcase_F" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "Tank")) exitWith {systemChat "OPEN TRUNK: BAD INFO PASSED";};
if((_vehicle getVariable ["trunk_in_use",false]) && (_vehicle getVariable ["trunk_used_by",""] != getPlayerUID player)) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse";};
if((_vehicle getVariable ["trunk_in_use",false]) && {((_vehicle getVariable["trunk_used_by",""]) != getPlayerUID player)}) then {_usedBy = (_vehicle getVariable ["trunk_used_by",""]);
    if(_usedBy != "") then {
        _ready = {getPlayerUID _x isEqualTo _usedBy} count playableUnits;
        if(_ready > 0) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse"};
    } else {
        _vehicle setVariable["trunk_in_use",false,true];
    };
};
_vehicle setVariable["trunk_in_use",true,true];
_vehicle setVariable["trunk_used_by",(getPlayerUID player),true];

if(!createDialog "TrunkMenu") exitWith {hintSilent localize "STR_MISC_DialogError";};
disableSerialization;

if(_vehicle isKindOf "Land_Suitcase_F") then {
  ((findDisplay 3500) displayCtrl 3501) ctrlSetText "Player Suitcase";
  ctrlEnable [3507,false];
} else {
  ((findDisplay 3500) displayCtrl 3501) ctrlSetText format ["%1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")];
  ctrlEnable [3507,true];
};

life_trunk = _vehicle getVariable ["Trunk",[]];
life_trunk_vehicle = _vehicle;
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && (life_trunk_vehicle getVariable ["trunk_used_by",""] != getPlayerUID player)) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse";};
call life_fnc_wrehufrutedru;

_vehicle spawn {
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable ["Trunk",life_trunk,true];
	_this setVariable["trunk_in_use",false,true];
	_this setVariable["trunk_used_by",nil,true];
	if(_this isKindOf "Land_Suitcase_F" && {count life_trunk isEqualTo 0}) then {deleteVehicle _this;};
	life_trunk = nil;
	life_trunk_vehicle = nil;
	life_trunk_weight = nil;
};
call life_fnc_kecedretr;
