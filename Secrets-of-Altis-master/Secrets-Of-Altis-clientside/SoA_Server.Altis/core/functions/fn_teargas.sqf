private["_pos","_obj"];
_obj = _this select 0;
_pos = getposATL _obj;

if(count _pos == 0) exitWith {}; //Badddd
if(player distance _pos > 10) exitWith {}; //Bad again.
if(goggles player == "G_Combat") exitWith {};

while{!isnull _obj} do {
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
	"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
	enableCamShake true;     // enables camera shake
	addCamShake [10, 45, 10];    // sets shakevalues
	player setFatigue 1; // sets the fatigue to 100%
	5 fadeSound 0.1;     // fades the sound to 10% in 5 seconds
};

"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
resetCamShake; // resets the shake
20 fadeSound 1;  //fades the sound back to normal