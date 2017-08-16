#include "..\script_macros.hpp"
/*
	File: fn_changeClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the clothing store to show a 'preview' of the piece of clothing.
*/
disableSerialization;
private["_control","_selection","_data","_price","_total","_totalPrice"];
_control = (_this select 0) select 0;
_selection = (_this select 0) select 1;
_price = (findDisplay 3100) displayCtrl 3102;
_total = (findDisplay 3100) displayCtrl 3106;
if(_selection == -1) exitWith {hint localize "STR_Shop_NoSelection";};
if(isNull _control) exitWith {hint localize "STR_Shop_NoDisplay"};
if(ES_cMenu_lock) exitWith {};
ES_cMenu_lock = true;

ES_clothing_purchase set[ES_clothing_filter,(_control lbValue _selection)];
_data = _control lbData _selection;

if(EQUAL(_data,"NONE")) then {
	_item = switch(ES_clothing_filter) do {
		case 0: {uniform player};
		case 1: {headGear player};
		case 2: {goggles player};
		case 3: {vest player};
		case 4: {backpack player};
	};
	
	[_item,false] call ES_fnc_handleItem;
} else {
	[_data,true,nil,nil,nil,nil,nil,true] call ES_fnc_handleItem;
};

ES_cMenu_lock = false;
_price ctrlSetStructuredText parseText format [(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%1</t>",[(_control lbValue _selection)] call ES_fnc_numberText];

_totalPrice = 0;
{
	if(_x != -1) then {
		_totalPrice = _totalPrice + _x;
	};
} foreach ES_clothing_purchase;

_total ctrlSetStructuredText parseText format [(localize "STR_Shop_Total")+ " <t color='#8cff9b'>$%1</t>",[_totalPrice] call ES_fnc_numberText];

if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };