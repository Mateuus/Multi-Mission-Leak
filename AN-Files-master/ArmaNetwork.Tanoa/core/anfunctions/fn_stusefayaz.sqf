/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/

_bloodLevel = player getVariable "BloodLevel";
if (_bloodLevel < VignetteAlphaMax) then {
  VignetteAlpha = ((VignetteAlphaMax - _bloodLevel)/(VignetteAlphaMax - VignetteAlphaMin))^VignetteAlphaExp;
  if (VignetteAlpha > 1) then {VignetteAlpha = 1;};
  if (VignetteAlpha < 0) then {VignetteAlpha = 0;};
} else {VignetteAlpha = 0;};
9001 cutRsc ["DamageVignette", "PLAIN"];
