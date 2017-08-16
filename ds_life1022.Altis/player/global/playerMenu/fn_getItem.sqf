/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Receives items to a nearby player
*/

private ["_weight","_str","_singleWeight","_difference","_overflow"];

params [
	["_item","",[""]],
	["_value",0,[0]],
	["_unit",objNull,[objNull]],
	["_from",objNull,[objNull]]
];

if((_item isEqualTo "")||{_value isEqualTo 0}||{isNull _unit}||{isNull _from})exitWith{};
if(!(_unit isEqualTo player))exitWith{};

_weight = [_item,_value] call DS_fnc_itemWeight;

//If the player can hold the sent amount, give it to them
if((DS_maxWeight - DS_currentWeight) >= _weight)exitWith {
	[_item,true,_value] call DS_fnc_handleInventory;

	_str = [_item] call DS_fnc_itemStringConfig;

	if(_value isEqualTo 1)then {
		hint format ["%1 has given you a %2",(name _from),_str];
		systemChat format ["%1 has given you a %2",(name _from),_str];
	} else {
		hint format ["%1 has given you %2 %3s",(name _from),_value,_str];
		systemChat format ["%1 has given you %2 %3s",(name _from),_value,_str];
	};
};

//The player cannot hold the given amount, give back the sender what they can't hold
_singleWeight = [_item,1] call DS_fnc_itemWeight; //Weight of 1 of the item
_difference = (DS_maxWeight - DS_currentWeight); //Remaining space, if backpack is off this can go into negatives, e.g (-40)

//Decide what we're going to receive and return
if(_difference <= 0)then {
	//We can't give the receiver anything, so return all items
	_overflow = _value;
} else {
	//Return the sender whatever the receiver couldn't hold
	_difference = (floor (_difference/_singleWeight)); //Remaining space divided by single weight (how many can fit)
	[_item,true,_difference] call DS_fnc_handleInventory; //Add difference
	_overflow = _value - _difference; //Amount to receive - how many can fit
};

//Return the sender what needs to be returned
[_item,_overflow,_unit,_from] remoteExecCall ["DS_fnc_returnItem",_from];