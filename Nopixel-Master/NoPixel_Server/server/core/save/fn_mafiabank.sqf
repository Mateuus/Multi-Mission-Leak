 
 
_fetchstr = format ["mafiaBank:%1", 1]; 
_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync; 
mafiabank = call compile format ["%1",_fetch select 0 select 0]; 
publicvariable "mafiaBank"; 
 
 
diag_log "mafia bank"; 
 
