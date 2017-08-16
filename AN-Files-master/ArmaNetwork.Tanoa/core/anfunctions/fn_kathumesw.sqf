/*
  ArmA.Network
  Rathbone
  Adds Notification to Queue
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_config","",[""]],
  ["_yesorno",true,[false]]
];
_array = [];
if(_yesorno) then {
  if!(isClass (missionConfigFile >> "CfgANNotifications" >> _config)) exitWith {diag_log format ["Notification %1 Not found",_config];};
  _text = getText(missionConfigFile >> "CfgANNotifications" >> _config >> "text");
  _time = getNumber(missionConfigFile >> "CfgANNotifications" >> _config >> "time");
  _color = getArray(missionConfigFile >> "CfgANNotifications" >> _config >> "color");
  _array = [_text,_time,_color,true];
  NotificationArray pushBack _array;
} else {
  _array = [_config,5,[0,1,0,1],true];
  NotificationArray pushBack _array;
};
call life_fnc_yapaphest;
