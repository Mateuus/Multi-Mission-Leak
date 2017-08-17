#include "..\..\script_macros.hpp"

if (safezone) exitWith {};
life_combatTime = time;
[] spawn life_fnc_reviveCooldown;
if (!life_firstCombatActive) then
{
	[] spawn
	{
		life_firstCombatActive = true;
        //["You have !",true,"slow"] call life_fnc_notificationSystem;
		while {(life_combatTime > (time - 120))} do
		{/*
			if ((cameraView == "External") && ((vehicle player) == player)) then {
				player switchCamera "Internal";
			};
			sleep 0.2;
		*/};
		life_firstCombatActive = false;
        //["You are no longer in first person mode!",true,"slow"] call life_fnc_notificationSystem;
	};
};