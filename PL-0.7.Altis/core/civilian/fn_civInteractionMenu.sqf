/*
    Original: fn_copInteractionMenu.sqf
    Author: Tonic
    File: fn_civInteractionMenu.sqf
    Edit: Wawixs

    Description:
    Menu d'interaction civil
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
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
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
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
if(life_inv_couteau <= 0) then {
	_Btn1 ctrlEnable false;
	hint localize "Il vous faut un couteau !";
} else {
	_Btn1 ctrlEnable true;
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
};

//
_Btn2 ctrlSetText localize "STR_pAct_RobPerson";
_Btn2 buttonSetAction "[] call life_fnc_robAction;";

//Escorter
if((_curTarget getVariable["Escorting",false])) then {
    _Btn3 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_civInteractionMenu;";
} else {
    _Btn3 ctrlSetText localize "STR_pInAct_Escort";
    _Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Mettre dans un véhicule
_Btn4 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

//Prendre un organe
_Btn5 ctrlSetText "Prendre rein";
_Btn5 buttonSetAction "[] spawn life_fnc_takeOrgans; closeDialog 0;";


//Mettre la cagoule
if ((_curTarget getVariable ["restrained",true]) && (!(_curTarget getVariable ["cagoule",false]))) then {
    _Btn6 ctrlSetText "Mettre Cagoule";
    _Btn6 buttonSetAction "[player] remoteExec [""life_fnc_mettreCagoule"",life_pInact_curTarget]; closeDialog 0;";
} else {
if ((_curTarget getVariable ["restrained",true]) && (_curTarget getVariable ["cagoule",true])) then {
    _Btn6 ctrlSetText "Enlever Cagoule";
    _Btn6 buttonSetAction "[player] remoteExec [""life_fnc_enleverCagoule"",life_pInact_curTarget]; closeDialog 0;";
    };
};

//Mettre le baillon
if ((_curTarget getVariable ["restrained",true]) && (!(_curTarget getVariable ["baillon",false]))) then {
    _Btn7 ctrlSetText "Mettre Baillon";
    _Btn7 buttonSetAction "[player] remoteExec [""life_fnc_mettreBaillon"",life_pInact_curTarget]; closeDialog 0;";
} else {
if ((_curTarget getVariable ["restrained",true]) && (_curTarget getVariable ["baillon",true])) then {
    _Btn7 ctrlSetText "Enlever Baillon";
    _Btn7 buttonSetAction "[player] remoteExec [""life_fnc_enleverBaillon"",life_pInact_curTarget]; closeDialog 0;";
    };
};

_Btn8 ctrlShow false;
_Btn9 ctrlShow false;