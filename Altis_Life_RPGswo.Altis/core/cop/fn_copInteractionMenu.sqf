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

if(_curTarget isKindOf "House_F") exitWith
{
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then
	{
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

		_Title ctrlSetText "Bundesbank Interaktions-Menü";
		DWEV_pInact_curTarget = _curTarget;

		_Btn1 ctrlSetText "Tür reparieren";
		_Btn1 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_repairDoor;";
		_Btn1 ctrlShow true;

		_Btn2 ctrlSetText "Öffnen / Schließen";
		_Btn2 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_doorAnimate;";
		_Btn2 ctrlShow true;
	} else
	{
		closeDialog 0;
	};
};

if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
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

_Title ctrlSetText "Zivilisten Interaktions-Menü";
DWEV_pInact_curTarget = _curTarget;
_dist = 0;   // Initialisiere Positionsüberwachung

//Set Unrestrain Button
_Btn1 ctrlSetText "Freilassen";
_Btn1 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_unrestrain; closeDialog 0;";
_Btn1 ctrlShow true;

//Set Check Licenses Button
_Btn2 ctrlSetText "Papiere";
_Btn2 buttonSetAction "[player] remoteExec [""DWEV_fnc_licenseCheck"",DWEV_pInact_curTarget]";
_Btn2 ctrlShow true;

//Set Search Button
_Btn3 ctrlSetText "Durchsuchen";
_Btn3 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_searchAction; closeDialog 0;";
_Btn3 ctrlShow true;

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then
{
	_Btn4 ctrlSetText "Eskorte beenden";
	_Btn4 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_stopEscorting; closeDialog 0;";
}
else
{
	_Btn4 ctrlSetText "Eskortieren";
	_Btn4 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_escortAction; closeDialog 0;";
};
_Btn4 ctrlShow true;

//Set Ticket Button
_Btn5 ctrlSetText "Bußgeld";
_Btn5 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_ticketAction;";
_Btn5 ctrlShow true;

_Btn6 ctrlSetText "Einsperren";
_Btn6 buttonSetAction "closeDialog 0; [DWEV_pInact_curTarget] call DWEV_fnc_arrestAction;";
_Btn6 buttonSetAction "closeDialog 0; [] call DWEV_fnc_showArrestDialog;";
_Btn6 ctrlShow true;

_Btn7 ctrlSetText "Ins Fahrzeug";
_Btn7 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_putInCar; closeDialog 0;";
_Btn7 ctrlShow true;

_Btn8 ctrlSetText "Lizenzen entziehen";
_Btn8 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_revokeLicense;";
_Btn8 ctrlShow true;

_Btn9 ctrlSetText "Waffen suchen";
_Btn9 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_searchWeapon; closeDialog 0;";
_Btn9 ctrlShow true;

_Btn10 ctrlSetText "Waffen abnehmen";
_Btn10 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_removeWeapon; closeDialog 0;";
_Btn10 ctrlShow true;

_Btn11 ctrlSetText "Kommunikation abnehmen";
_Btn11 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_removeCommunication;";
_Btn11 ctrlShow true;

_Btn12 ctrlSetText "Alkoholtest";
_Btn12 buttonSetAction "[player] remoteExec [""DWEV_fnc_alcoholCheck"",DWEV_pInact_curTarget]; closeDialog 0;";
_Btn12 ctrlShow true;

_Btn13 ctrlSetText "Drogentest";
_Btn13 buttonSetAction "[player] remoteExec [""DWEV_fnc_drugCheck"",DWEV_pInact_curTarget]; closeDialog 0;";
_Btn13 ctrlShow true;

_Btn14 ctrlSetText "Ausweis zeigen";
_Btn14 buttonSetAction "[player] remoteExec [""DWEV_fnc_zeigePerso"",DWEV_pInact_curTarget]; closeDialog 0;";
_Btn14 ctrlShow true;
_Btn14 ctrlEnable DWEV_persoReady;

//Check that you are near a place to jail them.
if(!((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR  (player distance (getMarkerPos "polizeiHQ_1") < 30) OR (player distance (getMarkerPos "cop_spawn_4") < 30) OR  (player distance (getMarkerPos "cop_kon1") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30) OR  (player distance (getMarkerPos "ravitaHQmarker ") < 30) OR (player distance (getMarkerPos "georgetownHQmarker") < 30))) then
{
	_Btn6 ctrlEnable false;
};

while {_dist < 7} do
{
	_pos1 = getPos player;
	_pos2 = getPos _curTarget;
	_dist = _pos1 distance _pos2;
	//hint format["Aktuelle Entfernung: %1m",_dist]; // Anzeige nur zum Testen
	if(!dialog) exitWith {};
	sleep 1;
};

closeDialog 0; // Fenster schließen wenn Spieler zu weit weg ist


