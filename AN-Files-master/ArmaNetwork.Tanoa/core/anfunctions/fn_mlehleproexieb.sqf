/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
_isBroken = _this select 0;
if(_isBroken) then {
  player setVariable["LegBroken", _isbroken, true];
  //PlaySound "breakleg";
  player playActionNow "PlayerProne";
  player setHitPointDamage ["hitLegs", 0.7];
  [_isbroken,1204] call life_fnc_spunadruc;
} else {
  player setVariable["LegBroken", nil, true];
  [_isbroken,1204] call life_fnc_spunadruc;
  player setHitPointDamage ["hitLegs", 0];
};
life_BrokenLeg = _isBroken;
if(_isBroken)then{
  while{life_BrokenLeg} do {
    if (stance player != "PRONE" && !(player getVariable ["restrained",false]) && !(player getVariable ["Escorting",false]) && !(player getVariable ["surrender",false])) then {player playActionNow "PlayerProne";};
    sleep 4;
  };
};
