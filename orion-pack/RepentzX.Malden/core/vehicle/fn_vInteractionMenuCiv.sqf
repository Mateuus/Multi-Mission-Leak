#include "..\..\script_macros.hpp"
/*
    File: fn_vInteractionMenuCiv.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Replaces the mass add actions for various vehicle actions.
*/
//Push
#define Btn1 9159151 //Done
//PullOut
#define Btn2 9159152 //Done
//Unflip
#define Btn3 9159153 //Done
//Repair
#define Btn4 9159154 //Done
//Lockpick
#define Btn5 9159155 //Done
//Bomb
#define Btn6 9159156 //Done
//WIP
#define Btn7 9159157 //Done
//Refuel
#define Btn8 9159158 //Done
//GPS
#define Btn9 9159159 //Done
//MoveIn
#define Btn10 91591510 //Done
//Mine
#define Btn11 91591510 //Done
private ["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_id"];
if (!dialog) then {
    createDialog "life_civVInteraction";
};
disableSerialization;

_curTarget = param [0,objNull,[objNull]];
if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if ((_curTarget isKindOf "landVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if (!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 915915;
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
_Btn8 ctrlEnable false; 


//Set Repair Action
_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck; closeDialog 0;";
if ((life_inv_toolkit >= 1) && {alive life_vInact_curTarget} && {([life_vInact_curTarget] call life_fnc_isDamaged)}) then {_Btn4 ctrlEnable true; _Btn4 ctrlSetTooltip "Repair Vehicle";} else {_Btn4 ctrlEnable false;};


_Btn1 buttonSetAction "[] spawn life_fnc_pushVehicle; closeDialog 0;";
if (alive _curTarget && {local _curTarget} && {crew _curTarget isEqualTo []}) then { _Btn1 ctrlEnable true; _Btn1 ctrlSetTooltip "Push Vehicle"; } else {_Btn1 ctrlEnable false};

    
if (!isNil "_id") then {
    if !(_id in getDLCs 1) then {
        _Btn10 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
        if (crew _curTarget isEqualTo [] && {canMove _curTarget} && {locked _curTarget isEqualTo 0}) then {_Btn10 ctrlEnable true; _Btn10 ctrlSetTooltip "Get in Vehicle";} else {_Btn10 ctrlEnable false};
    };
} else {
    _Btn10 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
    if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn10 ctrlEnable false;} else {_Btn10 ctrlEnable true; _Btn10 ctrlSetTooltip "Get in Vehicle";};
};

if (count (nearestObjects [_curTarget, ["Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F"], 15]) > 0) then {
	_Btn8 ctrlSetTooltip "Refuel Vehicle";
    _Btn8 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_fuelSupply";
    _Btn8 ctrlEnable true;
} else {
    {
        if (player distance (getMarkerPos _x) < 20) exitWith {
            _Btn8 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_fuelStore";
            _Btn8 ctrlEnable true;
			_Btn8 ctrlSetTooltip "Refuel Vehicle";
        };
    } forEach ["fuel_storage_1","fuel_storage_2"];
};

if (typeOf _curTarget == "O_Truck_03_device_F") then {
    _Btn11 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
    if (!isNil {(_curTarget getVariable "mining")} || !local _curTarget && {_curTarget in life_vehicles}) then {
        _Btn11 ctrlEnable false;
    } else {
        _Btn11 ctrlEnable true; 
		_Btn11 ctrlSetTooltip "Activate Drill";
    };
};

_Btn6 buttonSetAction "[] spawn life_fnc_speedBomb; closeDialog 0;";
if ((life_inv_speedbomb >= 1) && {alive life_vInact_curTarget}) then {_Btn6 ctrlEnable true; _Btn6 ctrlSetTooltip "Attach A Speed Bomb To The Vehicle";} else {_Btn6 ctrlEnable false;};

_Btn9 buttonSetAction "[cursorTarget] spawn life_fnc_gpsTracker; closeDialog 0;";
if ((life_inv_gpstracker >= 1) && {alive life_vInact_curTarget}) then {_Btn9 ctrlEnable true; _Btn9 ctrlSetTooltip "Attach A GPS Tracker";} else {_Btn9 ctrlEnable false;};

_Btn5 buttonSetAction "[] spawn life_fnc_lockpick; closeDialog 0;";
if ((life_inv_lockpick >= 1) && {alive life_vInact_curTarget} && {locked _curTarget isEqualTo 1}) then {_Btn9 ctrlEnable true; _Btn5 ctrlSetTooltip "Lockpick Vehicle";} else {_Btn9 ctrlEnable false;};

_Btn3 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
if(alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn3 ctrlEnable false;} else {_Btn3 ctrlEnable true; _Btn3 ctrlSetTooltip localize "STR_vInAct_Unflip";};


_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
if(crew _curTarget isEqualTo []) then {_Btn2 ctrlEnable false;} else {_Btn2 ctrlSetTooltip localize "STR_vInAct_PullOut";};