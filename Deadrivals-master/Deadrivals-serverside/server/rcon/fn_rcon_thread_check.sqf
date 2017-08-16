private["_restartTime","_restartMessages","_useAutoKick","_kickTime","_lockTime","_uptime","_timeTilRestart","_time","_i"]; 
_restartTime = _this select 0; 
_restartMessages = _this select 1; 
_useAutoKick = _this select 2; 
_kickTime = _this select 3; 
_lockTime = _this select 4; 
_uptime = call SERVER_fnc_time_uptime; 
_timeTilRestart = _restartTime - _uptime; 
if (typeName _restartMessages isEqualTo "ARRAY") then 
{ 
if !(_restartMessages isEqualTo []) then 
{ 
{ 
_time = _x; 
if (_timeTilRestart < _time) then 
{ 
[format["SERVER RESTART IN %1 MINUTEN!",_time],"SERVER RESTART",13] remoteExec ["GUI_fnc_requestmessage",0]; 
ServerRestartMessages deleteAt _forEachIndex; 
format ["Restart Warnings for %1min sent",_time] call SERVER_fnc_util_log; 
}; 
}  
forEach _restartMessages; 
}; 
}; 
if (_timeTilRestart < _lockTime) then 
{ 
if (_timeTilRestart < _kickTime) then 
{ 
if !(ServerRestartMode) then 
{ 
SystemSpawnThread = []; 
"Buffers cleared!" call SERVER_fnc_util_log; 
for "_i" from 0 to 49 do 
{ 
"SERVER READY FOR RESTART!!" call SERVER_fnc_util_log; 
}; 
ServerRestartMode = true; 
if(getNumber(configFile >> "CfgSettings" >> "RCON" >> "useShutdown") isEqualTo 1)then 
{ 
'#shutdown' call RCON_fnc_rcon_event_sendCommand; 
}; 
}; 
}; 
};