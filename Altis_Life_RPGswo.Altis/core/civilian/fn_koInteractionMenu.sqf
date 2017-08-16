/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/

#include "..\..\macros.hpp"

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_Btn13","_Btn14","_Title"];
if(!dialog) then {
	createDialog "Interaction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
//if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Rebellen k�nnen alle Festnehmen
_display = findDisplay 37400;
_Btn1 = _display displayCtrl IDC_interact_Btn1;
_Btn2 = _display displayCtrl IDC_interact_Btn2;
_Btn3 = _display displayCtrl IDC_interact_Btn3;
_Btn4 = _display displayCtrl IDC_interact_Btn4;
_Btn5 = _display displayCtrl IDC_interact_Btn5;
_Btn6 = _display displayCtrl IDC_interact_Btn6;
_Btn7 = _display displayCtrl IDC_interact_Btn7;
_Btn8 = _display displayCtrl IDC_interact_Btn8;
_Btn9 = _display displayCtrl IDC_interact_Btn9;
_Btn10 = _display displayCtrl IDC_interact_Btn10;
_Btn11 = _display displayCtrl IDC_interact_Btn11;
_Btn12 = _display displayCtrl IDC_interact_Btn12;
_Btn13 = _display displayCtrl IDC_interact_Btn13;
_Btn14 = _display displayCtrl IDC_interact_Btn14;
_Title = _display displayCtrl IDC_interact_Title;
_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;
_Btn11 ctrlShow false;
_Btn12 ctrlShow false;
_Btn13 ctrlShow false;
_Btn14 ctrlShow false;

_Title ctrlSetText "KO Interaktions-Menü";
DWEV_pInact_curTarget = _curTarget;
_dist = 0;

	_Btn1 ctrlSetText "Ausrauben";
	_Btn1 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_robAction; closeDialog 0;";
	if((cursorTarget getVariable["robbed",FALSE])) then
	{_Btn1 ctrlEnable false;};
	_Btn1 ctrlShow true;

	_Btn2 ctrlSetText "Niere entnehmen";
	_Btn2 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_takeOrgans; closeDialog 0;";
	if((cursorTarget getVariable ["missingOrgan",FALSE]) OR (player getVariable "hasOrgan")) then
	{_Btn2 ctrlEnable false;};
	_Btn2 ctrlShow true;

while {_dist < 7} do
	{
	player doWatch _curTarget;
	_pos1 = getPos player;
	_pos2 = getPos _curTarget;
	_dist = _pos1 distance _pos2;
	if(!dialog) exitWith {};
	sleep 1;
	};

closeDialog 0;

