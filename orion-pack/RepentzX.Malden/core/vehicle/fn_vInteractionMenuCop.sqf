#include "..\..\script_macros.hpp"
/*
    File: fn_vInteractionMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Replaces the mass add actions for various vehicle actions.
*/
//push
#define Btn1 3573571 //Done
//impound
#define Btn2 3573572 //Done
//search
#define Btn3 3573573 //Done 
//crush
#define Btn4 3573574 //Done
//gps
#define Btn5 3573575
//refuel
#define Btn6 3573576 //Done
//wip
#define Btn7 3573577 //Done
//rego
#define Btn8 3573578 //Done
//pullout
#define Btn9 3573579 //Done
//Repair
#define Btn10 6 //Done
//Unflip
#define Btn11 5 //Done
private ["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_id"];
if (!dialog) then {
    createDialog "life_copVInteraction";
};
disableSerialization;

_curTarget = param [0,objNull,[objNull]];
if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if ((_curTarget isKindOf "landVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if (!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 357357;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Btn11 = _display displayCtrl Btn11;
life_vInact_curTarget = _curTarget;
_id = getObjectDLC _curTarget;

_Btn7 ctrlEnable false;
_Btn6 ctrlEnable false;

_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch; closeDialog 0;";
_Btn3 ctrlSetTooltip "Search Vehicle";

_Btn9 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";
if (crew _curTarget isEqualTo []) then {_Btn9 ctrlEnable false;} else {_Btn9 ctrlSetTooltip "Pull Out Players";};

_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";
_Btn2 ctrlSetTooltip "Impound Vehicle";

if((FETCH_CONST(life_coplevel) > 3 ) && !(_curTarget isKindOf "Cargo_base_F")) then {
    _Btn4 buttonSetAction "[] spawn life_fnc_CrushAction; closeDialog 0;";
	_Btn4 ctrlSetTooltip "Crush Vehicle";
};

_Btn1 buttonSetAction "[] spawn life_fnc_pushVehicle; closeDialog 0;";
if (alive _curTarget && {local _curTarget} && {crew _curTarget isEqualTo []}) then { _Btn1 ctrlEnable true; _Btn1 ctrlSetTooltip "Push Vehicle";} else {_Btn1 ctrlEnable false};

if (count (nearestObjects [_curTarget, ["Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F"], 15]) > 0) then {
	_Btn6 ctrlSetTooltip "Refuel Vehicle";
    _Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_fuelSupply";
    _Btn6 ctrlEnable true;
} else {
    {
        if (player distance (getMarkerPos _x) < 20) exitWith {
            _Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_fuelStore";
            _Btn6 ctrlEnable true;
			_Btn6 ctrlSetTooltip "Refuel Vehicle";
        };
    } forEach ["fuel_storage_1","fuel_storage_2"];
};

_Btn5 buttonSetAction "[cursorTarget] spawn life_fnc_gpsTracker; closeDialog 0;";
if ((life_inv_gpstracker >= 1) && {alive life_vInact_curTarget}) then {_Btn5 ctrlEnable true; _Btn5 ctrlSetTooltip "Attach A GPS Tracker";} else {_Btn5 ctrlEnable false;};

_Btn8 ctrlSetTooltip localize "STR_vInAct_Registration";
_Btn8 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

_Btn10 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
if(alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn10 ctrlEnable false;} else {_Btn10 ctrlEnable true; _Btn10 ctrlSetTooltip localize "STR_vInAct_Unflip"; };

_Btn11 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";
if ((life_inv_toolkit >= 1) && {alive life_vInact_curTarget} && {([life_vInact_curTarget] call life_fnc_isDamaged)}) then {_Btn11 ctrlEnable true; _Btn11 ctrlSetTooltip "Repair Vehicle";} else {_Btn11 ctrlEnable false;};