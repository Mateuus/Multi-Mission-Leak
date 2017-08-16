/*
    File: fn_aircraftPushBack.sqf
	Autor: CooliMC
	
	Description: Lässt Flugzeuge Rückwärts fahren und gut lenken lassen
*/

if((!alive player) || ((driver (vehicle player)) != player) || (player == vehicle player) || (!((vehicle player) isKindOf "Air"))) exitWith {};

life_flyback = true;
if(isEngineOn (vehicle player)) then 
{
	if((speed (vehicle player)) == 0) then
	{
		if((damage (vehicle player)) <= 0.15) then {
			while {life_flyback} do
			{
				_dir = direction (vehicle player);
				(vehicle player) setVelocity [-(3 * (sin _dir)), -(3 * (cos _dir)), 0];
				if((!(isEngineOn (vehicle player))) || ((driver (vehicle player)) != player) || ((vehicle player) == player) || (!(alive player)) || ((damage (vehicle player)) > 0.15)) then { life_flyback = false; };
				sleep 0.01;
			};
		} else {
			hint 'Dein Fahrzeug hat zu viel Schaden genommen.';
			life_flyback = false;
		};
	} else {
		hint 'Du musst stehen, um Reverse Thrust einzuschalten.';
		life_flyback = false;
	};
} else {
	hint 'Der Motor muss eingeschaltet sein.';
	life_flyback = false;
};