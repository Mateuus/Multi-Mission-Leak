/*
	File: fn_copInteractionMenu.sqf
	
	
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
#define Btn10 37459
#define Btn11 37460
#define Btn12 37461
#define Btn13 37462
#define Btn14 37463
#define Btn15 37464
#define Btn16 37465
#define Btn17 37466
#define Btn18 37467
#define Btn19 37468
#define Btn20 37469
#define Btn21 37470
//#define PlrName 37000

#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
		
if(!isPlayer _curTarget || player distance _curTarget > 7) exitWith {closeDialog 0;};
	
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
//_PlrName = _display displayCtrl PlrName;
//_profName = name _curTarget;
//_PlrName ctrlSetText _profName;

_Btn1 ctrlEnable true;
_Btn2 ctrlEnable true;
_Btn3 ctrlEnable true;
_Btn4 ctrlEnable true;
_Btn5 ctrlEnable true;

_Btn6 ctrlEnable true;
_Btn7 ctrlEnable true;

_Btn8 ctrlEnable true;
_Btn9 ctrlEnable true;
_Btn10 ctrlEnable true;
_Btn11 ctrlEnable true;
_Btn12 ctrlEnable true;


life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText localize "STR_pInAct_PatDown";
_Btn1 buttonSetAction "[] remoteExecCall [""life_fnc_removeWeaponAction"",life_pInact_curTarget]; closeDialog 0;";

if (( _curTarget getVariable ["tied", false] || animationState _curTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" )) then {
} else {
_Btn1 ctrlEnable false;		
};

_Btn2 ctrlSetText "Rabuj";
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_robAction; closeDialog 0;";
if (!(_curTarget getVariable["robbed", false]) && (_curTarget getVariable ["tied", false])) then {
} else {
_Btn2 ctrlEnable false;		
};

_Btn3 ctrlSetText "Zwiaz osobe";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_tieingAction; closeDialog 0;";
if( (animationState cursorTarget == "Incapacitated" || animationState cursorTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" ) ) then {

} else {
 _Btn3 ctrlEnable false;		
};

_Btn4 ctrlSetText "Rozwiaz liny";
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_untie; closeDialog 0;";

if ((_curTarget getVariable ["tied", false])) then {

} else {
_Btn4 ctrlEnable false;		
};

_Btn5 ctrlSetText "Zaloz worek";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_tieingActionb; closeDialog 0;";
if ((_curTarget getVariable ["tied", false])) then {

} else {
_Btn5 ctrlEnable false;		
};

_Btn6 ctrlSetText "Zdejmij worek";
_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_untieb; closeDialog 0;";
if ((_curTarget getVariable ["blindfolded", false])) then {
_Btn5 ctrlEnable false;	
} else {
_Btn6 ctrlEnable false;		
};

_Btn7 ctrlSetText "Wrzuc do pojazdu";
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_throwcar; closeDialog 0;";
if ((_curTarget getVariable ["tied", false])) then {
} else {
_Btn7 ctrlEnable false;		
};

_Btn8 ctrlSetText "Eskortuj";
_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
if ((_curTarget getVariable ["tied", false])) then {
} else {
_Btn8 ctrlEnable false;		
};

_Btn9 ctrlSetText "Przestan eskortowac";
_Btn9 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;";
if ((_curTarget getVariable["Escorting", false])) then {
	_Btn8 ctrlEnable false;	
} else {
_Btn9 ctrlEnable false;		
};


_Btn10 ctrlSetText "Zaknebluj";
_Btn10 buttonSetAction "[life_pInact_curTarget] call life_fnc_gaggingActionb; closeDialog 0;";
if ((cursorTarget getVariable ["tied", false])) then {
} else {
_Btn10 ctrlEnable false;		
};


_Btn11 ctrlSetText "Odknebluj";
_Btn11 buttonSetAction "[life_pInact_curTarget] call life_fnc_ungag; closeDialog 0;";
if ((cursorTarget getVariable ["gagged", false])) then {
_Btn10 ctrlEnable false;	
} else {
_Btn11 ctrlEnable false;		
};