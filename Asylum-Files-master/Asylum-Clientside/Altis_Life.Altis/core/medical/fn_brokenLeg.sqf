/*
	File: fn_brokenLeg.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Holy crip I'm a crapple!
*/

_broken = [_this,0,false,[false]] call BIS_fnc_param;

if (_broken) then
{
	if (life_brokenLeg) exitWith {};
	player setVariable["broken", _broken, true];
	PlaySound "bonebreak";
	systemChat "You feel and hear your leg break!";
	player playActionNow "PlayerProne";
}
else
{
	player setVariable["broken", nil, true];
};

life_brokenLeg = _broken;

[] call life_fnc_hudUpdate;

if (_broken) then
{
	while {life_brokenLeg} do
	{
		if (stance player != "PRONE" && !(player getVariable ["restrained",false]) && !(player getVariable ["Escorting",false])) then { player playActionNow "PlayerProne"; };
		sleep 2;
	};
};