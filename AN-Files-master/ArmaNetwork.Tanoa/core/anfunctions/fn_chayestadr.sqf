#include <macro.h>
/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = parseNumber(ctrlText 1400);
if((lbCurSel 2100) isEqualTo -1) exitWith {closeDialog 0; hintSilent "No one was selected!";};
_unit = lbData [2100,lbCurSel 2100];
_unit = call compile format["%1",_unit];
if((lbCurSel 1500) isEqualTo -1) exitWith {closeDialog 0; hintSilent "You didn't select an item you wanted to give.";};
_item = lbData [1500,(lbCurSel 1500)];
if(isNil "_unit") exitWith {closeDialog 0;};
if(_unit isEqualTo player) exitWith {closeDialog 0;};
if(isNull _unit) exitWith {closeDialog 0;};
if(!([str(_val)] call life_fnc_spunetuwada)) exitWith {closeDialog 0; hintSilent "You didn't enter an actual number format.";};
if(_val <= 0) exitWith {closeDialog 0; hintSilent "You need to enter an actual amount you want to give.";};
if(isNil "_unit") exitWith {closeDialog 0; hintSilent "The selected player is not within range";};
if(!([_item,_val] call life_fnc_virtualItemRemove)) exitWith
{
	closeDialog 0;
	hintSilent "Couldn't give that much of that item, maybe you don't have that amount?";
};
[_unit,_val,_item,player] remoteExecCall ["life_fnc_yaguthazest",_unit];
_type = M_CONFIG(getText,"VirtualItems",_item,"displayName");
hintSilent format["You gave %1 %2 %3",_unit getVariable["realname",name _unit],_val,(localize _type)];
[] call life_fnc_p_updateMenu;
