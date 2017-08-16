/*
	File: fn_craft.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
private["_dialog","_inv","_itemInfo","_filter"]; //Declare all private variables
disableSerialization; //Disable Serialization
createdialog "Life_craft";

if(life_is_processing) exitWith{
	closeDialog 2001;
	closeDialog 0;
};

_dialog = findDisplay 666; //find the craft dialog/window
_inv = _dialog displayCtrl 669; //find the listbox of items can be created
lbClear _inv; //clear the listbox

_filter = _dialog displayCtrl 673;
_filter lbAdd "Werkzeuge";
_filter lbSetData[(lbSize _filter)-1,"werkzeuge"];
_filter lbAdd "Archäologie";
_filter lbSetData[(lbSize _filter)-1,"archo"];
_filter lbAdd "Elektroartikel";
_filter lbSetData[(lbSize _filter)-1,"elektro"];
_filter lbAdd "Ergänzungen";
_filter lbSetData[(lbSize _filter)-1,"materials"];
_filter lbAdd "Besonderes";
_filter lbSetData[(lbSize _filter)-1,"spezial"];
_filter lbAdd "Fahrzeuge";
_filter lbSetData[(lbSize _filter)-1,"fahrzeuge"];
_filter lbAdd localize "STR_CRAFT_FILTER_Uniform";
_filter lbSetData[(lbSize _filter)-1,"uniform"];
_filter lbAdd localize "STR_CRAFT_FILTER_Backpack";
_filter lbSetData[(lbSize _filter)-1,"backpack"];

_filter lbSetCurSel 0;