#include <macro.h>
/*
    File: fn_weed.sqf
    Author: Kuchiha
	Edit: Blaster

    Description:
    Weed effects.
*/

//Close inventory
closeDialog 0;


//Little hint then wait a little before starting drugs effects
hint "Awwww yeah...";
sleep 3;

//Activate ppEffects we need
"colorCorrections" ppEffectEnable true;
"radialBlur" ppEffectEnable true;

private ["_num","_color"];

_num = floor(random 7);

switch (_num) do {
	case 0: {_color = "SmokeShell";};
	case 1: {_color = "SmokeShellGreen";};
	case 2: {_color = "SmokeShellRed";};
	case 3: {_color = "SmokeShellBlue";};
	case 4: {_color = "SmokeShellOrange";};
	case 5: {_color = "SmokeShellYellow";};
	case 6: {_color = "SmokeShellPurple";};
};

_smoke = _color createVehicle position player;
if (vehicle player != player) then {
    _smoke attachTo [vehicle player, [-0.6,-1,0]];
} else {
    _smoke attachTo [player, [0,-0.1,1.5]];
};

//Let's go for 45secs of effects
for "_i" from 0 to 30 do
{
    "colorCorrections" ppEffectAdjust [1, 1, 0, [0.3,0.3,0.3,0.3], [0,0,0,1], [0,0,0,0]];
	"colorCorrections" ppEffectCommit 1;
	"radialBlur" ppEffectAdjust [random 0.02, random 0.02,0.15,0.15];
	"radialBlur" ppEffectCommit 1;
	life_hunger = life_hunger - 1;
	[] call life_fnc_hudUpdate;
    sleep 1;
};

//Stop effects
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"colorCorrections" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
