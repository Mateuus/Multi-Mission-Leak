/*
	File: fn_craftAction.sqf
	Author: EdgeKiller
	Edit: PierreAmyf
*/

private["_dialog","_inv","_itemInfo","_filter"];
if(!dialog) then {
	createDialog "Life_craft_Item";
};
disableSerialization;
if(life_is_processing) exitWith{
	closeDialog 2001;
	closeDialog 0;
};
_dialog = findDisplay 766;
_inv = _dialog displayCtrl 769;
lbClear _inv; //clear the listbox
_filter = _dialog displayCtrl 773;
_filter lbAdd "Materialien";
_filter lbSetData[(lbSize _filter)-1,"material"];
_filter lbSetCurSel 0;