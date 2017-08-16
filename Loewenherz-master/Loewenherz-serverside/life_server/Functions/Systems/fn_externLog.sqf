 
/* 
    Author: Blackd0g 
    File: fn_externLog.sqf 
 
    Description: 
    Logs to the extDB custom log 
 
    Example: 
_log = format ["%1 with UID %2 has changed something",name player,getPlayerUID player]; 
 
[["admin",_log],"TON_fnc_externLog",false,false] call lhm_fnc_mp; 
*/ 
private ["_log","_logFile"]; 
_logFile = param [0,"",[""]]; 
_log = param [1,"",[""]]; 
 
switch(_logFile) do { 
 case "general": {"extDB2" callExtension format["1:GENERAL:%1",_log]}; 
 case "error": {"extDB2" callExtension format["1:ERROR:%1",_log]}; 
 case "money": {"extDB2" callExtension format["1:MONEY:%1",_log]}; 
 case "kills": {"extDB2" callExtension format["1:KILLS:%1",_log]}; 
 case "messages": {"extDB2" callExtension format["1:MESSAGES:%1",_log]}; 
 case "vehicle": {"extDB2" callExtension format["1:VEHICLE:%1",_log]}; 
    case "spy": {"extDB2" callExtension format["1:SPY:%1",_log]}; 
    case "admin": {"extDB2" callExtension format["1:ADMIN:%1",_log]}; 
};