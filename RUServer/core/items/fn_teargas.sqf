////////////////////////////////////////////////////////////
// Teargas script
// by Taw_jarhead, TESTED: Taw_Mangkanor, Taw_Zomu, and Taw_Greyl
//
// call from units INIT with: null = [this] execVM "teargas.sqf"
////////////////////////////////////////////////////////////

// array of gasmasks
_gasmask = ["G_Combat", "G_Balaclava_combat"];
_myvariable = -1;


While{true} do {

// normal conditions
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
resetCamShake; // resets the shake
20 fadeSound 1;	 //fades the sound back to normal


waituntil
{
	((nearestObject [getpos player, "SmokeShellRed"]) distance player < 10) // classnames of smoke ["Smokeshell", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", 																													SmokeShellOrange", "SmokeShellBlue"]
	and
	(getpos (nearestObject [getpos player, "SmokeShellRed"]) select 2 < 0.5)
};

//titleText ["GAS! GAS! GAS!", "PLAIN"];
// grab goggles from player
_headgear = goggles player;
//hint goggles player;

if (_headgear in _gasmask)
	then {
			if (_myvariable < 0) then {};
	}



else
		{
			// play coughing sound
			//playsound "coughing";
			// run the teargas effects on player
			"dynamicBlur" ppEffectEnable true; // enables ppeffect
			"dynamicBlur" ppEffectAdjust [10]; // intensity of blur
			"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
			enableCamShake true;	 // enables camera shake
			addCamShake [10, 45, 10];	// sets shakevalues
			player setFatigue 1; // sets the fatigue to 100%
			5 fadeSound 0.1;	 // fades the sound to 10% in 5 seconds
			sleep 5;
			"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
			"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
			sleep 5;
		};
};
