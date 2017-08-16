/*
	File: fn_setPain.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	OUCH!
*/

_pain = [_this,0,0,[0]] call BIS_fnc_param;

_oldPain = life_pain;
life_pain = _pain;
player setVariable["pain", _pain, true];

if (_pain > 0) then
{
	if (life_cocaine_effect > 0) exitWith {};
	player setVariable["pain", _pain, true];
	systemChat "You are in pain!";
	[_pain] spawn
	{
		_pain = (_this select 0);
		while {true} do
		{
			if (_pain != life_pain) exitWith {};
			resetCamShake;
			addCamShake [1, 2, (_pain * 10)];
			sleep 3.5;
		};
	};
}
else
{
	player setVariable["pain", nil, true];
};