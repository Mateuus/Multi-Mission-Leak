 
 
 
_fetchstr = "rallyracetimes"; 
_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync; 
_returned = str _fetch; 
rallyracetimes = _fetch; 
 
publicvariable "rallyracetimes"; 
 
diag_log "rally time update?"; 
