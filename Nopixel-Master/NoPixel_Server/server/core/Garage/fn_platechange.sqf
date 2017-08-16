 
 
_vehicle = _this select 0; 
_vehicle = call compile format["%1", _vehicle];  
_plate = _this select 1; 
_player = _this select 2; 
_oldPlate = _vehicle select 0; 
 
_checkstr = format ["existLicense:%1", _plate]; 
_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery; 
_booli = (_check select 0) select 0; 
 
diag_log ["license change - %1 - %2", _player, plate]; 
 
 
if(_booli) then { 
 
"That plate already exists" remoteexec ["hint",_player]; 
} else { 
 
_checkstr = format ["updateLicense:%1:%2", _plate, _oldPlate]; 
_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery; 
 
_garage = _player getVariable "garage"; 
_pia = _garage find _vehicle; 
_garage deleteAt _pia; 
 
_vehicle SET [0,_plate]; 
_garage pushback _vehicle; 
 
_player setVariable ["garage", _garage, false]; 
 
[_garage] remoteexec ["client_fnc_finishLicense",_player]; 
}; 
