#include <macro.h>
/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
disableSerialization;
if((lbCurSel 1501) isEqualTo -1) exitWith
{
	hintSilent "You didn't select an item you wanted to give.";
};
private _data = lbData[1501,(lbCurSel 1501)];
private _value = [AN_Inventory,_data,0] call life_fnc_arrayGetValue;
if (_value isEqualTo 0) exitWith
{
	closeDialog 0;
	hintSilent "Error!";
};
if (EQUAL(ITEM_ILLEGAL(_data),1) && {([west,getPos player,100] call life_fnc_zexavufredr)}) exitWith
{
	closeDialog 0;
	titleText["This is an illegal item and cops are near by, you cannot dispose of the evidence","PLAIN"];
};
if (vehicle player != player) exitWith
{
	titleText["You cannot remove an item when you are in a vehicle.","PLAIN"];
};
if (!([_data,_value] call life_fnc_virtualItemRemove)) exitWith
{
	hintSilent "Couldn't remove that much of that item, maybe you don't have that amount?";
};
hintSilent format["You have successfully removed %1 %2 from your inventory.",[(_value)] call life_fnc_rupadudejat,(localize ITEM_NAME(_data))];
closeDialog 0;
