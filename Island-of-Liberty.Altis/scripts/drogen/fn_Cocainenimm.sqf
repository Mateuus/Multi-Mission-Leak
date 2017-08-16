closeDialog 0;

player setVariable["Druged",true,true];
[player,"Cocaine_sound", 54] call life_fnc_globalSound;
//player say3D "Cocaine_sound";

"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 20; // time it takes to normal
20 fadeSound 1; //fades the sound back to normal

player setDamage (0.2 + (damage player));

"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [9]; // intensity of blur
"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
enableCamShake true; // enables camera shake
addCamShake [20, 100, 10]; // sets shakevalues
player setFatigue 1; // sets the fatigue to 100%
5 fadeSound 0.1; // fades the sound to 10% in 5 seconds

sleep 50;

"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 20; // time it takes to normal
20 fadeSound 1; //fades the sound back to normal

player setVariable["Druged",false,true];