//diag_log format["DEBUG: Run Buff for Client: _this = %1",_this]; 
//[medic_1,"BUFF"] 
Private["_target","_buff"]; 
_target = _this select 0; 
_buff = _this select 1; 
[[_target,3600],_buff,(owner _target),FALSE] call lhm_fnc_mp;