#include "..\..\macros.hpp"
/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Update and fill the virtual shop menu.
*/
private["_display","_item_list","_gear_list","_shop_data","_name","_price","_icon","_varName","_shopItems","_shoprebuy","_index2"];
disableSerialization;

//Setup control vars.
_display = findDisplay 2400;
_item_list = _display displayCtrl 2401;
_gear_list = _display displayCtrl 2402;

//Purge list
lbClear _item_list;
lbClear _gear_list;

if (!isClass(missionConfigFile >> "VirtualShops" >> DWEV_shop_type)) exitWith {closeDialog 0; hint "Einstellung nicht vorhanden?";}; //Make sure the entry exists..

ctrlSetText[2403,(M_CONFIG(getText,"VirtualShops",DWEV_shop_type,"name"))];
_shopItems = M_CONFIG(getArray,"VirtualShops",DWEV_shop_type,"items");

{
    _displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
    _price = M_CONFIG(getNumber,"VirtualItems",_x,"buyPrice");
    if (!(_price isEqualTo -1)) then {
        _item_list lbAdd format ["%1  ($%2)",_displayName,[_price] call DWEV_fnc_numberText];
        _item_list lbSetData [(lbSize _item_list)-1,_x];
        _item_list lbSetValue [(lbSize _item_list)-1,_price];
        _icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
        if (!(_icon isEqualTo "")) then {
            _item_list lbSetPicture [(lbSize _item_list)-1,_icon];
        };
    };
} forEach _shopItems;


{
    _name = M_CONFIG(getText,"VirtualItems",_x,"displayName");
    _val = ITEM_VALUE(_x);

    if (_val > 0) then {
        _gear_list lbAdd format ["%2 [x%1]",_val,_name];
        _gear_list lbSetData [(lbSize _gear_list)-1,_x];
        _icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
        if (!(_icon isEqualTo "")) then {
            _gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
        };
    };
} forEach _shopItems;

_shoprebuy = M_CONFIG(getArray,"VirtualShops",DWEV_shop_type,"rebuy");

	if ((typeName _shoprebuy) == "ARRAY") then 
	{
		{
				_index2 = [_x,sell_array] call DWF_fnc_index;
				_displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
				if(_index2 != -1) then 
				{
					_price = ((sell_array) select _index2) select 1;
					_price = (_price * 1.1); // 10% Aufschlag auf den Verkaufspreis
					_item_list lbAdd format ["%1  (%2€)",_displayName,[_price] call DWEV_fnc_numberText];
					_item_list lbSetData [(lbSize _item_list)-1,_x];
					_item_list lbSetValue [(lbSize _item_list)-1,_price];
					_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
					if (!(_icon isEqualTo "")) then
					{
						_item_list lbSetPicture [(lbSize _item_list)-1,_icon];
					};
				};
			
		} forEach _shoprebuy;
	};