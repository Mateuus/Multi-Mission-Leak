#include "..\..\script_macros.hpp"
/*
    File: fn_copInteractionMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Replaces the mass addactions for various cop actions towards another player.
*/
//Restain
#define Btn1 1591591
//Escort
#define Btn2 1591592
//Jail
#define Btn3 1591593
//StripSearch
#define Btn4 1591594
//Licenses
#define Btn5 1591595
//PutInVehicle
#define Btn6 1591596
//GPS Tracker
#define Btn7 1591597
//Remove Coms
#define Btn8 1591598
//Ticket
#define Btn9 1591599
//Gag
#define Btn10 15915910

private ["_display","_curTarget","_seizeRank","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];

disableSerialization;
_curTarget = param [0,objNull,[objNull]];
_seizeRank = 2;

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if (!dialog) then {
    createDialog "life_copPInteract";
};

_display = findDisplay 159159;
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
life_pInact_curTarget = _curTarget;

if (player getVariable ["isEscorting",false]) then {
	{ _x ctrlEnable false; } forEach [_Btn1,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];
};
	
//Set Unrestrain Button
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
_Btn1 ctrlSetTooltip "Unrestrain Civilian";

//Set Check Licenses Button
_Btn5 buttonSetAction "[player] remoteExecCall [""life_fnc_licenseCheck"",life_pInact_curTarget]; closeDialog 0;";
_Btn5 ctrlSetTooltip "Check Civilian's Licenses";

//Set Search Button
_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";
_Btn4 ctrlSetTooltip "Strip Search Civilian";

//Set Escort Button
if (player getVariable ["isEscorting",false]) then {
	_Btn2 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
	_Btn2 ctrlSetTooltip "Stop Escorting Civilian";
} else {
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	_Btn2 ctrlSetTooltip "Escort Civilian";
};

//Set Ticket Button
_Btn9 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";
_Btn9 ctrlSetTooltip "Ticket Civilian";

_Btn3 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_showArrestDialog;";
_Btn3 ctrlSetTooltip "Send Civilian To Jail";
_Btn3 ctrlEnable false;

_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";
_Btn6 ctrlSetTooltip "Place Civilian In Car";

_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_ComRemovalCiv; closeDialog 0;";
_Btn8 ctrlSetTooltip "Remove The Civilians Communitcation With Gang Memebers";

_Btn7 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_gpsTracker; closeDialog 0;";
_Btn7 ctrlSetTooltip "Attach A GPS Tracker";

if (_curTarget getVariable ["gagged",false]) then {
	_Btn10 buttonSetAction "[life_pInact_curTarget] call life_fnc_removeGagAction; closeDialog 0;";
	_Btn10 ctrlSetTooltip "Ungag The Civilian";
} else {
	_Btn10 buttonSetAction "[life_pInact_curTarget] call life_fnc_gagAction; closeDialog 0;";
	_Btn10 ctrlSetTooltip "Gag The Civilian";
};

if (FETCH_CONST(life_coplevel) < _seizeRank) then {_Btn4 ctrlEnable false;};

{
	if ((player distance (getMarkerPos _x) < 200) && !(player getVariable ["isEscorting", false])) exitWith { _Btn3 ctrlEnable true;};
} forEach LIFE_SETTINGS(getArray,"sendtoJail_locations");
