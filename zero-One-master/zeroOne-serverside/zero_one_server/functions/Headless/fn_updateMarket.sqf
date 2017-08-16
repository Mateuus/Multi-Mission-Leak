/* 
    File: fn_updateMarket 
    Author: Dirk Pitt 
    Zero-One Altis Life 
*/ 
private ["_mode","_info"]; 
_mode = param[0,0,[0]]; 
_info = param[1,[],["",[]]]; 
if(_mode isEqualTo 0) then { 
    zero_market_event = _info; 
    publicVariable "zero_market_event"; 
    zero_market_event = nil; 
    [[0,1],format["Marktevent: %1",_info]] remoteExecCall ["zero_fnc_cpbpJzzAd",(allPlayers - entities "HeadlessClient_F")]; 
}else{ 
    NVrTmQ = _info; 
    publicVariable "NVrTmQ"; 
    NVrTmQ = nil; 
 [0,"Markt: Die Marktpreise wurden aktualisiert!"] remoteExecCall ["zero_fnc_cpbpJzzAd",(allPlayers - entities "HeadlessClient_F")]; 
}; 
