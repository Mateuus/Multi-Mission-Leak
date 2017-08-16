#include "..\..\script_macros.hpp"

/*---------------------------------------------------------------------------
	File: fn_receivedItemUI.sqf
	Author: Skrow & Skyfezzer
	Usage:
		- When tradded items
		- When given items
		- When gather-miner/loot any items

		[[["selema_raw",1],["mackerel_row", 1]], false] spawn life_fnc_receivedItemsUI;
			OR
		[[["selema_raw",1],["mackerel_row", 1]], true] spawn life_fnc_receivedItemsUI;
---------------------------------------------------------------------------*/

private ["_array","_ctrlHeader","_ctrlList","_windowHeight","_text","_textList","_index"];
disableSerialization;
_itemArray = [_this,0,[],[[]]] call BIS_fnc_param;
_format = [_this,1,false,[false]] call BIS_fnc_param;

if (_format) then {
	_itemArray = [_itemArray] call LB_CombineArrayElements;
};

_windowHeight = 0.04 * count _itemArray;
if (count life_activeItemReceivedControls isEqualTo 0) then {life_itemControl = 30000};
{ctrlDelete CONTROL(46,_x)}forEach life_activeItemReceivedControls;


_ctrlHeader = (findDisplay 46) ctrlCreate ["RscStructuredText", life_itemControl]; 
_ctrlHeader ctrlSetPosition [0.7, 0.54, 0.26, 0.04]; 
_text = parseText format["<t color ='#999999'>Items</t>"];
_ctrlHeader ctrlSetStructuredText _text;
_ctrlHeader ctrlSetBackgroundColor [0.1,0.1,0.1,1];

_ctrlList = (findDisplay 46) ctrlCreate ["RscStructuredText", (life_itemControl + 1)]; 
_ctrlList ctrlSetPosition [0.7, 0.58, 0.26, _windowHeight]; 
_ctrlList ctrlSetBackgroundColor [0,0,0,0.7];
_textList = format[""];
{
	_itemClass = _x select 0;
	_itemAmount = _x select 1;
	if (_itemAmount > 0) then {
		_itemDisplayName = M_CONFIG(getText,"VirtualItems",_itemClass,"displayName");
		_itemIcon = M_CONFIG(getText,"VirtualItems",_itemClass,"icon");

		if(!(EQUAL(_itemIcon,""))) then {
			_textList = _textList + format["<img image='%1' align='left' size='1'/><t size = '1'> %2 [x%3]</t><br/>",_itemIcon,localize _itemDisplayName,_itemAmount];
		} else {
			_textList = _textList + format["<t size = '1' align='left'>%1 [x%2]</t><br/>",localize _itemDisplayName,_itemAmount];
		};
	};
} forEach _itemArray;
_ctrlList ctrlSetStructuredText parsetext _textList;

{	
	_x ctrlCommit 0;
	life_activeItemReceivedControls pushBack life_itemControl;
	life_itemControl = life_itemControl + 1;
	_x ctrlSetFade 1; 
	_x ctrlCommit 5;
}forEach [_ctrlHeader,_ctrlList];


[life_itemControl,(life_itemControl - 1)] spawn {
	disableSerialization;
	_listidc = _this select 0;
	_headeridc = _this select 0;
	uiSleep 5;
	{ctrlDelete CONTROL(46,_x)}forEach [_listidc,_headeridc];
};