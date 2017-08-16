[] execFSM "core\fsm\Effect.fsm";
[] spawn { 
emonkeys_after = false;
private ["_i","_unit","_effect"];
_unit = player;


_effect = ppEffectCreate ["colorInversion", 2000];
_effect ppEffectEnable true;
_effect ppEffectAdjust [0.3,0.3,0.3];
_effect ppEffectCommit 0;
_shake_counter = 0;
_vision_counter = 0;

for [{_i=0}, {_i<1500}, {_i=_i+1}] do
{
if (emonkeys_after) exitWith {};
	uisleep 1.8;
	_unit setfatigue 1;
	if ((_i % 3 == 0)&& (_vision_counter < 3)) then
	{
		_vision_counter = _vision_counter + 1;
		_effect ppEffectEnable true;
	}
	else
	{
		if ((_i % 10 == 0) && (_shake_counter < 3)) then
		{
			addCamShake [50, 3, 20];
			_shake_counter = _shake_counter + 1;
		};
		_effect ppEffectEnable false;
	};
};
ppEffectDestroy _effect;
emonkeys_after = true;
};