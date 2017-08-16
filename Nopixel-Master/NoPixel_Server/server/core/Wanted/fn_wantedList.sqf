 
 
_player = _this select 0; 
_type = _this select 1; 
 
_fetchstr = format ["getCrimeType:%1", _type]; 
_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync; 
_returned = str _fetch; 
latestWanted = _fetch; 
 
[latestwanted] remoteExec ["client_fnc_wantedproduce",_player]; 
 
