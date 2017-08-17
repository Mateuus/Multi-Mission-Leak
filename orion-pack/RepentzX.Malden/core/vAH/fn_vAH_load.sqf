#include "..\..\script_macros.hpp"
/*
	File: fn_vAH_load.sqf
	Description: Loads the Auction house items for display
	Author: Fresqo
	Not very good with GUI's so used one of Ryans basic layout and edited it, shots bro!.
*/
if (playerSide == west || playerSide == independent || playerSide == east) exitWith {hint "Only Civilians can use Auction"};
waitUntil {createDialog "AH_vbuy";};
disableSerialization;
private["_pic","_itemName","_found"];
private _search = [_this,0,"",[""]] call BIS_fnc_param;
private _dialog = findDisplay 15100;
private _myListbox = _dialog displayCtrl 15101;
private _allAH = all_ah_items;
	
	if (_search != "") then {
	_allAH = [];
	{_found = (_x select 3 select 1) find _search; if (_found != -1) then {_allAH pushBack _x};} forEach all_ah_items;
	};
if (count all_ah_items isEqualTo 0) then {
		_myListbox lbAdd format [localize "STR_AH_NoItems"];
		_myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",["none"]]];
	} else {
{
	_x params [
	    "_id",
	    "_type",
	    "_amount",
	    "_item",
	    "_price",
	    "_seller",
	    "_sellerName",
	    "_status",
	    "_time"
	];
	_item = _item select 0;
	_time = round (_time / 3);
	if (_type isEqualTo 0) then 
		{
			_itemName = localize M_CONFIG(getText,"VirtualItems",_item,"displayName");
			_pic = M_CONFIG(getText,"VirtualItems",_item,"icon");
		} else {if (_type isEqualTo 1) then 
			{
				_itemName = ([_item] call life_fnc_fetchCfgDetails) select 1;
				_pic = ([_item] call life_fnc_fetchCfgDetails) select 2;
			};
	}; 

	if (_status isEqualTo 0)then {
	_myListbox lbAdd format [localize "STR_AH_LoadItems",_sellerName,[_price] call life_fnc_numberText,_itemName,[_time] call life_fnc_numberText,[_amount] call life_fnc_numberText];
	_myListbox lbSetPicture [(lbSize _myListbox)-1, _pic];
	_myListbox lbSetPictureColor [(lbSize _myListbox)-1, [1, 1, 1, 1]];
	_myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",[_id,_seller,_item,_price,_type,_amount,_sellerName]]];
	};
} forEach _allAH;};
["Successfully loaded offers",false,"slow"] call life_fnc_notificationSystem;

