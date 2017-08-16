 
_caller = _this select 0; 
_realdate = call compile ("real_date" callExtension ""); 
 
 
 
[_realdate] remoteExecCall ["SOCK_fnc_getrealdate",_caller];