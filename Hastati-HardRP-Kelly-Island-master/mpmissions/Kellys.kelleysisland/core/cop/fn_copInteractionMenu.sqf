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

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];

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
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

//Set Check Licenses Button
_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn2 buttonSetAction "[player] remoteExecCall [""life_fnc_licenseCheck"",life_pInact_curTarget];";

//Set Search Button
_Btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_copInteractionMenu;";
} else {
	_Btn4 ctrlSetText localize "STR_pInAct_Escort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Set Ticket Button
_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

_Btn6 ctrlSetText localize "STR_pInAct_Arrest";
_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_arrestAction;";

_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

//Check that you are near a place to jail them.
if(!((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30))) then  {
	_Btn6 ctrlEnable false;
};
		
