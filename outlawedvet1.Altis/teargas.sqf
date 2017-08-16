/*
	teargas.sqf
	
	Description: activate ppEffects if a smoke grenade is near a player
	
	Author : Blackd0g // Edited by StevieWonder
*/
playerNearGas=false;

[] spawn {
	while {true} do
	{
	
		if
		(
		(((nearestObject [getpos player, "SmokeShellBlue"]) distance player < 20) and (getpos (nearestObject [getpos player, "SmokeShellgreen"]) select 2 < 0.5)) 
		or 
		(((nearestObject [getpos player, "G_40mm_SmokeGreen"]) distance player < 4) and (getpos (nearestObject [getpos player, "G_40mm_SmokeGreen"]) select 2 < 0.5)) 
		) then 
		{ 
		playerNearGas=true; 
		} 
		else 
		{
		playerNearGas=false;
		};
	
	uiSleep 3;
	};	
};

[] spawn {
	while {true} do 
	{
	if(player distance (getMarkerPos "campnorth") < 175) exitWith {};
	if(player distance (getMarkerPos "campsouth") < 175) exitWith {};

		 "dynamicBlur" ppEffectEnable true; // enables ppeffect
		 "dynamicBlur" ppEffectAdjust [0]; // enables normal vision
		 "dynamicBlur" ppEffectCommit 20; // time it takes to normal
		 resetCamShake; // resets the shake
		 20 fadeSound 1; //fades the sound back to normal
		
		waituntil {playerNearGas}; // Wait till a Gas Grenade is near player
		if (((playerside isequalto civilian) && (headgear player isequalto "H_CrewHelmetHeli_B")) ||((playerside isequalto west) && ((headgear player isequalto "H_HelmetSpecB_blk") || (headgear player isequalto "H_HelmetB_black")))) then {antidote1 = 2581} else {antidote1 = 2583}; // Player carries the Gas Suit
		if (antidote1 isequalto 2583) then {
		 "dynamicBlur" ppEffectEnable true; // enables ppeffect
		 "dynamicBlur" ppEffectAdjust [20]; // intensity of blur
		 "dynamicBlur" ppEffectCommit 2; // time till vision is fully blurred
		 enableCamShake true; // enables camera shake
		 addCamShake [25, 50, 25]; // sets shakevalues
		 player setFatigue 1; // sets the fatigue to 100%
		 2 fadeSound 0.1; // fades the sound to 10% in 5 seconds
		};

	uiSleep 1;
	};
};