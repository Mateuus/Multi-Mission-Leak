#include "..\..\script_macros.hpp"

/*
	File: fn_civInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/

//Glitch Fix

#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

private["_display","_unit","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];

disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if (!dialog) then {
    createDialog "pInteraction_Menu";
};

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

if (player getVariable ["isEscorting",false]) then {
    { _x ctrlShow false; } forEach [_Btn1,_Btn3,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8];
};

	//Set Robber Button
	_Btn1 ctrlSetText "Rob Player";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_robAction; closeDialog 0;";
	
	//Set Escort Button
	if (player getVariable ["isEscorting",false]) then {
	    _Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	    _Btn2 buttonSetAction "[] call life_fnc_civStopEscorting; closeDialog 0;";
	} else {
	    _Btn2 ctrlSetText localize "STR_pInAct_Escort";
	    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_civEscortAction; closeDialog 0;";
	};

	//Zip Button
	_Btn3 ctrlSetText localize "STR_pInAct_Zip";
	_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_civrestrainAction; closeDialog 0;";

	//Patdown
	_Btn4 ctrlSetText localize "STR_pInAct_PatDown";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_patDown;";

	//Destroy Comms Button
	//_Btn5 ctrlSetText "Destroy Comms";
	//_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_destroyComms; closeDialog 0;";

	//Unzip Button
	_Btn6 ctrlSetText "Remove Zipties";
	_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrainciv; closeDialog 0;";

	_Btn7 ctrlSetText  "Invite to Gang";
	_Btn7 buttonSetAction "[1,life_pInact_curTarget] spawn life_fnc_gangInvitePlayer; closeDialog 0;";
	if (isNil {(group player) getVariable 'gang_owner'}) then {_Btn5 ctrlEnable false} else {_Btn5 ctrlEnable true};
	if (side life_pInact_curTarget isEqualTo civilian) then {_Btn5 ctrlEnable true} else {_Btn5 ctrlEnable false};

	_Btn8 ctrlSetText localize "STR_pInAct_showLicenses";
	_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_showLicenses; closeDialog 0;";
	//if ((side _curTarget == west) || (side _curTarget == independent)) then {_Btn6 ctrlEnable true} else {_Btn6 ctrlEnable false};
