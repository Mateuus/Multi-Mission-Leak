#include <macro.h>
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
disableSerialization;
private _display = findDisplay 90000;
private _inv = _display displayCtrl 1501;
private _cashAmount = _display displayCtrl 1002;
private _info = _display displayCtrl 1100;

lbClear _inv;

_cashAmount ctrlSetText format["Cash on Hand: $%1",[an_cash] call life_fnc_rupadudejat];
_info ctrlSetStructuredText parseText format [" Server Info <br/> Civs: %1<br/> TSO: %2<br/> EMS: %3",(civilian countSide playableUnits),(west countSide playableUnits),(independent countSide playableUnits)];

{
		private _item = _x select 0;
		private _amount = _x select 1;
		private _displayName = getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName");
		private _index = _inv lbAdd format["%2 [x%1]",str(_amount),localize _displayName];
		_inv lbSetData [_index,_item];
		private _icon = getText (missionConfigFile >> "VirtualItems" >> _item >> "icon");
		if (!(EQUAL(_icon,""))) then {
			_inv lbSetPicture [_index,_icon];
		};
} forEach AN_Inventory;

if ((lbSize 1501) isEqualTo 0) then 
{
		ctrlEnable [2411,false]; 
		ctrlEnable [2412,false];
} 
else
{
		ctrlEnable [2411,true]; 
		ctrlEnable [2412,true];
};

if (playerSide isEqualTo civilian) then 
{
		private _lic = _display displayCtrl 1500;
		lbClear _lic;

		if !((count AN_Licenses) isEqualTo 0)	then
		{
				{
						private _license = _x;
						private _displayName = getText (missionConfigFile >> "Licenses" >> _license >> "displayName");
						_struc = format["%1",localize _displayName];
						_lic lbAdd _struc;
				} forEach AN_Licenses;
		}
		else
		{
				_lic lbAdd "No Licenses";
		};		
};
