/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.

	Modified for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
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

private ["_curTarget","_display","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];


disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];

if(_curTarget isKindOf "MAN" && isplayer _curTarget && !alive _curTarget) exiTWith {closeDialog 0;};
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(_curTarget isKindOf "MAN" && !alive _curTarget) exiTWith {closeDialog 0;};


if(_curTarget isKindOf "MAN" && isplayer _curTarget && alive _curTarget) exitWith {
		closeDIalog 0;
		createDialog "interactionmenu_loewenherz";
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
		lhm_pInact_curTarget = _curTarget;

		_Btn1 ctrlSetText  "Heilen";
		_Btn1 buttonSetAction "[{  LHM_Disease_healed = true; hint ""Sie können nun für 15 Minuten nicht mehr infiziert werden."";sleep 900; LHM_Disease_healed = false; },""BIS_fnc_spawn"", [lhm_pInact_curTarget], false] call LHM_fnc_MP;";

		_Btn2 ctrlShow false;
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;

};

closeDialog 0;