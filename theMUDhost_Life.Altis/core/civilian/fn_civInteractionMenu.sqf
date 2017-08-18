/*
	File: fn_civInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
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
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];

if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;

_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian && side _curTarget == west) exitWith {closeDialog 0;}; //Bad side check?
//Can't interact while restrained or dead
if (player getVariable["zipTie",false] || player getVariable["restrained",false] || player getVariable["surrender",false]) exitWith {closeDialog 0;};

if (playerSide == west || playerSide == independent) exitWith {closeDialog 0;};

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

life_pInact_curTarget = _curTarget;

private["_civZip","_civEscort","_civBlind","_civSurrender","_civTazed","_civKnockedout","_civRestrain","_civRubber"];

_civZip = _curTarget getVariable ["zipTie",false];
_civEscort = _curTarget getVariable ["Escorting",false];
_civBlind = _curTarget getVariable ["blindfolded",false];
_civSurrender = _curTarget getVariable ["surrender",false];
_civTazed = _curTarget getVariable ["tazed",false];
_civRestrain = _curTarget getVariable ["restrained",false];
_civRubber = _curTarget getVariable ["rubber",false];

if( animationState _curTarget == "Incapacitated") then
{
	_civKnockedout = true;
}
else
{
	_civKnockedout = false;
};

_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;

//Button 1: Restrain and Unrestrain
if(_civZip || _civSurrender || _civTazed || _civKnockedout || _civRubber) then
{
	_Btn1 ctrlEnable true;
}
else
{
	_Btn1 ctrlEnable false;
};
if(_civZip) then
{
	_Btn1 ctrlSetText localize "STR_pInAct_UnRestrain";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unzip; closeDialog 0;";
}
else
{
	_Btn1 ctrlSetText localize "STR_pInAct_Restrain";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_zipTie; closeDialog 0;";
};

//Button 2: Escort
if(_civEscort) then
{
	_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;";
}
else
{
	if(_civZip) then
	{
		_Btn2 ctrlSetText localize "STR_pInact_Escort";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	}
	else
	{
		_Btn2 ctrlSetText localize "STR_pInact_Escort";
		_Btn2 ctrlEnable false;
	};
};

//Button 3: Put In Vehicle
if(_civEscort) then
{
	_Btn3 ctrlEnable true;
}
else
{
	_Btn3 ctrlEnable false;
};
_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

//Button 4: Blindfolding
if(_civBlind) then
{
	_Btn4 ctrlSetText localize "STR_pInact_RemoveBlindfold";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_blindfoldRemove; closeDialog 0;";
}
else
{
	_Btn4 ctrlSetText localize "STR_pInact_Blindfold";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_blindfold; closeDialog 0;";
};

//Button 5: Removing Handcuffs
if(_civRestrain) then
{
	_Btn5 ctrlSetText localize "STR_pInact_RemoveCuffs";
	_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
}
else
{
	_Btn5 ctrlShow false;
};

if(license_civ_bh) then
{
	_Btn6 ctrlSetText localize "STR_pInAct_Arrest";
	_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_jailTime;";
}
else
{
	_Btn6 ctrlShow false;
};

//Check that you are near a place to jail them.
if(!((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30))) then 
{
	_Btn6 ctrlEnable false;
};
