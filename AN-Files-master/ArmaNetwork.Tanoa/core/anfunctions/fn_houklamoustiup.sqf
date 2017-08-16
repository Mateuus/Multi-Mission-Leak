/*
  ArmA.Network
  Author: Cupcake
  Modified by Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private ["_bleedRate","_bloodLevel","_regenRate","_newRegenRate","_newBloodLevel","_lifeState"];
if(!alive player) exitWith {};
_bleedRate = 0;
_bloodLevel = 0;
_regenRate = 0;
_lifeState = 0;
_newBloodLevel = 0;
_bleedRate = player getVariable "BleedRate";
_bloodLevel = player getVariable "BloodLevel";
_regenRate = player getVariable "RegenRate";
_lifeState = player getVariable "LifeState";
_newBloodLevel = _bloodLevel - _bleedRate;
if(_bleedRate > 1) then {
	[true,1200] call life_fnc_spunadruc;
};
if(_bleedRate < 1) then {
	[false,1200] call life_fnc_spunadruc;
};
_newBloodLevel = _newBloodLevel + _regenRate;
_newBleedRate = _bleedRate*BloodClotRate;
player setVariable ["BleedRate", _newBleedRate, true];
if(_newBloodLevel > 5500) then {
	_newBloodLevel = 5500;
};
if (_newBloodLevel <= 0) then {
	player setDamage 1;
};
if(_regenRate > BaseRegenRate) then {
	_newRegenRate = _regenRate - RegenRateRecover;
	if(_newRegenRate < BaseRegenRate) then {
		_newRegenRate = BaseRegenRate;
    };
    if ((_newRegenRate > MaxRegenRate) && {!(_lifeState isEqualTo 2)}) then {
		"overdose" spawn life_fnc_koeflapienlabr;
    };
    player setVariable ["RegenRate",_newRegenRate,true];
};
if(!((_bloodLevel > 2000) && {_regenRate > _bleedRate}) && {_lifeState isEqualTo 0}) then {
	_unconcsChance = ((1 - (_newBloodLevel-1000)/1000)*((_bleedRate - _regenRate)/10))*BleedUnconcsCoeff;
    _unconcsRoll = random 1;
    if (_unconcsRoll > (1 - _unconcsChance)) then {
      "bleed" spawn life_fnc_koeflapienlabr;
    };
};
player setVariable ["BloodLevel",_newBloodLevel,true];
if(DebugHintBool) then {hintSilent format ["Blood level: %1 \n\nBleed rate: %2 \n\nRegen rate: %3", _newBloodLevel, _bleedRate, _regenRate];};
