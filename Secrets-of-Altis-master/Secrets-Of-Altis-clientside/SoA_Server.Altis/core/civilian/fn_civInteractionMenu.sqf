#include <macro.h>
/*
File: fn_civInteractionMenu.sqf
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

_title = _display displayCtrl 37403;
_title ctrlSetText "Spielerinteraktion";

life_pInact_curTarget = _curTarget;

_Btn1 ctrlEnable false;
_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Unrestrain"];
_Btn5 ctrlEnable false;
_Btn5 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Ausrauben</t>";

//Set Unrestrain Button
if(life_inv_kabelbinderkey > 0) then {
_Btn1 ctrlEnable true;
_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Unrestrain"];
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0; [false,'kabelbinderkey',1] call life_fnc_handleinv; [true,'kabelbinder',1] call life_fnc_handleinv;";
};

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_StopEscort"];
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_civInteractionMenu;";
} else {
_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Escort"];
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Set PutInCar Button
_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_PutInCar"];
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

_Btn4 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Foltern</t>";
_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_rebInteractionMenu;";

if (!(_curTarget getVariable["robbed",FALSE]) && currentWeapon player != "") then {
_Btn5 ctrlEnable true;
_Btn5 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Ausrauben</t>";
_Btn5 buttonSetAction "[] call life_fnc_robAction";
};

{_x ctrlEnable false; _x ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar.</t>"} foreach [_btn6,_btn7,_btn8,_btn9,_btn10];