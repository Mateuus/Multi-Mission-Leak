 
 
 
 
params ["_location"]; 
 
 
diag_log ["starting fire %1", _location]; 
 
if(count currentEMS > 2) then { 
[_location] remoteexec ["client_fnc_fireStart",-2]; 
}; 
