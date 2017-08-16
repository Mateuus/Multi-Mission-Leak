/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Opens the money compensation menu
*/

private ["_delay","_dialog","_combo1","_btnCompensate"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminlist1)))exitWith{hint "You aren't allowed to use this menu";};

if(!DS_cmMoneyFncsLoaded)then {[] spawn DS_fnc_cmMoneyFunctions;waitUntil {DS_cmMoneyFncsLoaded};};

closeDialog 0;
createDialog "compMenuMoney";

disableSerialization;

_dialog = findDisplay 666645;
if(isNull _dialog)exitwith{};

_combo1 = _dialog displayCtrl 2100;
_btnCompensate = _dialog displayCtrl 2400;

_combo1 lbAdd "Money";
_combo1 lbAdd "Tokens";
_combo1 lbSetCurSel 0;

_btnCompensate buttonSetAction "[] spawn DS_fnc_cmMoneyCompPlayer;";