If (isServer) then { 
 
private ["_msg","_from","_player","_time"]; 
_msg = _this select 0; 
_player = _this select 1; 
_from = name _player; 
// Error Checks 
if((_from == "") or (_msg == "")) exitWith {}; 
 
if (isNil "lhNews_MessageOn") then { 
 lhNews_MessageOn = false; 
 publicVariable "lhNews_MessageOn"; 
}; 
 
// return a message if terminal was used too quickly and exit 
//if (lhNews_MessageOn) exitWith {["Du kannst aktuell keine Nachricht verschicken!
Der Satelitt ist außer Reichweite...!","hint",_player,false] call lhm_fnc_mp;}; 
 
// Disalbe terminal 
lhNews_MessageOn = true; 
publicVariable "lhNews_MessageOn"; 
// Reactivate it after some minutes 
[] spawn { 
 sleep 300; 
 lhNews_MessageOn = false; 
 publicVariable "lhNews_MessageOn"; 
}; 
 
// send the message to all machines 
[[_msg,_from],"lhm_fnc_lhNews_receive",true,false] call lhm_fnc_mp; 
 
diag_log format ["Broadcast Channel7 News from %1 | Content: %2",_from,_msg]; 
 
}; 
