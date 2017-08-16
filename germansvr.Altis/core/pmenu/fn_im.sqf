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
#define Btn9 37458
#define Title 37401

private ["_display","_curTarget","_seizeRank","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];

disableSerialization;
_curTarget = param [0,objNull,[objNull]];

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?
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
_Btn9 = _display displayCtrl Btn9;
life_pInact_curTarget = _curTarget;

if (playerSide == west) then {
	if (player getVariable ["isEscorting",false]) then {
		{ _x ctrlShow false; } forEach [_Btn1,_Btn2,_Btn3,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
	};
	if (life_pInact_curTarget getVariable "restrained") then {
		if (life_inv_key > 0) then {
			_Btn1 ctrlEnable true;
		} else {
			_Btn1 ctrlEnable false;
		};
	} else {
		_Btn1 ctrlEnable false;
	};

	//Set Unrestrain Button
	_Btn1 ctrlSetText "Befreien";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

	//Set Check Licenses Button
	_Btn2 ctrlSetText "Liz. Menu";
	_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lizmenu;";

	//Set Search Button
	_Btn3 ctrlSetText "Durchsuchen";
	_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";

	//Set Escort Button
	if (player getVariable ["isEscorting",false]) then {
		_Btn4 ctrlSetText "Los lassen";
		_Btn4 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
	} else {
		_Btn4 ctrlSetText "Escortieren";
		_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	};

	//Set Ticket Button
	_Btn5 ctrlSetText "Strafzettel";
	_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

	_Btn6 ctrlSetText "Ins Gefaengnis";
	_Btn6 buttonSetAction "closeDialog 0; [] call life_fnc_showArrestDialog;";
	_Btn6 ctrlEnable false;
	{
		if ((player distance (getMarkerPos _x) <30)) exitWith { _Btn6 ctrlEnable true;};
	} forEach LIFE_SETTINGS(getArray,"sendtoJail_locations");

	_Btn7 ctrlSetText "Ins Fahrzeug";
	_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

	//SeizeWeapons Button
	_Btn8 ctrlSetText "Entwaffenen";
	_Btn8 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_seizePlayerAction; closeDialog 0;";

	_Btn9 ctrlSetText "Alkohol Test";
	_Btn9 buttonSetAction "[player] remoteExec [""life_fnc_alkoholdrugtester"",life_pInact_curTarget];closeDialog 0";
};

if (playerSide == independent) then {
	_Btn1 ctrlShow false;
	
	_Btn2 ctrlShow false;
	
	_Btn3 ctrlShow false;
	
	_Btn4 ctrlShow false;

	//Set Ticket Button
	_Btn5 ctrlSetText "Rechnung";
	_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

	_Btn6 ctrlShow false;

	_Btn7 ctrlShow false;

	_Btn8 ctrlShow false;

	_Btn9 ctrlSetText "Alkohol Test";
	_Btn9 buttonSetAction "[player] remoteExec [""life_fnc_alkoholdrugtester"",life_pInact_curTarget];closeDialog 0";
};

if (playerSide == civilian) then {
	if (life_pInact_curTarget getVariable "restrained") then {
		_Btn1 ctrlSetText "Ausnehmen";
		_Btn1 buttonSetAction "[] spawn life_fnc_robAction";
	} else {
		_Btn1 ctrlEnable false;
	};
	
	_Btn2 ctrlShow false;

	_Btn3 ctrlShow false;
	
	_Btn4 ctrlShow false;
	
	_Btn5 ctrlShow false;

	_Btn6 ctrlShow false;

	_Btn7 ctrlShow false;

	_Btn8 ctrlShow false;

	_Btn9 ctrlShow false;
};

if (playerSide == east) then {
	if (player getVariable ["isEscorting",false]) then {
		{ _x ctrlShow false; } forEach [_Btn1,_Btn2,_Btn3,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
	};
	
	if (life_inv_key > 0) then {
		_Btn1 ctrlEnable true;
	} else {
		_Btn1 ctrlEnable false;
	};

	//Set Unrestrain Button
	_Btn1 ctrlSetText "Befreien";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

	// Ausrauben
	_Btn2 ctrlSetText "Ausnehmen";
	_Btn2 buttonSetAction "[] spawn life_fnc_robAction";

	//Set Search Button
	_Btn3 ctrlShow false;

	//Set Escort Button
	if (player getVariable ["isEscorting",false]) then {
		_Btn4 ctrlSetText "Los lassen";
		_Btn4 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
	} else {
		_Btn4 ctrlSetText "Escortieren";
		_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	};

	//Set Ticket Button
	_Btn5 ctrlShow false;
	
	_Btn6 ctrlShow false;

	_Btn7 ctrlSetText "Ins Fahrzeug";
	_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

	//SeizeWeapons Button
	_Btn8 ctrlSetText "Entwaffenen";
	_Btn8 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_seizePlayerAction; closeDialog 0;";

	_Btn9 ctrlShow false;
};