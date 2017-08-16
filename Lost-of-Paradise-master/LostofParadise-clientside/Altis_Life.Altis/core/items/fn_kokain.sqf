/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
_smoke = "SmokeShellBlue" createVehicle position player;
closeDialog 0;
life_pickAxeAllowed = false;
life_action_gather = true;
life_action_inUse = true;
sleep 1;
if (vehicle player != player) then {
	_smoke attachTo [vehicle player, [0,-1,0]];
} else {
	_smoke attachTo [player, [0,0,1]];
};
hint "Keine Macht den Drogen!";
player setDamage 0.15;


"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
enableCamShake true;	 // enables camera shake
10 fadeSound 1;	 //fades the sound back to normal
addCamShake [75, 40, 0.3];	
			sleep (8); 			
			addCamShake [62, 50, 0.2];	
			sleep (10); 					
			addCamShake [23, 60, 0.1];
			sleep (12); 
10 fadeSound 1;	 





"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
enableCamShake true;	 // enables camera shake
addCamShake [10, 45, 10];	// sets shakevalues
5 fadeSound 0.1;	 // fades the sound to 10% in 5 seconds


sleep 50;
	
"dynamicBlur" ppEffectEnable true; // enables ppeffect
hint "Drogen nix gut!";
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
resetCamShake; // resets the shake
20 fadeSound 1;	 //fades the sound back to normal
sleep 10;
life_action_gather = false;
life_action_inUse = false;
life_pickAxeAllowed = true;