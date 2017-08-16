/*
    File: fn_mushrooms.sqf
    Author: Kuchiha
	Edit: Blaster

    Description:
    mushroom effects.
*/

//Close inventory
closeDialog 0;

;
//Little hint then wait a little before starting drugs effects
hint "Oh God, I'm gonna be sick...";
sleep 3;
player say3D "mushrooms";

//Activate ppEffects we need
"colorCorrections" ppEffectEnable true;
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;

//Let's go for 45secs of effetcs
for "_i" from 0 to 6 do
{
    "colorCorrections" ppEffectAdjust [1, 1, 0, [(random 16)-8,(random 16)-8,(random 16)-8,((random 2)-1)*0.3], [(random 6)-3,(random 6)-3,(random 6)-3,(random 1)-0.5], [(random 6)-3,(random 6)-3,(random 6)-3,(random 1)-0.5]];
	"colorCorrections" ppEffectCommit 1;
	"chromAberration" ppEffectAdjust [random 0.01, random 0.01,true];
	"chromAberration" ppEffectCommit 1;
	"radialBlur" ppEffectAdjust [random 0.02, random 0.02,0.15,0.15];
	"radialBlur" ppEffectCommit 1;
    sleep 5;
};

//Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 3;

//Deactivate ppEffects
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
