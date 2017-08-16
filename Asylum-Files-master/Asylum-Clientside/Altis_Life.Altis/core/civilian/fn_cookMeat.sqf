/*
	File: fn_cookMeat.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Cooks all meat in player's virtual inventory.
*/
private["_corpse","_animals","_success"];

_meats = 0;
_meats = _meats + life_inv_dog + life_inv_sheep + life_inv_goat + life_inv_chicken + life_inv_snake + life_inv_rabbit;
if (_meats == 0) exitWith { hint "You don't have any raw meat to be cooked!"; };

[2, format["You begin cooking %1 raw meat.", _meats]] call life_fnc_broadcast;

for "_i" from 1 to _meats do
{
	[[player,"AinvPknlMstpSnonWnonDnon_medic_2"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	sleep 2.3;
};

if (!alive player) exitWith {};

_meatTypes = ["chicken", "dog", "sheep", "goat", "snake", "rabbit"];

{
	_num = missionNamespace getVariable ([_x,0] call life_fnc_varHandle);
	if (_num > 0) then
	{
		[false,_x,_num] call life_fnc_handleInv;
		[true,format["%1p",_x],_num] call life_fnc_handleInv;
	};
} forEach _meatTypes;

[2, format["You've successfully cooked %1 raw meat.", _meats]] call life_fnc_broadcast;