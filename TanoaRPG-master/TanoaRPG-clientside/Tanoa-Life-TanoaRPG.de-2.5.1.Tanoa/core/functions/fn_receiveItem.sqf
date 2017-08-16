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

_diff = [_item,(parseNumber _val),life_carryWeight,life_maxWeight] call tanoarpg_fnc_calWeightDiff;

if(_diff != (parseNumber _val)) then
{
	if(([true,_item,_diff] call tanoarpg_fnc_handleInv)) then
	{
		hint format["%1 has gave you %2 but you can only hold %3 so %4 was returned back.",_from getVariable["realname",name _from],_val,_diff,((parseNumber _val) - _diff)];
		[_from,_item,str((parseNumber _val) - _diff),_unit] remoteExec ["tanoarpg_fnc_giveDiff", _from, false];
	}
		else
	{
		[_from,_item,_val,_unit,false] remoteExec ["tanoarpg_fnc_giveDiff", _from, false];
	};
}
	else
{
	if(([true,_item,(parseNumber _val)] call tanoarpg_fnc_handleInv)) then
	{
		private["_type"];
		_type = [_item,0] call tanoarpg_fnc_varHandle;
		_type = [_type] call tanoarpg_fnc_varToStr;
		hint format["%1 has gave you %2 %3",_from getVariable["realname",name _from],_val,_type];
	}
		else
	{
		[_from,_item,_val,_unit,false] remoteExec ["tanoarpg_fnc_giveDiff", _from, false];
	};
};