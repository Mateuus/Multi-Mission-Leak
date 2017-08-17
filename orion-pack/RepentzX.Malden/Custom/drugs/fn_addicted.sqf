/*
----------------------------------------------|
Author: Backer
Description: To much Drugs biatch! Lets start the effekt every 5 Mins. Called in Init Survival!
----------------------------------------------|
*/

closeDialog 0;
player say2D "addicted";

//Activate ppEffects we need
"radialBlur" ppEffectEnable true;
enableCamShake true;

//Let's go for 36secs of effetcs
for "_i" from 0 to 36 do
{
"radialBlur" ppEffectAdjust [random 1,random 0.5,1,0.5];
"radialBlur" ppEffectCommit 1;
addcamShake[random 10, 1, random 10];
sleep 1;
};

//Stop effects
"radialBlur" ppEffectAdjust [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"radialBlur" ppEffectEnable false;
resetCamShake;
