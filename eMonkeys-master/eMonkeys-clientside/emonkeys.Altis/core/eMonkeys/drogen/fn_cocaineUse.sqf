/*
	File: fn_cocaineUse.sqf
	Author: Mario
	
	Description:
	Cocaine disables the Fatigue System for 10 Minutes but u get an addiction effect when the stacks of cocaine run out.
	Also it can give an overdose.
*/

private["_dmg","_count"];

if(EMonkeys_drugged_cocaine < 1) then { EMonkeys_drugged_cocaine = 1; } else {EMonkeys_drugged_cocaine = EMonkeys_drugged_cocaine + 1;};

// Overdose
if ( EMonkeys_drugged_cocaine > 2) then
{
	_dmg = (damage player) + 0.5;
	EMonkeys_drugged_cocaine = EMonkeys_drugged_cocaine - 1;
	
	if (_dmg < 1.0) then
	{
		hint "Du erleidest Schaden wegen einer Überdosis!";
		["shortWeak"] spawn EMonkeys_fnc_weaknessEffects;
		player setFatigue 1;
		player setDamage _dmg;
	} else {
		hint "Du Stribst an einer Überdosis!";
		player setDamage 1;
	};
} else {
	uisleep 5;
	["hardDrugUse"] call EMonkeys_fnc_weaknessEffects;
	titleText["Du erhältst 'Superkräfte' für 10 Minuten! Achte auf deinen Hunger!","PLAIN"];
	player enableFatigue false;
	player setDamage 0;
	player setVariable["drug_cocaine",true,true];

	for [{_x=0},{_x < EMonkeys_drugged_cocaine_duration * 4 && Alive player},{_x=_x+1}] do
	{
		if(_x % 4 == 0) then
		{
			EMonkeys_hu164 = EMonkeys_hu164 - 5;
			[] spawn EMonkeys_fnc_hudUpdate;
		};
		uisleep 15;	
	};
	
	EMonkeys_drugged_cocaine = EMonkeys_drugged_cocaine - 1;

	_count = 0;
	while{EMonkeys_drugged_cocaine < 1 && Alive player} do 
	{
		player enableFatigue true;
		if(EMonkeys_drugged_cocaine < 0 OR _count > 100) exitWith { EMonkeys_drugged_cocaine = -1; hint "Du bist nicht mehr von Kokain süchtig.";};
		
		if(_count < 1) then {hint "Du bist nun erschöpft und geschwächt aufgrund einer Überdosis! Rauch einen Joint oder nimm mehr um es zu stoppen!";};
		
		if(_count % 10 == 0) then
		{
			player setFatigue 1;
			["shortWeak"] spawn EMonkeys_fnc_weaknessEffects;
			player setDamage (damage player) + 0.1;	
			[] spawn EMonkeys_fnc_hudUpdate;
		};
		
		_count = _count + 1;
		
		uisleep 12;
	};
	
	if(EMonkeys_drugged_cocaine < 0 || ((!alive player) || (player getVariable["onkill",FALSE]))) then { player setVariable["drug_cocaine",false,true]; EMonkeys_drugged_cocaine = -1; };

};