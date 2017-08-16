/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
life_vInact_curTarget = _curTarget;

//Button 1 - Set vehicle repair action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

if ((life_inv_toolkit >= 1) && {alive life_vInact_curTarget} && {([life_vInact_curTarget] call life_fnc_isDamaged)}) then {
        _Btn1 ctrlEnable true;
    } else {
        _Btn1 ctrlEnable false;
    };


//Button 3 - Set pushboat action if curTarget is a boat else if curTarget is a kart displays some kart actions
if(_curTarget isKindOf "Ship") then
{
	_Btn3 ctrlSetText localize "STR_vInAct_PushBoat";
	_Btn3 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
	if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then
	{
		_Btn3 ctrlEnable true;
	} else {
	    _Btn3 ctrlEnable false
	};
} else {
	if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_medevac_F"]) then
	{
		_Btn3 ctrlSetText localize "STR_vInAct_GetInKart";
		_Btn3 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
		if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then
		{
		    _Btn3 ctrlEnable true;
		} else {
			_Btn3 ctrlEnable false
		};
	} else {
		_Btn3 ctrlSetText localize "STR_vInAct_Unflip";
		_Btn3 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		if(count crew _curTarget == 0 && {canMove _curTarget}) then
		{
			_Btn3 ctrlEnable false;
		} else {
			_Btn3 ctrlEnable true;
		};
	};
};

//Button 4 - Set lockpick action
_Btn4 ctrlSetText localize "STR_vInAct_Lockpick";
_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_lockpick; closeDialog 0;";

if ( life_inv_lockpick >= 1 || { life_inv_snapgun >= 1 } ) then 
{
    _Btn4 ctrlEnable true;
        } else {
            _Btn4 ctrlEnable false;
        };

//Button 5 - Set devicemine action if the curTarget is the required truck
if(typeOf _curTarget == "O_Truck_03_device_F") then
{
	_Btn5 ctrlSetText localize "STR_vInAct_DeviceMine";
	_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
	if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then
	{
		_Btn5 ctrlEnable false;
	} else {
		_Btn5 ctrlEnable true;
	};
} else {
	_Btn5 ctrlShow false;
};

_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;