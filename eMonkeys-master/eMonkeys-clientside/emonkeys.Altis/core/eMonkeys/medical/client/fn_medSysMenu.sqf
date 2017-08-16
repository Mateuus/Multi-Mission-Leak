/*
	File: fn_medSysMenu.sqf
	Author: DerOnkel
	E-Monkeys.com | Avanix-Gaming.de
	
	Description:
	Menu for Medicl System
*/
#define Btn1 11201 //Blutdruck messen
#define Btn2 11202 //Auf Verletzungen prüfen
#define Btn3 11203 //Verbinden
#define Btn4 11204 //Herzdruckmassage
#define Btn5 11205 //Reanimieren
#define Title 11200

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Title","_button","_button_list","_idx"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!dialog) then {
	createDialog "EMonkeys_medsys";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget && (side _curTarget in [east,civilian])) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 112112;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Title = _display displayCtrl Title;
EMonkeys_pInact_curTarget = _curTarget;

if (_curTarget isKindOf "Man") then
{
	/*
	//Blutdruck messen
	_Btn1 ctrlSetText "";
	_Btn1 buttonSetAction "[EMonkeys_pInact_curTarget] call EMonkeys_fnc_bloodPressure; closeDialog 0;";
		
	//Auf Verletzungen prüfen
	_Btn2 ctrlSetText "";
	_Btn2 buttonSetAction "[EMonkeys_pInact_curTarget] call EMonkeys_fnc_checkInjuries; closeDialog 0;";
	*/

	//Verbinden
	_Btn3 ctrlSetText "";
	_Btn3 buttonSetAction "[EMonkeys_pInact_curTarget] spawn EMonkeys_fnc_bandage; closeDialog 0;";
			
	//Herzdruckmassage
	_Btn4 ctrlSetText "";
	_Btn4 buttonSetAction "[EMonkeys_pInact_curTarget] spawn EMonkeys_fnc_hdm; closeDialog 0;";
			
	//Reanimieren
	_Btn5 ctrlSetText "";
	_Btn5 buttonSetAction "[EMonkeys_pInact_curTarget] spawn EMonkeys_fnc_revive; closeDialog 0;";
};

if(!((damage EMonkeys_pInact_curTarget ) > 0)) then 
{
	_Btn3 ctrlEnable false;
};

if(!(_curTarget isKindOf "Man" && ( _curTarget getVariable["onkill",FALSE]))) then
{
	_Btn4 ctrlEnable false;
	_Btn5 ctrlEnable false;
};
	