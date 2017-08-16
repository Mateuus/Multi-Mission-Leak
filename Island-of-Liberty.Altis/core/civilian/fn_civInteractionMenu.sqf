#include "..\..\script_macros.hpp"
/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
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

disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!dialog) then {
	createDialog "pInteraction_Menu";
};
		
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
if(player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
life_pInact_curTarget = _curTarget;

//Button 1 - Set unrestrain button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_civunrestrain2; closeDialog 0;";

if((life_inv_pliers > 0) && (_curTarget GVAR ["civrestrained",false])) then
{
    _Btn1 ctrlEnable true;
} else {
if((life_inv_handcuffkeys > 0) && (_curTarget GVAR ["restrained",false])) then
{
    _Btn1 ctrlEnable true;
} else {
    _Btn1 ctrlEnable false;
	};
};

//Button 2 - Set Escort Button
if((_curTarget GVAR ["Escorting",false])) then {
    _Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn2 ctrlSetText localize "STR_pInAct_Escort";
    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

if((_curTarget GVAR ["civrestrained",false])) then
{
    _Btn2 ctrlEnable true;
} else {
    _Btn2 ctrlEnable false;
};

//Button 3 - Set put in car button
_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

//Button 4 - Set Lockpick Button
_Btn4 ctrlSetText localize "STR_pInAct_Lockpick";
_Btn4 buttonSetAction "[] spawn life_fnc_lockpick; closeDialog 0;";

if((_curTarget GVAR ["restrained",false]) && (life_inv_lockpick > 0)) then
{
    _Btn4 ctrlEnable true;
} else {
    _Btn4 ctrlEnable false;
};

//Button 5 - undefined
_Btn5 ctrlSetText "Foltern";
_Btn5 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_torture; closeDialog 0;";

if(((life_inv_pliers > 0) && (player distance (getMarkerPos "gang_area_1") < 30)) OR ((life_inv_pliers > 0) && (player distance (getMarkerPos "gang_area_2") < 30)) OR ((life_inv_pliers > 0) && (player distance (getMarkerPos "gang_area_3") < 30)))then
{
    _Btn5 ctrlEnable true;
} else {
    _Btn5 ctrlEnable false;
};
//Button 6 - undefined
_Btn6 ctrlSetText "Organ stehlen";
_Btn6 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_takeOrgans; closeDialog 0;";

if(life_inv_knife > 0) then
{
    _Btn6 ctrlEnable true;
} else {
    _Btn6 ctrlEnable false;
};
//Button 7 - undefined
_Btn7 ctrlShow false;

_Btn8 ctrlShow false;