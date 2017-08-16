#include <macro.h>
/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_hudbig"];
if(!dialog) then {
	createDialog "Interaction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;};

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
_title ctrlSetText "Polizeiinteraktion";

_Btn4 ctrlEnable false;
_Btn4 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Escort"];
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
_Btn6 ctrlEnable false;
_Btn6 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Arrest"];
_Btn6 buttonSetAction "closeDialog 0; [] call life_fnc_showArrestDialog;";
_Btn7 ctrlEnable false;
_Btn7 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_PutInCar"];
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

//Set Unrestrain Button
if(_curTarget getVariable["restrained",false]) then {
	_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Unrestrain"];
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
} else {
	_Btn1 ctrlEnable false;
	_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Unrestrain"];
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
};

//Set Check Licenses Button
_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_checkLicenses"];
_Btn2 buttonSetAction "[player] remoteExecCall [""life_fnc_licenseCheck"",life_pInact_curTarget]";

//Set Search Button
_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_SearchPlayer"];
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";

//Set Escort Button
if(_curTarget getVariable["restrained",false]) then {
	if(_curTarget getVariable["Escorting",false]) then {
		_Btn4 ctrlEnable true;
		_Btn4 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_StopEscort"];
		_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting;";
	} else {
		_Btn4 ctrlEnable true;
		_Btn4 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Escort"];
		_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	};
};

//Set Ticket Button
_Btn5 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_TicketBtn"];
_Btn5 buttonSetAction "[0,life_pInact_curTarget] call life_fnc_ticketAction;";

if(_curTarget getVariable["restrained",false]) then {
	_Btn6 ctrlEnable true;
	_Btn7 ctrlEnable true;
};

//Lizenz PKW
_Btn8 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Lizenzen entziehen</t>";
_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_scheinEntzug; closeDialog 0;";

//actually the Breathalyser button
_Btn9 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Breathalyzer"];
_Btn9 buttonSetAction "[player] remoteExecCall [""life_fnc_breathalyzer"",life_pInact_curTarget]; closeDialog 0";

//Check that you are near a place to jail them.
if(!(player distance (getMarkerPos "jail_release") < 30)) then {_Btn6 ctrlEnable false;};

{_x ctrlEnable false; _x ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar.</t>"} foreach [_btn10];