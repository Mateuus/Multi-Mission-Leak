if (vehicle player != player) exitWith {};
player playActionNow "agonyStart";
disableuserinput true;
player setCaptive true;
player setVariable ["tf_unable_to_use_radio", true];
player setVariable ["tf_voiceVolume", 0, true];

if (_this != "overdose") then {
  if (_this isEqualTo "instant") then
  {
   1 cutText ["", "BLACK OUT", 0];
  };
  if (_this isEqualTo "bleed") then
  {
   1 cutText ["", "BLACK OUT", 3];
  };
  player setVariable ["LifeState", 1, true];
  sleep 6;
  disableuserinput false;
  player enableSimulation false;
  while {(alive player) && (player getVariable "LifeState" isEqualTo 1)} do {
    _bleedRate = player getVariable "BleedRate";
    _regenRate = player getVariable "RegenRate";
    _bloodLevel = player getVariable "BloodLevel";
    _recoverChance = (((_bloodLevel - 1000)/1000)*((_regenRate - _bleedRate)/8))*UnconcsAutorecoverCoeff;
    _recoverRoll = random 1;
    if (((_recoverRoll > (1 - _recoverChance)) || (_recoverRoll > 0.99)) && (_bloodLevel > 1000)) then {
      player setVariable ["LifeState", 0, true];
    };
  };
  if (player getVariable "LifeState" == 2) exitWith {};
};

if (_this isEqualTo "overdose") then
{
  1 cutText ["", "BLACK OUT", 1];
  player setVariable ["LifeState", 2, true];
  sleep 6;
  disableuserinput false;
  player enableSimulation false;
  while {(alive player) && (player getVariable "LifeState" == 2)} do
  {
    _regenRate = player getVariable "RegenRate";
    if (_regenRate < MaxRegenRate) then
    {
      _recoverRoll = random 1;
      if (_recoverRoll > OverdoseUnconcsRecoverChance) then
      {
        player setVariable ["LifeState", 0, true];
      };
    };
    _newRegenRate = _regenRate - RegenRateRecoverUnconcs;
    player setVariable ["RegenRate", _newRegenRate, true];
    2 cutText [format ["You've overdosed. Whoops. You will stabilise in approximately %1 seconds.", ceil ((_newRegenRate - MaxRegenRate)/(RegenRateRecover + RegenRateRecoverUnconcs))], "PLAIN", 0];
    if (_newRegenRate < MaxRegenRate) then {2 cutText ["You've overdosed. Whoops. You will recover soon.", "PLAIN", 0];};
    sleep 1;
  };
};
1 cutText ["", "BLACK IN", 10];
sleep RecoverControlsDelay;
player enableSimulation true;
player playAction "agonyStop";
player setCaptive false;
player setVariable ["tf_voiceVolume", 1, true];
player setVariable ["tf_unable_to_use_radio", false];
