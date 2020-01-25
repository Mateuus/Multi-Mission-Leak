/*
	File: fn_pumpRepair.sqf
	
	Description:
	Quick simple action that is only temp.
*/
private["_method"];
if(cash_in_hand < 50) then
{
	if(cash_in_bank < 50) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "You do not have $500 in cash or in your bank accoumt."};
	case 1: {vehicle player setDamage 0; ["cash","take",50] call life_fnc_handleCash; hint "You have repaired your vehicle for $500";};
	case 2: {vehicle player setDamage 0; ["bank","take",50] call life_fnc_handleCash; hint "You have repaired your vehicle for $500";};
};