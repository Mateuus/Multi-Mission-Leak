#include <macro.h>
private["_display","_item_list","_gear_list","_shop_data","_name","_price","_icon"];
disableSerialization;
//Setup control vars.
//_display = findDisplay 2400;
//_item_list = _display displayCtrl 2401;
//_gear_list = _display displayCtrl 2402;
_item_list = CONTROL(2400,2401);
_gear_list = CONTROL(2400,2402);

//Purge list
lbClear _item_list;
lbClear _gear_list;

//_shop_data = [life_shop_type] call life_fnc_virt_shops;
//ctrlSetText[2403,format["%1", _shop_data select 0]];
if(!isClass(missionConfigFile >> "ANL_VShops" >> life_shop_type)) exitWith {closeDialog 0; hint "Config does not exist?";}; //Make sure the entry exists..
ctrlSetText[2403,localize (M_CONFIG(getText,"ANL_VShops",life_shop_type,"name"))];
_shopItems = M_CONFIG(getArray,"ANL_VShops",life_shop_type,"items");
{
	_displayName = M_CONFIG(getText,"ANL_VItems",_x,"displayName");
	_price = M_CONFIG(getNumber,"ANL_VItems",_x,"buyPrice");
	if(!(EQUAL(_price,-1))) then {
	
		_item_list lbAdd format["%1 %2€",(localize _displayName),[_price] call life_fnc_numberText];
		_item_list lbSetData [(lbSize _item_list)-1,_x];
		_item_list lbSetValue [(lbSize _item_list)-1,_price];
		_icon = M_CONFIG(getText,"ANL_VItems",_x,"icon");		
		if(!(EQUAL(_icon,""))) then {
			_item_list lbSetPicture [(lbSize _item_list)-1,_icon];
		};
		lbSort _item_list;
	};
} foreach _shopItems;

{
	_name = M_CONFIG(getText,"ANL_VItems",_x,"displayName");
	_val = ITEM_VALUE(_x);	
	
	if(_val > 0) then
	{
		_gear_list lbAdd format["%2 [x%1]",_val,(localize _name)];
		_gear_list lbSetData [(lbSize _gear_list)-1,_x];
		_icon = M_CONFIG(getText,"ANL_VItems",_x,"icon");
		if(!(EQUAL(_icon,""))) then {
			_gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
		};	
		lbSort _gear_list;		
	};
} foreach _shopItems;