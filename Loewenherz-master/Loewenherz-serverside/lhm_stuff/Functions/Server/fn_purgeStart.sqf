Private ["_purgetimer","_purgehour","_purgeminute","_purgesecound"]; 
LHM_VAR_PRUGE_START = true; 
publicVariable "LHM_VAR_PRUGE_START"; 
 
_purgetimer = _this select 0; 
_purgehour = floor(_purgetimer/3600); 
_purgeminute = floor((_purgetimer-(_purgehour*3600))/60);; 
_purgesecound = floor((_purgetimer-(((_purgehour*60)+_purgeminute)*60))); 
 
[] spawn { 
 sleep 1; 
 [{PlaySound "purge_announce"},"BIS_fnc_spawn",nil,false] call lhm_fnc_mp; 
}; 
 
while {_purgetimer > 0} do { 
 sleep 1; 
 _purgetimer = _purgetimer - 1; 
 _purgehour = floor(_purgetimer/3600); 
 _purgeminute = floor((_purgetimer-(_purgehour*3600))/60);; 
 _purgesecound = floor((_purgetimer-(((_purgehour*60)+_purgeminute)*60))); 
 LHM_VAR_PRUGE_TIMER = [_purgehour, _purgeminute, _purgesecound]; 
 publicVariable "LHM_VAR_PRUGE_TIMER"; 
}; 
 
LHM_VAR_PRUGE_START = false; 
publicVariable "LHM_VAR_PRUGE_START"; 
 
