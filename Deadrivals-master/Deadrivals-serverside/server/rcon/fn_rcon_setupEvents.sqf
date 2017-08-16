private["_restartTime","_useRestartMessages"]; 
_restartTime = getArray (configFile >> "CfgSettings" >> "RCON" >> "restartTimer"); 
ServerRestartTime = ((_restartTime select 0) * 60) + (_restartTime select 1); 
ServerKickTime = getNumber (configFile >> "CfgSettings" >> "RCON" >> "kickTime"); 
ServerLockTime = getNumber (configFile >> "CfgSettings" >> "RCON" >> "restartAutoLock"); 
ServerUseAutokick = getNumber (configFile >> "CfgSettings" >> "RCON" >> "useAutoKick"); 
_useRestartMessages = getNumber (configFile >> "CfgSettings" >> "RCON" >> "useRestartMessages"); 
if(_useRestartMessages isEqualTo 1)then 
{ 
ServerRestartMessages = getArray(configFile >> "CfgSettings" >> "RCON" >> "restartWarningTime"); 
} 
else 
{ 
ServerRestartMessages = false; 
}; 
 
[] spawn 
{ 
while {true} do 
{ 
sleep 30; 
[ServerRestartTime,ServerRestartMessages,ServerUseAutokick,ServerKickTime,ServerLockTime] call RCON_fnc_rcon_thread_check; 
}; 
};