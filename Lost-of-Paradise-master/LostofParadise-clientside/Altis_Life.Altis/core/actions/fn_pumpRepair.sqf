/*
	File: fn_pumpRepair.sqf
	
	Description:
	Quick simple action that is only temp.
*/
private["_method"];
if(life_6cash < 500) then
{
	if(life_atm5cash < 500) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "You do not have $500 in cash or in your bank accoumt."};
	case 1: {vehicle player setDamage 0; life_6cash = life_6cash - 500; hint "You have repaired your vehicle for $500";};
	case 2: {vehicle player setDamage 0; life_atm5cash = life_atm5cash - 500; hint "You have repaired your vehicle for $500";};
};