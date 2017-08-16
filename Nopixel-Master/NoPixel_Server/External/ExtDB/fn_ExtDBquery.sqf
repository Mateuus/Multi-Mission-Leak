 
private ["_querstr", "_quer", "_array"]; 
params ["_mode", "_query"]; 
 
_querstr = format ["%1:%2:%3", _mode, (call extDB_SQL_CUSTOM_ID), _query]; 
diag_log "ExtDB QUERY:"; 
diag_log _querstr; 
_quer = "extdb2" callExtension _querstr; 
_array = call compile _quer; 
_return = _array select 1; 
_count = 0; 
if (_mode == 2) then { 
_uniqID = call compile _return; 
 
_return = ""; 
_bool = true; 
while {_bool} do { 
if(_count > 60) exitwith {}; 
_count = _count + 1; 
_returnstr = format["5:%1", _uniqID]; 
_returni = "extdb2" callExtension _returnstr; 
if (_returni isEqualTo "") exitWith {_bool = false}; 
_return = _return + _returni; 
}; 
}; 
if(_count > 60) exitwith { diag_log "DB Error - 10 loops"; }; 
 
if ((_array select 0) == 0) exitWith 
{ 
diag_log format ["extdb2 Error: %1", _quer]; 
}; 
 
_return; 
