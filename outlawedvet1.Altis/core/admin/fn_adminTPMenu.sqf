#include "..\..\script_macros.hpp"
/*
	File: fn_adminteleport.sqf
	Author: RPGforYOU
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
if(FETCH_CONST(life_adminlevel) < 2) exitWith{};
#define Btn1 69501
#define Btn2 69502
#define Btn3 69503
#define Btn4 69504
#define Btn5 69505
#define Btn6 69506
#define Btn7 69507
#define Btn8 69508
#define Btn9 69509
#define Title 69510

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
createDialog "teleport_menu";
disableSerialization;

_display = findDisplay 69500;      
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;

_Btn1 ctrlSetText "TELEPORT"; 
_Btn1 buttonSetAction "[] call life_fnc_adminTeleport;";
if(FETCH_CONST(life_adminLevel) < 4) then {_Btn1 ctrlEnable false;};
/*
_Btn2 ctrlSetText "TP ME to X"; 
_Btn2 buttonSetAction "[] call life_fnc_dfsfh;";
if(FETCH_CONST(life_adminLevel) < 3) then {_Btn2 ctrlEnable false;};
		
_Btn3 ctrlSetText "TP X to ME"; 
_Btn3 buttonSetAction "[] call life_fnc_kdjssf;";
if(FETCH_CONST(life_adminLevel) < 3) then {_Btn3 ctrlEnable false;};
*/
_Btn2 ctrlSetText "TP Rebelcamp S."; 
_Btn2 buttonSetAction "player setPos (getMarkerPos ""reb_spawn_1"");[0,""STR_ANOTF_TP_RebelcampS"",true,[profileName]] remoteExecCall [""life_fnc_broadcast""];";
if(FETCH_CONST(life_adminlevel) < 2) then {_Btn2 ctrlEnable false;};

_Btn3 ctrlSetText "TP Rebelcamp N."; 
_Btn3 buttonSetAction "player setPos (getMarkerPos ""campnorth"");[0,""STR_ANOTF_TP_RebelcampN"",true,[profileName]] remoteExecCall [""life_fnc_broadcast""];";
if(FETCH_CONST(life_adminlevel) < 2) then {_Btn3 ctrlEnable false;};

_Btn4 ctrlSetText "TP Donator"; 
_Btn4 buttonSetAction "player setPos (getMarkerPos ""donator_spawn"");[0,""STR_ANOTF_TP_Donator"",true,[profileName]] remoteExecCall [""life_fnc_broadcast""];";
if(FETCH_CONST(life_adminlevel) < 2) then {_Btn4 ctrlEnable false;};

_Btn5 ctrlSetText "TP P. Kavala HQ"; 
_Btn5 buttonSetAction "player setPos (getMarkerPos ""cop_spawn_1"");[0,""STR_ANOTF_TP_Kavala"",true,[profileName]] remoteExecCall [""life_fnc_broadcast""];";
if(FETCH_CONST(life_adminlevel) < 2) then {_Btn5 ctrlEnable false;};

_Btn6 ctrlSetText "TP P. Pygros HQ"; 
_Btn6 buttonSetAction "player setPos (getMarkerPos ""police_hq_3"");[0,""STR_ANOTF_TP_Pygros"",true,[profileName]] remoteExecCall [""life_fnc_broadcast""];";
if(FETCH_CONST(life_adminlevel) < 2) then {_Btn6 ctrlEnable false;};

_Btn7 ctrlSetText "TP P. Athira HQ"; 
_Btn7 buttonSetAction "player setPos (getMarkerPos ""police_hq_2"");[0,""STR_ANOTF_TP_Athira"",true,[profileName]] remoteExecCall [""life_fnc_broadcast""];";
if(FETCH_CONST(life_adminlevel) < 2) then {_Btn7 ctrlEnable false;};

_Btn8 ctrlSetText "TP JAIL"; 
_Btn8 buttonSetAction "player setPos [3107.919,15093.574,1.2];[0,""STR_ANOTF_TP_jail"",true,[profileName]] remoteExecCall [""life_fnc_broadcast""];";
if(FETCH_CONST(life_adminlevel) < 2) then {_Btn8 ctrlEnable false;};

_Btn9 ctrlShow false;
