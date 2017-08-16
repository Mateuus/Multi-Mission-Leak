 
 
params["_target"]; 
 
if(count currentsecurity > 0) then { 
 
_player = currentsecurity call BIS_fnc_selectRandom; 
 
[getpos _target] remoteexec ["client_fnc_startsecurity", _player]; 
 
} else { 
 
[getpos _target] remoteexec ["client_fnc_jobMarker", currentCop]; 
 
}; 
 
diag_log ["robbery call %1", _target]; 
 
