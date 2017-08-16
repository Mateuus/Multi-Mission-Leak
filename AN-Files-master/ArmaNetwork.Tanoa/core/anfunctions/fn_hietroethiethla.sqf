/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_mode = param [3,-1,[0]];
if(_mode isEqualTo -1) exitWith {};
if(!life_lawyer) exitWith {hintSilent "You do not have a Law Degree";};
switch(_mode)do {
  case 0: {
    if(LawyerDutyOn) exitWith {hintSilent "You're already accepting Jobs!";};
    [player,0] remoteExecCall ["life_fnc_lawyerSDuty",2];
    hint "You're now clocked in";
    LawyerDutyOn = true;
  };
  case 1: {
    if(!LawyerDutyOn) exitWith {hintSilent "You're already taking a break!";};
    if(OnLawyerJob) exitWith {hintSilent "You're on a Job!";};
    [player,1] remoteExecCall ["life_fnc_lawyerSDuty",2];
    hint "You're now off duty";
    LawyerDutyOn = false;
  };
};
