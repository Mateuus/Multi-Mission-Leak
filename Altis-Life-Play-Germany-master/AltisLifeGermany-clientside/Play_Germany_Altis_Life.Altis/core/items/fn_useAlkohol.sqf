//Close inventory
closeDialog 0;

//Little hint then wait a litle before starting drugs effects
hint "Hicks, du fuehlst dich komisch.";
sleep 3;

//Activate ppEffects we need
"radialBlur" ppEffectEnable true;
enableCamShake true;

//Let's go for 45secs of effetcs
for "_i" from 0 to 300 do
{
    "radialBlur" ppEffectAdjust  [random 0.8,random 0.7,0.30,0.35];
    "radialBlur" ppEffectCommit 3;
    addcamShake[random 4, 2, random 5];
	"filmGrain" ppEffectEnable true;
    "filmGrain" ppEffectAdjust [0.09, 1, 2, 0.1, 1, false];
    "filmGrain" ppEffectCommit 0;
	player setVariable ["drug_alk", true, true];
	sleep 1;
};

//Stop effects
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
"filmGrain" ppEffectEnable false;
sleep 6;

//Deactivate ppEffects
"radialBlur" ppEffectEnable false;
"filmGrain" ppEffectEnable false;
resetCamShake;
player setVariable ["drug_alk", false, true];