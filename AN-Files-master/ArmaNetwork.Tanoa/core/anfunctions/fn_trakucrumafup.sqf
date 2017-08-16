#include <macro.h>
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by Rathbone for ArmA.Network
	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff","_val"];
disableSerialization;
if(isNil "life_trunk_vehicle" OR isNull life_trunk_vehicle OR !alive life_trunk_vehicle OR player distance life_trunk_vehicle > 10) exitWith {closeDialog 0;};
if(!alive player) exitwith {closeDialog 0;};
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && (life_trunk_vehicle getVariable ["trunk_used_by",""] != getPlayerUID player)) exitWith{closeDialog 0;hintSilent localize "STR_MISC_VehInvUse";};
if((lbCurSel 3502) isEqualTo -1) exitWith {hintSilent localize "STR_Global_NoSelection";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call life_fnc_spunetuwada)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && (life_trunk_vehicle getVariable ["trunk_used_by",""] != getPlayerUID player)) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse";};
if(_num < 1) exitWith {hint localize "STR_MISC_Under1";};
if(_num > 50) exitWith {hint "Can't take more than 50 Items at a time!";};

_index = [_ctrl,life_trunk] call life_fnc_uiudhfyqwtfkdsf;
if(_index isEqualTo -1) exitWith {};
_value = (life_trunk select _index) select 1;
if(_num > _value) exitWith {hintSilent localize "STR_MISC_NotEnough"};
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && {((life_trunk_vehicle getVariable["trunk_used_by",""]) != getPlayerUID player)}) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse"};
if([_ctrl,_num] call life_fnc_virtualItemAdd) then
{
	if(_num isEqualTo _value) then
	{
		life_trunk deleteAt _index;
	}
	else
	{
		_val = (_value - _num);
		life_trunk set[_index,[_ctrl,_val]];
	};
	call life_fnc_wrehufrutedru;
}
else
{
	hintSilent localize "STR_NOTF_InvFull";
};
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && (life_trunk_vehicle getVariable ["trunk_used_by",""] != getPlayerUID player)) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse";};
