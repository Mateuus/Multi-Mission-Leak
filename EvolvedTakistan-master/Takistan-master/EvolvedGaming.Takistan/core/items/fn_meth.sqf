#include <macro.h>
/*
    File: fn_cokecoffee.sqf
    Author: Kuchiha
	Edit:Blaster

    Description:
    Doped coffee effects.
*/

//Close inventory
closeDialog 0;

//Little hint then wait a litle before starting drugs effects
hint "Say my name...";
sleep 3;

//Activate ppEffects we need
"colorCorrections" ppEffectEnable true;
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

[] spawn {
	life_redgull_effect = time;
	player enableFatigue false;
	waitUntil {!alive player OR ((time - life_redgull_effect) > (1 * 60))};
	player enableFatigue true;
	};

player say3D "meth";

//Let's go for 45secs of effects
for "_i" from 0 to 60 do
{
	"colorCorrections" ppEffectAdjust [1, 1.8, 0, [0,0,0,0], [1,1,1,1], [0,0,0,0]];
	"colorCorrections" ppEffectCommit 1;
    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
    
	if(_i == 20) then {
	
		private ["_num"];
		_num = floor(random 5);
		switch (_num) do {
			case 0: {hint localize "STR_NOTF_DrinkMSG_3";};
			case 1: {titleText[format[localize "STR_House_Raid_NOTF",name player],"PLAIN"];};
			case 2: {hint "You have been kicked out of the gang.";	};
			case 3: {hint localize "STR_NOTF_EatMSG_3";};
			case 4: {hint localize "STR_NOTF_MaxWeight";};
		};
	
	};
	if(_i == 40) then {
	
		private ["_num"];
		_num = floor(random 5);
		switch (_num) do {
		case 0: {hint localize "STR_NOTF_DrinkMSG_3";};
		case 1: {titleText[format[localize "STR_House_Raid_NOTF",name player],"PLAIN"];};
		case 2: {hint "You have been kicked out of the gang.";	};
		case 3: {hint localize "STR_NOTF_EatMSG_3";};
		case 4: {hint localize "STR_NOTF_MaxWeight";};
		};
	
	};
	sleep 1;
};

//Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;