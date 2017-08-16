#include <macro.h>
/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
disableSerialization;
_display = findDisplay 57632;
_list = _display displayCtrl 1500;
(_display displayCtrl 1400) ctrlSetText "0";
lbClear _list;
{
		private _item = _x select 0;
		private _amount = _x select 1;
		private _displayName = getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName");
		private _index = _list lbAdd format["%2 [x%1]",str(_amount),localize _displayName];
		_list lbSetData [_index,_item];
		private _icon = getText (missionConfigFile >> "VirtualItems" >> _item >> "icon");
		if (!(EQUAL(_icon,""))) then {
			_list lbSetPicture [_index,_icon];
		};
} forEach AN_Inventory;
