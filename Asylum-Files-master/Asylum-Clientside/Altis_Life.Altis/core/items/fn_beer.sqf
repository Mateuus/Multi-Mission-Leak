/*
	File: fn_beer.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Feeling.. good?
*/

_item = _this select 0;

life_alcohol_level = if (_item == "beer") then { life_alcohol_level + 0.10 } else { life_alcohol_level + 0.30 };  
if (life_alcohol_level > 1) then { life_alcohol_level = 1; };
[] call life_fnc_hudUpdate;

_center = 0.5 - (life_alcohol_level / 2);
if (_center < 0.2) then { _center = 0.2; };
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust [0.05,0.05,_center,_center];
"RadialBlur" ppEffectCommit 1;

sleep 180;
life_alcohol_level = life_alcohol_level - 0.10;
if (life_alcohol_level < 0) then { life_alcohol_level = 0; };
if (life_alcohol_level > 0) then
{
	"RadialBlur" ppEffectEnable true;
	"RadialBlur" ppEffectAdjust [0.05,0.05,_center,_center];
	"RadialBlur" ppEffectCommit 1;
}
else
{
	"RadialBlur" ppEffectEnable false;
};

player setCustomAimCoef (life_alcohol_level * 35);