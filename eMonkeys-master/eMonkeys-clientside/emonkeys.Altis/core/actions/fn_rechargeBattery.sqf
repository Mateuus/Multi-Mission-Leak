/*
	File: fn_rechargeBattery.sqf
	Author: KampfKuerbisHD
	
	E-Monkeys.com
*/
if((eM_recharge)) exitWith {};
if(EMonkeys_bat164 >= 100) exitWith {hint "Dein Akku ist bereits voll!"};

eM_recharge = true;

while{true} do
{
	uisleep 1;
	EMonkeys_bat164 = EMonkeys_bat164 + 5;
	[] call EMonkeys_fnc_hudUpdate;
	if(EMonkeys_bat164 >= 100) exitWith
	{
		hint "Dein Akku wurde vollständig aufgeladen";
		EMonkeys_bat164 = 100;
		eM_recharge = false;
		[] call EMonkeys_fnc_hudUpdate;
	};
};