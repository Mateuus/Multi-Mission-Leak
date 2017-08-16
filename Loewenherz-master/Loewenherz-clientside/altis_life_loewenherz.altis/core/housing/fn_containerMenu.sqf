
/*
	File : containerMenu.sqf
	Author: NiiRoZz

	Description:
	Container interaction menu
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

private["_container","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
disableSerialization;
_container = param [0,ObjNull,[ObjNull]];
if(isNull _container) exitWith {}; //Bad target

if(!dialog) then {
	createDialog "pInteraction_Menu";
};

_Btn1 = (findDisplay 37400) displayCtrl Btn1;
_Btn2 = (findDisplay 37400) displayCtrl Btn2;
_Btn3 = (findDisplay 37400) displayCtrl Btn3;
_Btn4 = (findDisplay 37400) displayCtrl Btn4;
_Btn5 = (findDisplay 37400) displayCtrl Btn5;
_Btn6 = (findDisplay 37400) displayCtrl Btn6;
_Btn7 = (findDisplay 37400) displayCtrl Btn7;
{_x ctrlShow false;} foreach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7];

lhm_pInact_container = _container;
if(playerSide isEqualTo west) then {
	_Btn1 ctrlSetText localize "STR_vInAct_SearchContainer";
	_Btn1 buttonSetAction "[lhm_pInact_container] spawn lhm_fnc_containerInvSearch; closeDialog 0;";
	_Btn1 ctrlShow true;
} else {
	_Btn1 ctrlSetText localize "STR_pInAct_RemoveContainer";
	_Btn1 buttonSetAction "[lhm_pInact_container] spawn lhm_fnc_removeContainer; closeDialog 0;";
	_Btn1 ctrlShow true;
};
