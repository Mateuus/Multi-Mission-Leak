If (isServer) then { 
 
}; 
 
if (!isDedicated) then { 
 If (isPlayer (_this)) then { 
  diag_log "::lhm Client:: Running Player PaintBall Client initialization..."; 
  (_this) spawn lhm_fnc_ClientPaintBallInit; 
 
  waitUntil {!isNil "lhm_session_completed"}; 
  waitUntil {lhm_session_completed}; 
  //_this addMPEventHandler ["MPKilled", {_this call lhm_fnc_whoDunnit}]; 
 }; 
};