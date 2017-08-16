/*
	File: fn_craft.sqf
	Description: Crafting System
	Author: EdgeKiller
	Edit: Max "Maxos" Seßler
*/
private["_dialog","_inv","_itemInfo","_filter"]; //Declare all private variables
if(!dialog) then { //Verify if the window is open
	createDialog "life_craft";
};
disableSerialization; //Disable Serialization
if(life_is_processing) exitWith {
	closeDialog 2001;
	closeDialog 0;
};
_dialog = findDisplay 666; //find the craft dialog/window
_inv = _dialog displayCtrl 669; //find the listbox of items can be created
lbClear _inv; //clear the listbox
_filter = _dialog displayCtrl 673;
_filter lbAdd "Waffenindustrie";
_filter lbSetData[(lbSize _filter)-1,"waffen"];
_filter lbAdd "Magazinindustrie";
_filter lbSetData[(lbSize _filter)-1,"magazine"];
_filter lbAdd "Attachmentsindustrie";
_filter lbSetData[(lbSize _filter)-1,"aufsätze"];
_filter lbAdd "Automobilindustrie";
_filter lbSetData[(lbSize _filter)-1,"auto"];
_filter lbAdd "Nahrungsindustrie";
_filter lbSetData[(lbSize _filter)-1,"eat"];
_filter lbAdd "Metallindutstrie";
_filter lbSetData[(lbSize _filter)-1,"metal"];
_filter lbAdd "Technikindustrie";
_filter lbSetData[(lbSize _filter)-1,"technik"];
_filter lbAdd "Kleidung";
_filter lbSetData[(lbSize _filter)-1,"kleidung"];
_filter lbAdd "Westen";
_filter lbSetData[(lbSize _filter)-1,"westen"];
_filter lbSetCurSel 0;