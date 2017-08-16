/*
	file: fn_hasOrgan.sqf
	author: [midgetgrimm] - A Grimm Life | Altis Life • Index page
*/

player setdamage 0.65;

while{player getVariable "missingOrgan"} do
{
	_dam = damage player;
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [2];
	"dynamicBlur" ppEffectCommit 1;
	sleep 5;
	player setdamage (_dam+0.01);
};

"dynamicBlur" ppEffectEnable false;
player setdamage 0.25;