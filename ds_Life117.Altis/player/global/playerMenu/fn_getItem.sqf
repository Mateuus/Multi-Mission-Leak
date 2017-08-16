/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Receives items to a nearby player
*/

private ["_value","_unit","_parsed","_str","_myself","_weight","_difference","_overflow","_itemLong"];

_item = _this select 0;
_value = _this select 1;
_unit = _this select 2;
_myself = _this select 3;
if(_myself != player)exitwith{};//Opps? Target not found
_str = [_item] call DS_fnc_itemStringConfig;
_weight = [_item,_value] call DS_fnc_itemWeight;
if((DS_maxWeight - DS_currentWeight) >= _weight)exitWith
	{
	[_item,true,_value] call DS_fnc_handleInventory;
	_index = [_item] call DS_fnc_itemIndex;
	if(_value == 1)then
		{
		hint format ["%1 has given you a %2",(name _unit),_str];
		systemchat format ["%1 has given you a %2",(name _unit),_str];
		}
		else
		{
		hint format ["%1 has given you %2 %3s",(name _unit),_value,_str];
		systemchat format ["%1 has given you %2 %3s",(name _unit),_value,_str];
		};
	};
	
_singleWeight = [_item,1] call DS_fnc_itemWeight;
_difference = DS_maxWeight - DS_currentWeight;
if(_difference == 0)exitwith{};//wtf
_difference = (floor(_difference/_singleWeight));
//_item = format ["DS_item_%1",_item];
//_newAmount = missionNamespace getVariable _item;
//_difference = _newAmount + _difference;
[_item,true,_difference] call DS_fnc_handleInventory;
_overflow = _value - _difference;
[[_item,_overflow,_myself,_unit],"DS_fnc_returnItem",_unit,false] spawn BIS_fnc_mp;



















_value = ctrlText 3131;
_parsed = (parseNumber(_value));
_item = lbData[9009,(lbCurSel 9009)];
ctrlShow[2001,false];
if((lbCurSel 2023) == -1) exitWith {hint "You have not selected anybody";ctrlShow[2001,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
//if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//Check for people doing stupid things
if(_parsed < 1)exitwith{hint "You have not entered a valid amount"};
if(isNull _unit)exitwith{ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};
_held = format ["DS_item_%1",_item];
_held = missionNamespace getVariable _held;
if(_parsed > _held)exitwith{hint "You do not have enough of this item type to remove"};
_index = [_item] call DS_fnc_itemIndex;
[[_item,_parsed,player],"DS_fnc_getItem",_unit,false] spawn DS_fnc_mp;
[_item,false,_parsed] call DS_fnc_handleInventory;

if(_parsed == 1)then
	{
	hint format ["You have given %1 a %2",(name _unit),((DS_masterItemArray select _index) select 0)];
	}
	else
	{
	hint format ["You have given %1 %2 %3s",(name _unit),_parsed,((DS_masterItemArray select _index) select 0)];
	};

closeDialog 0;
sleep 0.3;
[] spawn DS_fnc_menuPlayer;





















