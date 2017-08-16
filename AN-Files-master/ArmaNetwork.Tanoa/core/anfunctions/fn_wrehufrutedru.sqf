#include <macro.h>

/*
	File: fn_vehInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used a refresher for the vehicle inventory / trunk menu items.
*/
private["_veh","_tInv","_pInv","_veh_data","_weight"];
if(isNull life_trunk_vehicle OR {!alive life_trunk_vehicle}) exitWith {closeDialog 0;};
if((life_trunk_vehicle getVariable["trunk_used_by",""]) != getPlayerUID player) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse";};
disableSerialization;

_tInv = ((findDisplay 3500) displayCtrl 3502);
_pInv = ((findDisplay 3500) displayCtrl 3503);
_text1 = ((findDisplay 3500) displayCtrl 3506);
_text2 = ((findDisplay 3500) displayCtrl 3505);
_text1 ctrlSetText "0";
_text2 ctrlSetText "0";
lbClear _tInv;
lbClear _pInv;

life_trunk_weight = 0;
_maxWeight = getNumber(missionConfigFile >> "CfgVehicles" >> (typeOf life_trunk_vehicle) >> "trunk" >> str(playerSide));

{
	private _item = _x select 0;
	private _val = _x select 1;
	private _index = _pInv lbAdd format["[%1] - %2",_val,localize getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName")];
	_pInv lbSetData [_index,_item];
	private _icon = getText (missionConfigFile >> "VirtualItems" >> _item >> "icon");
	if(!(EQUAL(_icon,""))) then
	{
		_pInv lbSetPicture [_index,_icon];
	};
} forEach AN_Inventory;

{
	private _name = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"displayName");
	private _weight = getNumber(missionConfigFile >> "VirtualItems" >> SEL(_x,0) >> "weight");
	private _val = _x select 1;
	if(_val > 0) then {
		private _index = _tInv lbAdd format["[%1] - %2",_val,localize _name];
		_tInv lbSetData [_index,SEL(_x,0)];
		private _icon = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"icon");
		if(!(EQUAL(_icon,""))) then
		{
			_tInv lbSetPicture [_index,_icon];
		};
		life_trunk_weight = life_trunk_weight + (_weight * _val);
	};
} forEach life_trunk;

((findDisplay 3500) displayCtrl 3504) ctrlSetText format["%1/%2",life_trunk_weight,_maxWeight];
