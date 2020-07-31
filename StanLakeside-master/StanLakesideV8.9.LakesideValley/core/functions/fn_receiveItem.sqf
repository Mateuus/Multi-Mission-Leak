/*
	File: fn_receiveItem.sqf
	
	
	Description:
	Receive an item from a player.
*/

params ["_unit", "_val", "_item", "_from", "_diff"];
if(_unit != player) exitWith {};

_diff = [_item,(parseNumber _val),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_diff != (parseNumber _val)) then
{
	if(([true,_item,_diff] call life_fnc_handleInv)) then
	{
		[format[localize "STR_MISC_TooMuch_3",_from getVariable["realname",name _from],_val,_diff,((parseNumber _val) - _diff)], false] spawn doquickmsg;
		[_from,_item,str((parseNumber _val) - _diff),_unit] remoteExecCall ["life_fnc_giveDiff",_from];
	}
	else
	{
		[_from,_item,_val,_unit,false] remoteExecCall ["life_fnc_giveDiff",_from];
	};
}
else
{
	if(([true,_item,(parseNumber _val)] call life_fnc_handleInv)) then
	{
		private["_type"];
		_type = [_item,0] call life_fnc_varHandle;
		_type = [_type] call life_fnc_varToStr;
		[format[localize "STR_NOTF_GivenItem",_from getVariable["realname",name _from],_val,_type], false] spawn doquickmsg;
	}
	else
	{
		[_from,_item,_val,_unit,false] remoteExecCall ["life_fnc_giveDiff",_from];
	};
};

if(_item isEqualTo "weddingring" && life_married != "-2") then
{
     life_married = (_from getVariable["realname",name _from]);
};