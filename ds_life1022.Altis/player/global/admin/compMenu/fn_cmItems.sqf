/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Opens the items compensation menu
*/

private ["_delay","_dialog","_combo1","_list1","_list2","_btnUpdateAmount","_btnAddItem","_btnRemoveItem","_btnCompensate"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminlist1)))exitWith{hint "You aren't allowed to use this menu";};

if(!DS_cmItemFncsLoaded)then {[] spawn DS_fnc_cmItemsFunctions;waitUntil {DS_cmItemFncsLoaded};};

closeDialog 0;
createDialog "compMenuItems";

disableSerialization;

_dialog = findDisplay 666642;
if(isNull _dialog)exitWith{};

_combo1 = _dialog displayCtrl 2102;
_list1 = _dialog displayCtrl 1500;
_list2 = _dialog displayCtrl 1501;
_btnUpdateAmount = _dialog displayCtrl 2402;
_btnRemoveItem = _dialog displayCtrl 2403;
_btnUpdateList = _dialog displayCtrl 2404;
_btnAddItem = _dialog displayCtrl 1203;
_btnCompensate = _dialog displayCtrl 2400;

_btnUpdateAmount buttonSetAction "[] call DS_fnc_cmUpdateItemAmount;";
_btnAddItem buttonSetAction "[] call DS_fnc_cmAddItem;";
_btnRemoveItem buttonSetAction "[] call DS_fnc_cmRemoveItem;";
_btnCompensate buttonSetAction "[] spawn DS_fnc_cmItemsCompPlayer;";

{
    _combo1 lbAdd (_x select 0);
    _combo1 lbSetData [(lbSize _combo1)-1,str (_forEachIndex)];
}foreach DS_cmCategories;

_combo1 lbSetCurSel 0;

lbClear _list2;

[] call DS_fnc_cmUpdateItemList;

DS_cmItemsToComp = [];