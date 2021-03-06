#include <macro.h>
/*
	File: fn_medInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: G00golplexian
	
	Description:
	Replaces the mass addactions for various medics actions towards another player.
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_hudbig"];
if(!dialog) then {
	createDialog "Interaction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_hudbig = _display displayCtrl 37401;

_hudselection = [] call life_fnc_hudcfg;
switch(((_hudselection select hudselection) select 3)) do {
	case 0: {_hudbig ctrlSetText "images\hud\hudleftbig.paa"};
	case 1: {_hudbig ctrlSetText "images\hud\hudleftbig2.paa"};
	case 2: {_hudbig ctrlSetText "images\hud\hudleftbig3.paa"};
	case 3: {_hudbig ctrlSetText "images\hud\hudleftbig4.paa"};
	case 4: {_hudbig ctrlSetText "images\hud\hudleftbig5.paa"};
	case 5: {_hudbig ctrlSetText ""};
};

_hudbig ctrlSetTextColor [1,1,1,1];

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

_title = _display displayCtrl 37403;
_title ctrlSetText "Notfallinteraktion";


//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>", localize "STR_pInAct_StopEscort"];
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_medInteractionMenu;";
} else {
	_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>", localize "STR_pInAct_Escort"];
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Set PutInCar Button
_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>", localize "STR_pInAct_PutInCar"];
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

//Set Ticket Button
_Btn3 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Abrechnung</t>";
_Btn3 buttonSetAction "[0,life_pInact_curTarget] call life_fnc_ticketAction;";

{_x ctrlEnable false; _x ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar.</t>"} foreach [_btn4,_btn5,_btn6,_btn7,_btn8,_btn9,_btn10];