/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_jobs",[],[[]]]
];
if(count _jobs isEqualTo 0) exitWith {hintSilent "No jobs available";};
disableSerialization;
createDialog "lawyer_jobs";
_dialog = findDisplay 85250;
_jobList = _dialog displayCtrl 1500;

{
  if(!isNull (_x select 0) && {alive (_x select 0)}) then {
  	_jobList lbAdd format ["Client %1",name (_x select 0)];
  	_jobList lbSetData [(lbSize _jobList)-1,str(_x)];
  };
} forEach _jobs;
