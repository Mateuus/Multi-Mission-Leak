/*  File Original: fn_copInteractionMenu.sqf
    Author: TONIC
    File: fn_civInteractionMenu.sqf
    Author: Lucas the Lucas
    
    Description:
    monkey
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
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

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
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button

if((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "") then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
_Btn1 ctrlSetText "Untie";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

	
//Set Blindfold Button
if((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "") then {_Btn7 ctrlEnable true;} else {_Btn7 ctrlEnable false;};
if((_curTarget getVariable ["blindfolded",FALSE])) then {
    _Btn7 ctrlSetText "Remove Blindfold";
    _Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_untieb; closeDialog 0; [life_pInact_curTarget] call life_fnc_civInteractionMenu;";
} else {
    _Btn7 ctrlSetText "Blindfold";
    _Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_tieingActionb; closeDialog 0;";
};

//Destroy Radio
_Btn5 ctrlSetText "Destroy Radio";
_Btn5 buttonSetAction "closeDialog 0;[life_pInact_curTarget] call life_fnc_destroyradio;";
if((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "") then {_Btn5 ctrlEnable true;} else {_Btn5 ctrlEnable false;};


//Take Phone FIX FIX FIX MAKE IDK FIX IT
_Btn6 ctrlSetText "Drain Battery";
_Btn6 buttonSetAction "closeDialog 0;[life_pInact_curTarget] call life_fnc_battery;";
//if((life_pInact_curTarget batterylevel = 0)) then {_Btn6 ctrlEnable false;};
if((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "") then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false;};



//Set Escort Button
if((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "") then {_Btn4 ctrlEnable true;} else {_Btn4 ctrlEnable false;};
if((_curTarget getVariable["Escorting",false])) then {
    _Btn4 ctrlSetText "Stop Escorting";
    _Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_civstopescort; [life_pInact_curTarget] call life_fnc_civInteractionMenu;";
} else {
    _Btn4 ctrlSetText "Escort";
    _Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_civescort; closeDialog 0;";
};

//Weapon Search
if((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "") then {_Btn8 ctrlEnable true;} else {_Btn8 ctrlEnable false;};
_Btn8 ctrlSetText "Weapon Search";
_Btn8 buttonSetAction "[[],""life_fnc_removeWeaponAction"",life_pInact_curTarget,false] spawn life_fnc_mp; closeDialog 0;";

//set put in vehicle
_Btn9 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn9 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";
//Disable options
if(playerSide == civilian) then {
	_Btn2 ctrlShow False;
    _Btn3 ctrlShow False;
	//disable some shit
	_Btn2 ctrlEnable False;
	_Btn3 ctrlEnable False;
    };