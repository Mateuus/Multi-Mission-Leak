#include <macro.h>
_pain = [_this,0,0,[0]] call BIS_fnc_param;
_oldPain = life_pain;
life_pain = _pain;
player SVAR["pain", _pain, true];
if (_pain > 0) then
{
	if (life_drug > 0) exitWith {};
	if (life_drink > 0.1) exitWith {};	
	player SVAR["pain", _pain, true];
	systemChat "Vous avez de violentes douleurs... Essayez de vous soigner !";
	[_pain] spawn
	{
		_pain = (_this select 0);
		while {true} do
		{
			if (_pain != life_pain) exitWith {};
			resetCamShake;
			addCamShake [1, 2, (_pain * 10)];
			uiSleep 3.5;
		};
	};
}
else
{
	player SVAR["pain", nil, true];
};