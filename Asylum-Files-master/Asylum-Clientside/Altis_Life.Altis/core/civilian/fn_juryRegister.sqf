/*
	File: fn_juryRegister.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Jury member signing in for duty at courthouse
*/

if (isNil "life_jury_registered") exitWith { hint "You have not been summoned for jury duty at this time." };
if (life_jury_registered) exitWith { hint "You've already registered for jury duty.  Please wait near the courthouse for a few minutes."; };
if (vehicle player != player) exitWith { hint "You cannot register for jury duty from within a vehicle." };

hint "You have registered for jury duty. Please remain at the courthouse for a few minutes until court is in session.";

life_jury_pos = getPosATL player;
life_jury_registered = true;

[[player, true],"life_fnc_juryRegistered",false,false] spawn life_fnc_MP;

[] spawn
{
	life_jury_registered = true;
	while {!isNil "life_jury_registered" && !(player getVariable["jury",false])} do
	{
		if (player distance life_jury_pos > 25 || vehicle player != player) exitWith
		{
			[[player, false],"life_fnc_juryRegistered",false,false] spawn life_fnc_MP;
			life_jury_registered = false;
			hint "You moved too far from the courthouse or entered a vehicle.  You have been removed from the jury bench.  Quickly register for duty again before the trial begins if you wish to attend.";
		};
	};
};