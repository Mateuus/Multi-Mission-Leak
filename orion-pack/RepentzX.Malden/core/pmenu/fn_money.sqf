#include "..\..\script_macros.hpp"
/*
//--Repentz for Arma Nexus
*/
private["_dialog","_inv","_lic","_licenses","_near","_near_units","_cashstatus","_atmstatus","_shrt","_side"];

disableSerialization;
waitUntil {!isNull findDisplay 2001};

[] call life_fnc_p_updateMenu;

_display = findDisplay 2001;
_near = _display displayCtrl 2022;
_atmstatus = _display displayCtrl 1100;
_cashstatus = _display displayCtrl 1101;

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units set [count _near_units,_x];};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		_near lbAdd format["%1 - %2",getPlayerUID _x, side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;

_atmstatus ctrlSetStructuredText parseText format [" $%1",[life_fishFinder] call life_fnc_numberText];
_cashstatus ctrlSetStructuredText parseText format [" $%1",[life_houseProtect] call life_fnc_numberText];
