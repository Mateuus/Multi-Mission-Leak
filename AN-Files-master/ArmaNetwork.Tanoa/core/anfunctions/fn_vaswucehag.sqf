/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private ["_alclevel","_center"];
params [
  ["_type","",[""]]
];

_alclevel = 0.00;

if(skill_alcohol) then {
  _alclevel = switch(_type)do {
    case "beer": {0.03};
    case "vodka": {0.08};
    case "whiskey": {0.10};
  };
} else {
  _alclevel = switch(_type)do {
    case "beer": {0.05};
    case "vodka": {0.10};
    case "whiskey": {0.10};
  };
};
if(alcohol_level isEqualTo 0) then {
  if(AlcoholThread isEqualTo -1) then {
    AlcoholThread = [60,life_fnc_drawrewuce,[],true] call life_fnc_phefakefe;
  };
  "RadialBlur" ppEffectEnable true;
};
alcohol_level = alcohol_level + _alclevel;
if (alcohol_level > 1) then {alcohol_level = 1;};
player setVariable["BAC",alcohol_level,true];
_center = 0.5 - (alcohol_level / 2);
if (_center < 0.2) then {_center = 0.2;};
"RadialBlur" ppEffectAdjust [0.05,0.05,_center,_center];
"RadialBlur" ppEffectCommit 1;
