 
 
 
 
_location = _this select 0; 
_sender = _this select 1; 
_jobType = _this select 2; 
_message = _this select 3; 
 
diag_log ["job action %1", _sender]; 
 
_units = []; 
 
if (_jobType == "Fedex Worker") exitwith { 
if(currentmailmen isequalto []) exitwith { [] remoteExec ["client_fnc_completemail",_sender]; }; 
_units = currentmailmen; 
_selection = _units call BIS_fnc_selectRandom; 
[_location,_sender,_jobType,_message] remoteExec ["client_fnc_mailSystem",_selection]; 
}; 
 
if (_jobType == "News Reporter") exitwith {  
if(currentNewsMan isequalto []) exitwith { }; 
_units = currentNewsMan; 
_selection = _units call BIS_fnc_selectRandom; 
[_location,_jobType] remoteExec ["client_fnc_startNews",_selection]; 
}; 
