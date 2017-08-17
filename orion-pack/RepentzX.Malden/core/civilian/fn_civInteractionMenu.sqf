#include "..\..\script_macros.hpp"
/*
    File: fn_copInteractionMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Replaces the mass addactions for various cop actions towards another player.
*/
//Tie
#define Btn1 9519511
//Escort
#define Btn2 9519512
//WIP
#define Btn3 9519513
//Search
#define Btn4 9519514
//Blindfold
#define Btn5 9519515
//PutInVeh
#define Btn6 9519516
//GPSTracker
#define Btn7 9519517
//RemoveComs
#define Btn8 9519518
//Gag
#define Btn9 9519519

private ["_display","_curTarget","_seizeRank","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];

disableSerialization;
_curTarget = param [0,objNull,[objNull]];
//_seizeRank = LIFE_SETTINGS(getNumber,"seize_minimum_rank");

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if (!dialog) then {
    createDialog "life_civPInteraction";
};

_display = findDisplay 951951;
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

if (player getVariable ["isEscorting",false]) then {
    { _x ctrlShow false; } forEach [_Btn1,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
    _Btn2 ctrlEnable true;			
};

if (player getVariable ["isEscorting",false]) then {
    _Btn2 ctrlSetTooltip localize "STR_pInAct_StopEscort";
    _Btn2 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn2 ctrlSetTooltip localize "STR_pInAct_Escort";
    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

_Btn6 ctrlSetTooltip localize "STR_pInAct_PutInCar";
_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

//SeizeWeapons Button
_Btn4 ctrlSetTooltip localize "STR_pInAct_Seize";
_Btn4 buttonSetAction "[] remoteExecCall [""life_fnc_removeWeaponAction"",life_pInact_curTarget]; closeDialog 0;";

if ((_curTarget getVariable ["blindfolded", false])) then {
    _Btn5 ctrlSetTooltip "Remove blindfold";
    _Btn5 buttonSetAction "[] call life_fnc_untieb; closeDialog 0;";
} else {
    _Btn5 ctrlSetTooltip "Blindfold Person";
    _Btn5 buttonSetAction "[] call life_fnc_tieingActionb; closeDialog 0;";
};

if ((_curTarget getVariable ["gagged", false])) then {
    _Btn9 ctrlSetTooltip "Remove Gag";
    _Btn9 buttonSetAction "[] call life_fnc_removeGagAction; closeDialog 0;";
} else {
    _Btn9 ctrlSetTooltip "Gag Person";
    _Btn9 buttonSetAction "[] call life_fnc_gagAction; closeDialog 0;";
};

_Btn7 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_gpsTracker; closeDialog 0;";
_Btn7 ctrlSetTooltip "Attach A GPS Tracker";

if (!(_curTarget getVariable ["tied", false])) then {
    _Btn1 ctrlSetTooltip "Ziptie Person";
    _Btn1 buttonSetAction "[] call life_fnc_tieingAction; closeDialog 0;";
    _Btn2 ctrlEnable false;
    _Btn4 ctrlEnable false;
    _Btn5 ctrlEnable false;
    _Btn6 ctrlEnable false;
	_Btn7 ctrlEnable false;
	_Btn8 ctrlEnable false;
	_Btn9 ctrlEnable false;
} else {
    _Btn1 ctrlSetTooltip "Remove Zipties";
    _Btn1 buttonSetAction "[] call life_fnc_untie; closeDialog 0;";
};


_Btn8 ctrlSetText "Take Coms and GPS";
_Btn8 buttonSetAction "[life_pInact_curTarget, _group] call life_fnc_ComRemoval;";

_Btn3 ctrlEnable false; 
