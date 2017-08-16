/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Building interaction menu
*/

#include "..\..\macros.hpp"

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_Btn13","_Btn14","_Title","_uid"];
if(!dialog) then 
{
	createDialog "Interaction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if((isNull _curTarget) && (isNil "DWEV_currentBox")) exitWith {closeDialog 0;}; //Bad target
if !(isNil "DWEV_currentBox") then {_curTarget = DWEV_currentBox;};
_house = nearestBuilding (getPos player);
_uid = ((_house getVariable "house_owner") select 0);
if(_uid != getPlayerUid player && (side player) != west) exitWith {hint "Du bist nicht der Hausbesitzer.";closeDialog 0;};



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

_Title ctrlSetText "Haus Interaktions-Menü";

DWEV_pInact_curTarget = _curTarget;
DWEV_current_House = _house;
_dist = 0;


if (((typeOf (_curTarget)) IN  ["Box_IND_Grenades_F","B_supplyCrate_F"] )&& (side player) == civilian) then
{
		
		if (_curTarget getVariable ["DWEV_move_box",false]) then
		{
			_Btn1 ctrlSetText "Objekt absetzen";
			_Btn1 buttonSetAction "DWEV_pInact_curTarget setVariable ['DWEV_move_box',false,true]; closeDialog 0;";
			_Btn1 ctrlShow true;

		}
		else
		{
			_Btn1 ctrlSetText "Objekt verschieben";
			_Btn1 buttonSetAction "[DWEV_pInact_curTarget,DWEV_current_House] spawn DWEV_fnc_moveContainer; closeDialog 0;";
			_Btn1 ctrlShow true;
			
			_Btn2 ctrlSetText "Objekt Löschen";
			_Btn2 buttonSetAction "[DWEV_pInact_curTarget,player] remoteExec ['DWF_fnc_removeHouseContainer',(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; closeDialog 0;";
			_Btn2 ctrlShow true;
		};
		
};

if (((typeOf (_curTarget)) IN  ["Box_IND_Grenades_F","B_supplyCrate_F"] )&& (side player) == west) then
{
		
			_Btn1 ctrlSetText "Kiste Durchsuchen";
			_Btn1 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_raidHouse; closeDialog 0;";
			_Btn1 ctrlShow true;
			
			if(player distance _curTarget > 3.6) then {
				_Btn1 ctrlEnable false;
			};
		
};

while {_dist < 7} do
{
	_pos1 = getPos player;
	_pos2 = getPos _curTarget;
	_dist = _pos1 distance _pos2;
//	hint format["Aktuelle Entfernung: %1m",_dist]; // Anzeige nur zum Testen
	if(!dialog) exitWith {};
	sleep 1;
};
	
closeDialog 0;
