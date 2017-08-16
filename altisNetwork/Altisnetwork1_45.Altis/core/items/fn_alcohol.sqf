/*
    File: fn_morphine.sqf
    Author: Ilusionz

    Description:
	Upon use of Morphine, this script will add health over time while also giving a bit of a high.
*/

private["_damage"];

closeDialog 0;

hint "You suddenly feel very dizzy! You shouldn't drive liek this!";
sleep 3;

"radialBlur" ppEffectEnable true;
enableCamShake true;

for "_i" from 0 to 19 do
{  
    "radialBlur" ppEffectAdjust  [random 0.06,random 0.06,0.25,0.25];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
    sleep 1;
};

"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

"radialBlur" ppEffectEnable false;
resetCamShake;