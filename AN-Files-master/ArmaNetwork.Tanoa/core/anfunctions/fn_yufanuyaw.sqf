/*
	File: fn_yufanuyaw.sqf
*/
_animation = param[0,"medic",[""]];
_animationName = getText(missionConfigFile >> "CfgAnimations" >> _animation >> "animation");
_sleep = getNumber(missionConfigFile >> "CfgAnimations" >> _animation >> "time");
if!(currentWeapon player isEqualTo "") then
{
	player action ["SwitchWeapon", player, player, 100];
};
_return = [_animationName,_sleep] spawn {
	while {!isNull player && alive player} do
	{
		player playMove (_this select 0);
		waitUntil {animationState player != (_this select 0)};
		sleep (_this select 1);
	};
};
_return;
