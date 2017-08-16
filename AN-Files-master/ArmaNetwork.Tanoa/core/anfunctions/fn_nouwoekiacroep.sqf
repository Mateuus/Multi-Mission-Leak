/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_player = param [0,objNull,[objNull]];
if(!isPlayer _player) exitWith {hintSilent "";};
if(!alive _player) exitWith {hintSilent "";};
_bloodLevel = _player getVariable "BloodLevel";
_bleedRate = _player getVariable "BleedRate";
_regenRate = _player getVariable "RegenRate";
_brokenBone = _player getVariable "LegBroken";
_brokenBoneDesc = "";
if(isNil "_brokenBone") then {
  _brokenBoneDesc = "Legs look fine";
} else {
  _brokenBoneDesc = "Legs are broken";
};
if ("Medikit" in items player OR {playerSide isEqualTo independent}) then {
  hintSilent parseText format ["Diagnosis:<br/><t color='#FF0000'>Blood Levels: %1<br/>Bleeding rate: %2<br/>Blood Regen Rate: %3<br/>Bones: %4</t>",_bloodLevel,_bleedRate,_regenRate,_brokenBoneDesc];
} else {
  _bloodLevelDesc = "Blood Level is critical.";
  if (_bloodLevel > 1000) then {_bloodLevelDesc = "Blood Level is extremely low."};
  if (_bloodLevel > 2000) then {_bloodLevelDesc = "Blood Level is low."};
  if (_bloodLevel > 3000) then {_bloodLevelDesc = "Blood Level is moderate."};
  if (_bloodLevel > 4000) then {_bloodLevelDesc = "Blood Level is OK."};
  if (_bloodLevel > 5000) then {_bloodLevelDesc = "Blood Level is optimal."};
  _bleedRateDesc = "Not Bleeding";
  if (_bleedRate > 1) then {_bleedRateDesc = "Bleed Rate is Minor"};
  if (_bleedRate > 10) then {_bleedRateDesc = "Bleeding"};
  if (_bleedRate > 20) then {_bleedRateDesc = "Bleeding badly"};
  if (_bleedRate > 40) then {_bleedRateDesc = "Bleed Rate Extremely High"};
  if (_bleedRate > 60) then {_bleedRateDesc = "Major bleeding"};
  if (_bleedRate > 80) then {_bleedRateDesc = "Bleed Rate critical"};
  _regenRateDesc = "Blood Regen Rate is Normal";
  if (_regenRate > 1) then {_regenRateDesc = "Mild Blood Regen Rate"};
  if (_regenRate > 2.5) then {_regenRateDesc = "Accelerated Blood Regen Rate"};
  if (_regenRate > 5) then {_regenRateDesc = "High Blood Regen Rate"};
  if (_regenRate > 7) then {_regenRateDesc = "Dangerous Blood Regen Rate"};
  if (_regenRate > 10) then {_regenRateDesc = "Extreme Blood Regen Rate"};
  hintSilent format ["The following has been found:\n%1\n%2\n%3\n%4",_bloodLevelDesc,_bleedRateDesc, _regenRateDesc,_brokenBoneDesc];
};
