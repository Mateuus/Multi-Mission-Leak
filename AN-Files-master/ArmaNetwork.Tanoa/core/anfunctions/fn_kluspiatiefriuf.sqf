/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(isNil "LawyerJobInfo") exitWith {hintSilent "It seems you've already collected your payment from your last job!";};
[(LawyerJobInfo select 0),1,0] call life_fnc_sewawruk;
deleteMarkerLocal "LawClientPos";
LawyerJobInfo = nil;
OnLawyerJob = false;
LawyerDutyOn = false;
[0] call life_fnc_hietroethiethla;
hint "You've completed this job";
