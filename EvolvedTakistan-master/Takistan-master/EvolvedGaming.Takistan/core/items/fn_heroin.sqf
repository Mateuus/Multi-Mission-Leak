/*
    File: fn_heroin.sqf
    Author: Kuchiha
	Edit: Blaster

    Description:
    Heroin effects.
*/

//Close inventory
closeDialog 0;


//Little hint then wait a little before starting drugs effects
hint "At last I've found a product which totally eliminates the craving for cigarettes. Heroin.";

player say3D "heroin";
sleep 3;

//Activate ppEffects we need
"colorCorrections" ppEffectEnable true;
"radialBlur" ppEffectEnable true;

//Let's go for 45secs of effetcs
for "_i" from 0 to 50 do
{
    "colorCorrections" ppEffectAdjust [1, 1, 0, [0.3,0.3,0.3,0.3], [0,0,0,1], [0,0,0,0]];
	"colorCorrections" ppEffectCommit 1;
	"radialBlur" ppEffectAdjust [random 0.04, random 0.04,0.15,0.15];
	"radialBlur" ppEffectCommit 1;
	player forceWalk true;
	player setFatigue 1;
    sleep 1;
};

//Stop effects
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"colorCorrections" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
