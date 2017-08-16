#include <macro.h>
/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Update and fill the virtual shop menu.
*/
private["_item_list","_gear_list","_shopItems","_name","_price","_index","_valVarName"];
disableSerialization;

//Setup control vars.
_item_list = CONTROL(2400,2401);
_gear_list = CONTROL(2400,2402);

_notBuyable = [
	"goldbar",
	"cocaine_unprocessed",
	"cocaine_processed",
	"heroin_unprocessed",
	"heroin_processed",
	"cannabis",
	"marijuana",
	"turtle_raw",
	"uranium_ore",
	"uranium_cleaned",
	"uranium_processed",
	"uranium_enriched",
	"uranium_fuelrod",
	"uranium_dirty",
	"diamond_uncut",
	"diamond_cut",
	"topaz_uncut",
	"topaz_cut",
	"ruby_uncut",
	"ruby_cut",
	"sapphire_uncut",
	"sapphire_cut",
	"emerald_uncut",
	"emerald_cut",
	"quartz_uncut",
	"quartz_cut",
	"garnet_uncut",
	"garnet_cut"
];
if(playerSide != civilian) then {
	_notBuyable = _notBuyable + [
		"blastingcharge",
		"boltcutter"	
	];
};

//Purge list
lbClear _item_list;
lbClear _gear_list;

if(!isClass(missionConfigFile >> "VirtualShops" >> life_shop_type)) exitWith {closeDialog 0; hint "Config does not exist?";}; //Make sure the entry exists..
ctrlSetText[2403,localize (M_CONFIG(getText,"VirtualShops",life_shop_type,"name"))];
_shopItems = M_CONFIG(getArray,"VirtualShops",life_shop_type,"items");

{
	_displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");

	// DynMarket
	_index = [_x,DYNMARKET_prices] call TON_fnc_index;
	if (!(EQUAL(_index, -1))) then {
		// get the price from dynmarket configuration
		_price = ((DYNMARKET_prices select _index) select 1) * 1.4; // buy price is 140% of sell price
	} else {
		// item is not contained in dynmarket configuration
		_price = M_CONFIG(getNumber,"VirtualItems",_x,"buyPrice");
	};

	if(!(EQUAL(_price,-1)) && !(_x in _notBuyable) && ((M_CONFIG(getNumber,"VirtualItems",_x,"buyPrice")) > 0)) then {
		_price = _price * PG_donGoalMulti;
		_item_list lbAdd format["%1 (%2€)",(localize _displayName),[_price] call life_fnc_numberText];
		_item_list lbSetData [(lbSize _item_list)-1,_x];
		_item_list lbSetValue [(lbSize _item_list)-1,_price];
		_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
		if(!(EQUAL(_icon,""))) then {
			_item_list lbSetPicture [(lbSize _item_list)-1,_icon];
		};
	};
} foreach _shopItems;

{
	_name = M_CONFIG(getText,"VirtualItems",_x,"displayName");
	_val = ITEM_VALUE(_x);

	_valVarName = _x;

	if(_val > 0) then {
		// <DYNMARKET
		_price = -1;
		{
		    if ((_x select 0) == _valVarName) then {_price = (_x select 1);};
		} forEach DYNMARKET_prices;

		if(EQUAL(_price,-1)) then {
			_price = M_CONFIG(getNumber,"VirtualItems",_x,"sellPrice");
		};
		// DYNMARKET>
		
		if (playerSide != civilian) then {_price = 0;};
		
		_normalprice = M_CONFIG(getNumber,"VirtualItems",_x,"buyPrice");
		if(_price > (_normalprice * PG_donGoalMulti) && _normalprice > -1) then {
			_price = (_normalprice * PG_donGoalMulti);
		};

		_price = [_price] call life_fnc_numberText;

		_gear_list lbAdd format["%2 (%3€) [x%1]",_val,(localize _name),_price];
		_gear_list lbSetData [(lbSize _gear_list)-1,_x];
		_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
		if(!(EQUAL(_icon,""))) then {
			_gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
		};
	};
} foreach _shopItems;