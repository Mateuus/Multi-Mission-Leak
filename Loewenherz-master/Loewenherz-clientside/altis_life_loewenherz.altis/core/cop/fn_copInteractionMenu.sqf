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

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];

disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};


if(!dialog) then {
	createDialog "interactionmenu_loewenherz";
};

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

if (player getVariable["isEscorting",false]) then {
    { _x ctrlShow false; } forEach [_Btn1,_Btn2,_Btn3,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];
};

if((_curTarget == rsb1) || (_curTarget == rsb2)  || (_curTarget == rsb3) || (_curTarget == dome3)  || (_curTarget == dome2)  || (_curTarget == dome1)) exitWith {

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

	_Btn1 ctrlSetText localize "STR_pInAct_Repair";
	_Btn1 buttonSetAction "[cursorObject] spawn lhm_fnc_repairDoor;";

	_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
	_Btn2 buttonSetAction "[cursorObject] call lhm_fnc_doorAnimate;";
	_Btn3 ctrlShow false;
	_Btn4 ctrlShow false;
	_Btn5 ctrlShow false;
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;



};

if(_curTarget isKindOf "Land_Runway_PAPI_4") exitWith {

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

		if(_curTarget getvariable["speedtrap_active", false]) then {
			_Btn1 ctrlSetText "Switch off";
			_Btn1 buttonSetAction "[] call lhm_fnc_speedtrapActivate; closeDialog 0;";
		} else {
			_Btn1 ctrlSetText "Switch on";
			_Btn1 buttonSetAction "[] call lhm_fnc_speedtrapActivate; closeDialog 0;";
		};


		_Btn2 ctrlSetText "Get film";
		_Btn2 buttonSetAction "[1,1,1,1] call lhm_fnc_speedtrapGetPhotoList; closeDialog 0;";

		_Btn3 ctrlSetText "Show Data";
		_Btn3 buttonSetAction "[0,0,0,0] call lhm_fnc_speedtrapGetPhotoList; closeDialog 0;";

		_Btn4 ctrlSetText "Speedlimit";
		_Btn4 buttonSetAction "closeDialog 0; [] call lhm_fnc_speedtrapSetSpeedLimit;";

		_Btn5 ctrlSetText "Pick up";
		_Btn5 buttonSetAction "[] call lhm_fnc_speedtrapRemove; closeDialog 0;";

		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;


};


if(_curTarget == fed_bank) exitWith {

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

		if(_curTarget getvariable["safe_open", false]) then {
			_Btn1 ctrlSetText "Reparieren";
			_Btn1 buttonSetAction "[cursorObject] spawn lhm_fnc_safeFix; closeDialog 0;";
		} else {
			_Btn1 ctrlSetText "Reparieren";
			_Btn1 buttonSetAction "[cursorObject] spawn lhm_fnc_safeFix; closeDialog 0;";
			_Btn1 ctrlEnable false;
		};

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

if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 999;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8; // LHM Alcohol
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
lhm_pInact_curTarget = _curTarget;

//Seize Target Player weapons
_Btn9 ctrlSetText "Entwaffnen";
_Btn9 buttonSetAction "[] spawn lhm_fnc_seizeWeapons;closeDialog 0";

//the Breathalyser button (LHM Alcohol)
_Btn8 ctrlSetText localize "STR_pInAct_Breathalyzer";
_Btn8 buttonSetAction "[[player],""lhm_fnc_breathalyzer"",lhm_pInact_curTarget,FALSE] call lhm_fnc_mp;closeDialog 0";

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_unrestrain; closeDialog 0;";

//Set Check Licenses Button
_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn2 buttonSetAction "[[player],""lhm_fnc_licenseCheck"",lhm_pInact_curTarget,FALSE] call lhm_fnc_mp";

//Set Search Button
_Btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
_Btn3 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_searchAction; closeDialog 0;";

//Set Escort Button
if (player getVariable["isEscorting",false]) then {
    _Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn4 buttonSetAction "[] call lhm_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn4 ctrlSetText localize "STR_pInAct_Escort";
    _Btn4 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_escortAction; closeDialog 0;";
};

//Set Ticket Button
_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn5 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_ticketAction;";

_Btn6 ctrlSetText localize "STR_pInAct_Arrest";
_Btn6 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_arrestAction;";

_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn7 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_putInCar;";

_Btn10 ctrlSetText  "Gericht";
_Btn10 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_startcourtCop;";

//Check that you are near a place to jail them.
if(!((player distance (getMarkerPos "police_hq_1") < 30) ||  (player distance (getMarkerPos "police_hq_2") < 30) ||  (player distance (getMarkerPos "cop_spawn_6") < 30) || (player distance (getMarkerPos "police_hq_4") < 30) || (player distance (getMarkerPos "cop_spawn_3") < 30) || (player distance (getMarkerPos "cop_spawn_5") < 30))) then
{
	_Btn6 ctrlEnable false;
};

if(player getvariable "rank" >= 3 ) then {

if(!((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR  (player distance (getMarkerPos "cop_spawn_6") < 30) OR (player distance (getMarkerPos "police_hq_4") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30))) then
{
	_Btn10 ctrlEnable false;
};
} else {
	_Btn10 ctrlShow false;
};
