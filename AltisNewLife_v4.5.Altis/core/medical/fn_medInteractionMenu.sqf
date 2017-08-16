if(player distance cursorTarget > 4) exitWith {};
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
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {createDialog "pInteraction_Menu";};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;};
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
life_pInact_curTarget = _curTarget;
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
if((_curTarget getVariable["Escorting",false])) then {
	_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_medInteractionMenu;";
} else {
	_Btn2 ctrlSetText localize "STR_pInAct_Escort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};
_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;closeDialog 0;";
_Btn4 ctrlSetText "Enfermer";
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_asile; closeDialog 0;";
_Btn5 ctrlSetText localize "STR_pInAct_Breathalyzer";
_Btn5 buttonSetAction "[[player],""life_fnc_breathalyzer"",life_pInact_curTarget,FALSE] spawn life_fnc_MP;closeDialog 0";
_Btn6 ctrlSetText "Desintoxiquer";
_Btn6 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_Therapieaction;";
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;	
if(life_inv_cle > 0) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
if(!(player distance (getMarkerPos "asile_marker") < 90)) then {	_Btn4 ctrlEnable false;};