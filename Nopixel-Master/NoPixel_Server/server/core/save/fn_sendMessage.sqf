_receiver = _this select 0; 
_message = _this select 1; 
_player = _this select 2; 
_player = name _player; 
_title = format ["SMS from %1",_player]; 
_receiver = getplayeruid _receiver; 
 
 
_updatestr = format ["insertMessage:%1:%2:%3:%4", _message, _title, _player, _receiver]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
diag_log ["inserting sms %1", _player]; 
 
