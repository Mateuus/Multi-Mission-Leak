#include <macro.h>
/*
    File: fn_cocaine.sqf
    Author: Kuchiha
	Edit: blaster

    Description:
    Cocaine effects.
*/

//Close inventory
closeDialog 0;

//Little hint then wait a litle before starting drugs effects
hint "Say hello to my little friend!...";
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

player say3D "coke";

//Let's go for 60 secs of effects
for "_i" from 0 to 60 do
{
	"colorCorrections" ppEffectAdjust [1, 1.8, 0, [0,0,0,0], [1,1,1,1], [0,0,0,0]];
	"colorCorrections" ppEffectCommit 1;
    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
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