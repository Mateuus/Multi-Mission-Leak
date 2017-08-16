#include <macro.h>
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Btn11 37460
#define Btn12 37461
#define Btn13 37462
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_Btn13"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if (player getVariable ["restrained", true]) exitWith {closeDialog 0;};

		
//if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
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
_Btn10 = _display displayCtrl Btn10;
_Btn11 = _display displayCtrl Btn11;
_Btn12 = _display displayCtrl Btn12;
_Btn13 = _display displayCtrl Btn13;



		
if(playerSide == civilian) then	{	_Btn7 ctrlShow false;};
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;
		_Btn11 ctrlShow false;
		_Btn12 ctrlShow false;
		_Btn13 ctrlShow false;
		
		

life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
if(_curTarget getVariable["restrained",false]) then {
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
};

//item geben
_Btn4 ctrlSetText "Items Geben";
_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_giveItemAction; closeDialog 0;";

_Btn6 ctrlSetText "Schlüssel Geben";
_Btn6 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_giveKeyAction;";

_Btn5 ctrlSetText "Geld geben";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_giveMoneyAction;";

_Btn7 ctrlSetText "Rechnung";
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

//Set Escort Button
if(_curTarget getVariable["restrained",false]) then
{
if((_curTarget getVariable["Escorting",false])) then {
	_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_civInteractionMenu;";
} else {
	_Btn2 ctrlSetText localize "STR_pInAct_Escort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};
};

if(_curTarget getVariable["restrained",false]) then {
_Btn3 ctrlShow true;
_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

};
