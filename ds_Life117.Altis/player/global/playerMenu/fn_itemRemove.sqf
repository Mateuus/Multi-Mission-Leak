/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Remove an item from your inventory
*/

private ["_item","_value","_parsed","_held","_str"];

_item = lbData[9009,(lbCurSel 9009)];
_value = ctrlText 3131;
_parsed = (parseNumber(_value));
_held = 0;

//people do dumb stuff
if(_item == "")exitwith{hint "You must select an item to remove"};
if(!([_value] call DS_fnc_isNumber))exitwith{hint "You have entered an incorrect number"};
if(_parsed < 1)exitwith{hint "You must enter a number higher than zero"};
if((playerside != west)&&([getPos player,100,west] call DS_fnc_nearbyPlayers)) exitWith {titleText["You can not remove objects when police are nearby","PLAIN"]};
_held = format ["DS_item_%1",_item];
_held = missionNamespace getVariable _held;
if(_parsed > _held)exitwith{hint "You do not have enough of this item type to remove"};
if((vehicle player) != player)exitwith{hint "You can not remove items inside a vehicle"};
_str = [_item] call DS_fnc_itemStringConfig;
[_item,false,_parsed] call DS_fnc_handleInventory;

if(_parsed == 1)then
	{
	hint format ["You have removed a %1 from your inventory",_str];
	}
	else
	{
	hint format ["You have removed %1 %2s from your inventory",_value,_str];
	};
	
closeDialog 0;
[] spawn DS_fnc_menuPlayer;


















