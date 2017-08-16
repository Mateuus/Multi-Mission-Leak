/*
	File: fn_pumpRepair.sqf
	
	Description:
	Quick simple action that is only temp.
*/

if (life_money < 50 && life_atmmoney < 50) exitWith { hint "You do not have $50 in cash or in your bank account." };

_source = "cash";
if (life_money < 50) then { _source = "atm" };

vehicle player setDamage 0;
[_source,"take",50] call life_fnc_uC;
hint "You have repaired your vehicle for $50.";