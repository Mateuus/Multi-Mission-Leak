/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(dialog) exitWith {};
if(!life_lawyer) exitWith {hintSilent "You do not have a Law Degree!";};
if(OnLawyerJob) exitWith {hintSilent "You're already on a job!";};
if(!LawyerDutyOn) exitWith {hintSilent "You're not currently taking on jobs!";};
[player] remoteExecCall ["life_fnc_lawyerGetJobs",2];
