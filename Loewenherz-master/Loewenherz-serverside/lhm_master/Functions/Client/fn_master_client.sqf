//Tonic start 
if ((_this select 0) isKindOf "C_man_1") then { 
 (_this select 0) execVM "\life_server\fix_headgear.sqf"; 
}; 
 
 
//diag_log format["DEBUG: Running Master Client Init: _this = %1 | isPlayer = %2 | Owner: %3 | %1 in playableunits: %4)",_this,(isPlayer (_this select 0)),(owner (_this select 0)),((_this select 0) in playableunits)]; 
 
(_this select 0) spawn { 
 _looptimeout = 0; 
 waitUntil { 
  sleep 1; 
  _looptimeout = _looptimeout + 1; 
  (((isPlayer (_this)) && (!isNil "LHM_VAR_MASTER_SERVER_INIT_READY") && (!isNil "LHM_VAR_MASTER_CLIENT_FUNCTIONS")) || (_looptimeout > 60)) 
 }; 
 If (isPlayer (_this)) then { 
  //diag_log format["DEBUG: Running Player Master Init: _this = %1",_this]; 
  [[LHM_VAR_MASTER_CLIENT_FUNCTIONS,_this],"lhm_fnc_callFunctions",(owner (_this)),FALSE] call lhm_fnc_mp; 
  [LHM_VAR_MASTER_CLIENT_FUNCTIONS,_this] call lhm_fnc_callFunctions; 
 }; 
};