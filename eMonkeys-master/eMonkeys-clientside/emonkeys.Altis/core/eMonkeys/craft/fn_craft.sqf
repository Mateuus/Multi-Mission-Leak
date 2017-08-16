/*
	File: fn_craft.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
	Edit: DerOnkel | e-monkeys.com / avanix-gaming.de
*/
private["_dialog","_inv","_itemInfo","_filter"]; //Declare all private variables
if(!dialog) then { //Verify if the window is open
	createDialog "Emonkeys_craft";
};
disableSerialization; //Disable Serialization

if(eM_is_processing) exitWith{
	closeDialog 2001;
	closeDialog 0;
};

_dialog = findDisplay 666; //find the craft dialog/window
_inv = _dialog displayCtrl 669; //find the listbox of items can be created
lbClear _inv; //clear the listbox

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2050,false]; //Gang Icon
		ctrlShow[2051,false]; //Gang Button
		ctrlShow[2054,false]; //Craft Icon
		ctrlShow[2055,false]; //Craft Button
	};
	case independent:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
		ctrlShow[2050,false]; //Gang Icon
		ctrlShow[2051,false]; //Gang Button
	};
	case civilian:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
	case east:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
};

if((call EMonkeys_coplevel) < 3) then
{
	ctrlShow[2406,false]; //Wanted + Button
	ctrlShow[2407,false]; //Wanted + Icon
};

if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};



if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};

_filter = _dialog displayCtrl 673;
_filter lbAdd "Waffen";
_filter lbSetData[(lbSize _filter)-1,"weapon"];
_filter lbAdd "Magazine";
_filter lbSetData[(lbSize _filter)-1,"magazine"];
_filter lbAdd "Attachments";
_filter lbSetData[(lbSize _filter)-1,"attachments"];
_filter lbAdd "Zubehör";
_filter lbSetData[(lbSize _filter)-1,"zubehoer"];
_filter lbAdd "Kopfbedeckung";
_filter lbSetData[(lbSize _filter)-1,"head"];
_filter lbAdd "Uniformen";
_filter lbSetData[(lbSize _filter)-1,"uniform"];
_filter lbAdd "Westen";
_filter lbSetData[(lbSize _filter)-1,"veste"];
_filter lbAdd "Rucksäcke";
_filter lbSetData[(lbSize _filter)-1,"backpack"];
_filter lbAdd "Items";
_filter lbSetData[(lbSize _filter)-1,"item"];
_filter lbAdd "Fahrzeuge";
_filter lbSetData[(lbSize _filter)-1,"vehicle"];

_filter lbSetCurSel 0;



