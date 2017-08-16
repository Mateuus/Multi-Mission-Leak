#include "..\..\script_macros.hpp"
/*
    File: fn_PriceListMenu.sqf
    Author: RPGforYOU
*/
private["_control","_control1","_licenses","_gear_list","_shopItems","_name","_classname","_displayName3","_displayName1","_displayName2"];
disableSerialization;
createDialog "Life_pricelist_menu";

//Fetch the shop config.
_shopItems = M_CONFIG(getArray,"VirtualShops","price","items");
_licenses = "true" configClasses (missionConfigFile >> "Licenses");

_control = CONTROL(3300,3302);
lbClear _control; //Flush the list.
_control1 = CONTROL(3300,3304);
lbClear _control1; //Flush the list.
ctrlShow [3330,true];

{
    _displayName1 = getText(_x >> "displayName");
	_displayName2 = getText(_x >> "variable");
	_displayName3 = getText(_x >> "side");
    _control1 lbAdd format["%1 (%2)",(localize _displayName1),_displayName3];
    _control1 lbSetData [(lbSize _control1)-1,_displayName2];
} forEach _licenses;

{
    _displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
        _control lbAdd format["%1",(localize _displayName)];
        _control lbSetData [(lbSize _control)-1,_x];
        _icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
        if (!(_icon isEqualTo "")) then {
            _control lbSetPicture [(lbSize _control)-1,_icon];
        };
} forEach _shopItems;
