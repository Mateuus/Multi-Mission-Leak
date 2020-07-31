/*
	File: fn_useBec.sqf
	@Deo	
	Description:
	Bacon, Eggs & Coffee.
*/

#include <macro.h>
life_intox = 0.00;

player setVariable["intoxicated",false,true];

closeDialog 0;

enableCamShake true;
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
if(life_num <= 0) then {
	player enableFatigue true;
};
player setFatigue 0;
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
enableCamShake false;
["Add","Food",100] spawn fnc_sustain;
["Add","Drink",100] spawn fnc_sustain;