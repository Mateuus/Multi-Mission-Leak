 
 
_length = _this select 0; 
_reason = _this select 1; 
_player = _this select 2; 
_sendToJail = _this select 3; 
 
_uidplayer = getplayeruid _player; 
 
_updatestr = format ["updatePrison:%1:%2", _length, _uidplayer]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
_updatestr = format ["updatePrisonReason:%1:%2", _reason, _uidplayer]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;  
 
 
if(_sendtoJail) then { 
[_length, _reason] remoteExec ["client_fnc_jailsetup",_player]; 
}; 
