/*
	File: fn_giveDiff.sqf
	
	
	Description:
	??A?SD?ADS?A
*/

params ["_unit","_item","_val","_from","_bool"];
if(_unit != player) exitWith {};

_bool = if(count _this > 4) then {true} else {false};
_type = [_item,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;

if(_bool) then
{
	if(([true,_item,(parseNumber _val)] call life_fnc_handleInv)) then
	{
		[format[localize "STR_MISC_TooMuch",_from getVariable["realname",name _from],_val,_type], false] spawn domsg;
	};
}
	else
{
	if(([true,_item,(parseNumber _val)] call life_fnc_handleInv)) then
	{
		[format[localize "STR_MISC_TooMuch_2",_from getVariable["realname",name _from],_val,_type], false] spawn domsg;
	};
};