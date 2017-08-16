/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Opens the gear compensation menu
*/

private ["_delay","_dialog","_combo1","_list1","_list2","_btnUpdateAmount","_btnAddGear","_btnRemoveGear","_btnCompensate"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminlist1)))exitWith{hint "You aren't allowed to use this menu";};

if(!DS_cmGearFncsLoaded)then {[] spawn DS_fnc_cmGearFunctions;waitUntil {DS_cmGearFncsLoaded};};

closeDialog 0;
createDialog "compMenuGear";

disableSerialization;

_dialog = findDisplay 666643;
if(isNull _dialog)exitWith{};

_combo1 = _dialog displayCtrl 2101;
_list1 = _dialog displayCtrl 1500;
_list2 = _dialog displayCtrl 1501;
_btnUpdateAmount = _dialog displayCtrl 2402;
_btnAddGear = _dialog displayCtrl 1203;
_btnRemoveGear = _dialog displayCtrl 2403;
_btnCompensate = _dialog displayCtrl 2400;

_btnUpdateAmount buttonSetAction "[] call DS_fnc_cmUpdateGearAmount;";
_btnAddGear buttonSetAction "[] call DS_fnc_cmAddGear;";
_btnRemoveGear buttonSetAction "[] call DS_fnc_cmRemoveGear;";
_btnCompensate buttonSetAction "[] spawn DS_fnc_cmGearCompPlayer;";

lbClear _list1;
lbClear _list2;

_combo1 lbAdd "Weapons";
_combo1 lbAdd "Clothing";
_combo1 lbSetCurSel 0;

[] call DS_fnc_cmUpdateGearCompType;

DS_cmGearToComp = [];