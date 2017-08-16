 
 
 
_player = _this select 0; 
_shopcontent = _this select 1; 
 
_uid = getPlayerUID _player; 
 
_player setVariable ["shopcontent",_shopcontent,false]; 
_updatestr = format ["updateShop:%1:%2", _shopcontent, getPlayerUID _player]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
sleep 10; 
 
_pia = activeshopcrates find _uid; 
activeshopcrates deleteAt _pia; 
 
 
diag_log ["store upd %1", _player]; 
 
