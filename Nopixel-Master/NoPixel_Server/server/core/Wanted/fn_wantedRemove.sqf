_caseID = _this select 0; 
_caseID = _caseID select 0; 
_status = _this select 1; 
 
if (_status == 0) then { 
 
_updatestr = format ["updateCrime:%1:%2:%3", _status, 0, _caseID]; 
_del = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
} else { 
 
_updatestr = format ["updateCrime:%1:%2:%3", _status, 1, _caseID]; 
_del = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
}; 
 
lastwanted = time;  
_type = 1; 
_fetchstr = format ["getCrimeType:%1", _type]; 
_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync; 
_returned = str _fetch; 
 
 
latestWanted = _fetch; 
