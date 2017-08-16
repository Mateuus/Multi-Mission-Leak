/*
	File: fn_cop_classification_open.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de


	Info:
	1 - Kavala
	2 - BP_West
	3 - BP_West2
	4 - BP_Mitte
	5 - BP_Ueberall
	6 - BP_East
	7 - AP1
	8 - AP2
	9 - HWP
	10 - Sonstige
*/

#define Btn1 2400
#define Btn2 2401
#define Btn3 2402
#define Btn4 2403
#define Btn5 2404
#define Btn6 2405
#define Btn7 2406
#define Btn8 2407
#define Btn9 2408
#define Btn10 2409
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
_curTarget = cursorTarget;
if(!(playerside in [west,east])) exitWith {hint "Du bist kein Cop oder Sec!";};
closeDialog 0;

createDialog "interactionmenu_loewenherz";

disableSerialization;


_display = findDisplay 999;
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

_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_repairTruck;";

if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};


_Btn2 ctrlSetText localize "STR_vInAct_Registration";
_Btn2 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_searchVehAction;";

_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
_Btn3 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_vehInvSearch;";

_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
_Btn4 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_pulloutAction;";
if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};

_Btn5 ctrlSetText localize "STR_vInAct_Impound";
_Btn5 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_impoundAction;";

_Btn6 ctrlSetText "Checkpoint";
_Btn6 buttonSetAction "closeDialog 0;[] spawn lhm_fnc_cop_build_truck_start1;";

_Btn7 ctrlShow false;

_Btn8 ctrlShow false;

_Btn9 ctrlShow false;

_Btn10 ctrlShow false;



