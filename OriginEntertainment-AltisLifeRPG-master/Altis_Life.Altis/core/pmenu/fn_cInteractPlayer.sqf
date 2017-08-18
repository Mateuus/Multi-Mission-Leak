/*
	File: fn_cInteractPlayer.sqf
	Modified: by Kai
*/
private["_display","_curTarget","_Btn1"];
createDialog "cInteractPlayer_Menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {hint "Wrong target!"; closeDialog 0;}; //Bad target

_display = findDisplay 61000;
_Btn1 = _display displayCtrl 61002;
/*
_Btn2 = _display displayCtrl 61003;
_Btn3 = _display displayCtrl 61004;
_Btn4 = _display displayCtrl 61005;
_Btn5 = _display DisplayCtrl 61006;
_Btn6 = _display DisplayCtrl 61007;
_Btn7 = _display DisplayCtrl 61008;
_Btn8 = _display DisplayCtrl 61009;
*/
life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText localize "STR_pInAct_Breathalyzer";
_Btn1 buttonSetAction "[[player],""life_fnc_breathalyzer"",life_pInact_curTarget,FALSE] spawn life_fnc_MP;closeDialog 0";
/*
//Truck License
_Btn2 buttonSetAction "[[11],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";

//Pilot License
_Btn3 buttonSetAction "[[12],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";

//Boating License
_Btn4 buttonSetAction "[[13],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";

//Diving License
_Btn5 buttonSetAction "[[14],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";


//Taxi License
_Btn6 buttonSetAction "[[15],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";



//All Motor Vehicle Licenses
_Btn7 buttonSetAction "[[16],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";

//Firearm License
_Btn8 buttonSetAction "[[17],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";
*/
