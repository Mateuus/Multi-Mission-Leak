 
 
params["_player"]; 
 
diag_log ["paintball %1", _player]; 
 
 
if(isNil "paintball") then { paintball = []; }; 
if !(paintball isEqualTo []) exitwith { _player setvariable ["sync",0,false]; paintball pushback _player; [1] remoteexec ["client_fnc_paintball",_player]; }; 
 
paintball pushback _player;  
 
"A paintball match is starting!" remoteexec ["hint",-2]; 
[1] remoteexec ["client_fnc_paintball",_player]; 
uisleep 360; 
[3] remoteexec ["client_fnc_paintball",paintball]; 
 
paintball = []; 
 
