 
 
diag_log "setup mayor"; 
 
_fuck = 1; 
_fetchstr = format ["getMayor:%1", _fuck]; 
_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync; 
 
currentMayor =  str((_fetch select 0) select 0); 
