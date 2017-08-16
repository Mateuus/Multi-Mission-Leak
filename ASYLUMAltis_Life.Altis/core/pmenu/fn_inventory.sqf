/*
	File: fn_inventory.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Opens player inventory
*/
private["_display","_near"];

disableSerialization;
waitUntil {!isNull findDisplay 2001};

if (life_action_in_use) exitWith { hint "You can't open your inventory while performing another action."; };
[] call life_fnc_p_updateMenu;

_display = findDisplay 2001;
_near = _display displayCtrl 2023;
_inv = _display displayCtrl 2005;

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"medic"};};

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units set [count _near_units,_x];};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		_near lbAdd format["%1 - %2",name _x, side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;

lbClear _inv;
{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
		_inv lbSetPicture [(lbSize _inv)-1,format["icons\%1.paa",_shrt]];
	};
} foreach life_inv_items;