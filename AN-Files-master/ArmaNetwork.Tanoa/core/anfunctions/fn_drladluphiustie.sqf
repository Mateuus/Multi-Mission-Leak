/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if!(playerSide isEqualTo civilian) exitWith {hintSilent "You're not allowed to request a Lawyer!";};
if(isNil "RequestedLawyer") then {RequestedLawyer = false;};
if(RequestedLawyer) exitWith {hintSilent "You've already requested a Lawyer";};
if(OnLawyerJob) exitWith {hintSilent "You're on a Job!";};
createDialog "lawyer_request";
