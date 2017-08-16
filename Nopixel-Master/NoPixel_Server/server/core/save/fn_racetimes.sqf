 
_fetchstr = "racetimes"; 
_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync; 
_returned = str _fetch; 
racetimes = _fetch; 
 
publicvariable "racetimes"; 
 
diag_log "race times update?"; 
 
