/*
	File: fn_craft.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
private["_dialog","_inv","_itemInfo","_filter"]; //Declare all private variables
if(!dialog) then { //Verify if the window is open
	createDialog "DWEV_craft";
};
disableSerialization; //Disable Serialization

if(DWEV_is_processing) exitWith
{
	closeDialog 2001;
	closeDialog 0;
};


_dialog = findDisplay 666; //find the craft dialog/window
_inv = _dialog displayCtrl 669; //find the listbox of items can be created
lbClear _inv; //clear the listbox

_filter = _dialog displayCtrl 673;
_filter lbAdd "Waffen";
_filter lbSetData[(lbSize _filter)-1,"weapon"];
_filter lbAdd "Kleidung";
_filter lbSetData[(lbSize _filter)-1,"uniform"];
_filter lbAdd "Rucksäcke";
_filter lbSetData[(lbSize _filter)-1,"backpack"];
_filter lbAdd "Items";
_filter lbSetData[(lbSize _filter)-1,"item"];

_filter lbSetCurSel 0;
