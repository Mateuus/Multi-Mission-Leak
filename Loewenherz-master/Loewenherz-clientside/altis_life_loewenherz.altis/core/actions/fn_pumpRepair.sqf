/*
	File: fn_pumpRepair.sqf
	
	Description:
	Quick simple action that is only temp.
*/
private["_method"];
if(lhm_cash < 500) then
{
	if(lhm_atmcash < 500) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "You do not have $500 in cash or in your bank accoumt."};
	case 1: {vehicle player setDamage 0; lhm_cash = lhm_cash - 500; hint "Du hast dein Fahrzeug für 500$ repariert";};
	case 2: {vehicle player setDamage 0; lhm_atmcash = lhm_atmcash - 500; hint "Du hast dein Fahrzeug für 500$ repariert";};
};