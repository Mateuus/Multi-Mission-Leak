#include "..\..\script_macros.hpp"
/*
	File: fn_vAH_load.sqf
	Description: Loads the Auction house items for display
	Author: Fresqo
	Not very good with GUI's so used one of Ryans basic layout and edited it, shots bro!.
*/
waitUntil {createDialog "AH_vbuy";};
disableSerialization;
private["_dialog","_myListbox","_curOffer","_id","_type","_amount","_item","_pic","_itemName","_price","_seller","_sellerName","_status","_time","_search","_allAH","_found"];
_search = [_this,0,"",[""]] call BIS_fnc_param;
	_dialog = findDisplay 15100;
	_myListbox = _dialog displayCtrl 15101;
	_allAH = all_ah_items;
	
	if(_search != "") then {
	_allAH = [];
	{_found = SEL(SEL(_x,3),1) find _search; if (_found != -1) then {_allAH pushBack _x};} forEach all_ah_items;
	};
if (count all_ah_items == 0) then {
		_myListbox lbAdd format [localize "STR_AH_NoItems"];
		_myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",["none"]]];
	} else {
{
	_curOffer = _x;
	_id = SEL(_curOffer,0);
	_type = SEL(_curOffer,1);	
	_amount = SEL(_curOffer,2);
	_item = SEL(SEL(_curOffer,3),0);
	if (EQUAL(_type,0)) then 
		{
			_itemName = localize M_CONFIG(getText,"VirtualItems",_item,"displayName");
			_pic = M_CONFIG(getText,"VirtualItems",_item,"icon");
		} else {if (EQUAL(_type,1)) then 
			{
				_itemName = SEL(([_item] call life_fnc_fetchCfgDetails),1);
				_pic = SEL([_item] call life_fnc_fetchCfgDetails,2);
			};
	}; 
	_price = SEL(_curOffer,4);
	_seller = SEL(_curOffer,5);
	_sellerName = SEL(_curOffer,6);
	_status = SEL(_curOffer,7);
	_time = SEL(_curOffer,8);
	_time = round (_time / 3);
	if (_status == 0)then {
	_myListbox lbAdd format [localize "STR_AH_LoadItems",_sellerName,[_price] call life_fnc_numberText,_itemName,[_time] call life_fnc_numberText,[_amount] call life_fnc_numberText];
	_myListbox lbSetPicture [(lbSize _myListbox)-1, _pic];
	_myListbox lbSetPictureColor [(lbSize _myListbox)-1, [1, 1, 1, 1]];
	_myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",[_id,_seller,_item,_price,_type,_amount,_sellerName]]];
	};
} forEach _allAH;};
hint "Successfully loaded offers";

while {true} do
{
	sleep 1;
	if (isNull (findDisplay 15100)) exitWith {};
	sleep 1;
	if (isNull (findDisplay 15100)) exitWith {};
	sleep 1;
	if (isNull (findDisplay 15100)) exitWith {};
	sleep 1;
	if (isNull (findDisplay 15100)) exitWith {};
	sleep 1;
	((findDisplay 15100) displayCtrl 15160) ctrlSetText "textures\fattony01.jpg";
	if (isNull (findDisplay 15100)) exitWith {};
	sleep 0.1;
	((findDisplay 15100) displayCtrl 15160) ctrlSetText "textures\fattony02.jpg";
	if (isNull (findDisplay 15100)) exitWith {};
	sleep 0.1;
	((findDisplay 15100) displayCtrl 15160) ctrlSetText "textures\fattony03.jpg";
	if (isNull (findDisplay 15100)) exitWith {};
	sleep 0.1;
	((findDisplay 15100) displayCtrl 15160) ctrlSetText "textures\fattony04.jpg";
	if (isNull (findDisplay 15100)) exitWith {};
	sleep 0.1;
	((findDisplay 15100) displayCtrl 15160) ctrlSetText "textures\fattony.jpg";
	if (isNull (findDisplay 15100)) exitWith {};
};