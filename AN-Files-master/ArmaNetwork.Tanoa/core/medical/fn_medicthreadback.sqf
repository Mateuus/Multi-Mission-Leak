/*
CMS Medic
Cupcake
Modified by Rathbone
*/
private ["_bleedRate","_bloodLevel","_regenRate","_newRegenRate","_newBloodLevel","_lifeState"];
if(!alive player) exitWith {};
// Fetching variables
_bleedRate = player getVariable "BleedRate";
_bloodLevel = player getVariable "BloodLevel";
_regenRate = player getVariable "RegenRate";
_lifeState = player getVariable "LifeState";
// Applying bleed & regen
_newBloodLevel = _bloodLevel - _bleedRate;
// Bleeding indicator
if (_bleedRate > 1) then
{
  true call life_fnc_spunadruc;
  41 cutRsc ["BleedWarn", "PLAIN", (_bleedRate-1)*BleedWarnCoeff, true];
};
_newBloodLevel = _newBloodLevel + _regenRate;
// Simulated blood clot
_newBleedRate = _bleedRate*BloodClotRate;
player setVariable ["BleedRate", _newBleedRate, true];
// Upper buffer (maximum blood)
if (_newBloodLevel > 5500) then
{
  _newBloodLevel = 5500;
};
// Lower buffer (death)
if (_newBloodLevel <= 0) then
{
  player setDamage 1;
};
// Regen rate handling
if (_regenRate > BaseRegenRate) then
{
  _newRegenRate = _regenRate - RegenRateRecover;
  // Lower buffer (minimum)
  if (_newRegenRate < BaseRegenRate) then
  {
    _newRegenRate = BaseRegenRate;
  };
  // Overdose unconsciousness
  if ((_newRegenRate > MaxRegenRate) && (_lifeState != 2)) then
  {
    "overdose" spawn life_fnc_koeflapienlabr;
  };
  player setVariable ["RegenRate", _newRegenRate, true];
};
// Bleedout unconsciousness
if (!((_bloodLevel > 2000) && (_regenRate > _bleedRate)) && (_lifeState == 0)) then
{
  _unconcsChance = ((1 - (_newBloodLevel-1000)/1000)*((_bleedRate - _regenRate)/10))*BleedUnconcsCoeff;
  _unconcsRoll = random 1;
  if (_unconcsRoll > (1 - _unconcsChance)) then
  {
    "bleed" spawn life_fnc_koeflapienlabr;
  };
};
player setVariable ["BloodLevel", _newBloodLevel, true];
if (DebugHintBool) then {hintSilent format ["Blood level: %1 \n\nBleed rate: %2 \n\nRegen rate: %3", _newBloodLevel, _bleedRate, _regenRate];};
