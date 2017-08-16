/*
	File: fn_receiveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receive an item from a player.
*/
private["_unit","_val","_item","_from","_diff"];
_unit = _this select 0;
if(_unit != player) exitWith {};
_val = _this select 1;
_item = _this select 2;
_from = _this select 3;

_diff = [_item,(parseNumber _val),lhm_carryWeight,lhm_maxWeight] call lhm_fnc_calWeightDiff;

if(_diff != (parseNumber _val)) then
{
	if(([true,_item,_diff] call lhm_fnc_handleInv)) then
	{
		hint format[localize "STR_MISC_TooMuch_3",_from getVariable["realname",name _from],_val,_diff,((parseNumber _val) - _diff)];
		[[_from,_item,str((parseNumber _val) - _diff),_unit],"lhm_fnc_giveDiff",_from,false] call lhm_fnc_mp;
	}
		else
	{
		[[_from,_item,_val,_unit,false],"lhm_fnc_giveDiff",_from,false] call lhm_fnc_mp;
	};
}
	else
{
	if(([true,_item,(parseNumber _val)] call lhm_fnc_handleInv)) then
	{
		private["_type"];
		_type = [_item,0] call lhm_fnc_varHandle;
		_type = [_type] call lhm_fnc_varToStr;
		hint format[localize "STR_NOTF_GivenItem",_from getVariable["realname",name _from],_val,_type];
	}
		else
	{
		[[_from,_item,_val,_unit,false],"lhm_fnc_giveDiff",_from,false] call lhm_fnc_mp;
	};
};