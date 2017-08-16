 
 
 
 
 
 
_uidplayer = _this select 0; 
 
diag_log ["mayor update %1", _uidplayer]; 
 
 
_updatestr = format ["updateMayor:%1:%2", _uidplayer,1]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
