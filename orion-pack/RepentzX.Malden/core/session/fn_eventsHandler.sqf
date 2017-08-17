if(!isServer) exitWith {}; 
 
"triggerEvent" addPublicVariableEventHandler { 
 _element = _this select 1; // incoming array 
 _event = _element select 0; // Event String 
 _player = _element select 1; // Player Obj 
 
 [_element] execVM format ["\core\Events\events\%1.sqf",_event]; 
 diag_log format ["Server: TriggerEvent '%1' ",_event]; 
}; 
 
diag_log "Server: Eventhandlers initialized!";