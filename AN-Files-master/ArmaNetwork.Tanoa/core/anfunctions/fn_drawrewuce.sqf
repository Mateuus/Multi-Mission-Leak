/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private ["_center","_decrease"];
_decrease = if("alcohol" in AN_Skills) then {0.20} else {0.10};
alcohol_level = alcohol_level - _decrease;
_center = 0.5 - (alcohol_level / 2);
player setVariable["BAC",alcohol_level,true];
if(alcohol_level < 0) then {alcohol_level = 0;[AlcoholThread] call life_fnc_vunurepru;AlcoholThread = -1;};
if(alcohol_level > 0) then {
	"RadialBlur" ppEffectEnable true;
	"RadialBlur" ppEffectAdjust [0.05,0.05,_center,_center];
	"RadialBlur" ppEffectCommit 1;
} else {
	"RadialBlur" ppEffectEnable false;
};
