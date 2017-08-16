_player = _this select 0; 
 
diag_log ["request jobs %1", _player]; 
 
[activeJobs] remoteExec ["client_fnc_startJob",_player]; 
