 
_plate = _this select 0; 
_officer = _this select 1; 
 
_checkstr = format ["existLicense:%1", _plate]; 
_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery; 
_booli = (_check select 0) select 0; 
 
 
diag_log ["license check police: %1 %2", _officer, _plate]; 
 
if(_booli) then { 
 
_fetchstr = format ["getLicense:%1", _plate]; 
_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync; 
diag_log format["%1",str(_fetch)]; 
 
_fetch = call compile format["%1",(_fetch select 0)]; 
 
_owner = (_fetch select 3); 
 
{ if(getplayeruid _x == _owner) then { _owner = name _x; }; } foreach playableunits; 
 
format["License: %1 - Make: %2 - Color: %3 - Owner: %4",(_fetch select 0),(_fetch select 1),(_fetch select 2),_owner] remoteexec ["hint",_officer]; 
} else { 
"This plate returned no results in the DMV database." remoteexec ["hint",_officer]; 
}; 
