#include <macro.h>
private["_unit","_item","_val","_from","_bool"];
_unit = _this select 0;
if(_unit != player) exitWith {};
_item = _this select 1;
_val = _this select 2;
_from = _this select 3;
_bool = if(count _this > 4) then {true} else {false};
_type = M_CONFIG(getText,"ANL_VItems",_item,"displayName");

if(_bool) then
{
	if(([true,_item,(parseNumber _val)] call life_fnc_handleInv)) then
	{
		hint format["Vous avez essayé de donner %1 %2 %3 mais il ne peut pas le prendre.",_from getVariable["realname",name _from],_val,_type];
	};
}
	else
{
	if(([true,_item,(parseNumber _val)] call life_fnc_handleInv)) then
	{
		hint format["%1 vous a rendu %2 %3 car il ne peut pas en prendre autant !",_from getVariable["realname",name _from],_val,_type];
	};
};