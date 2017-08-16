 
 
 
private ["_racetime","_position","_winner","_checkpos","_nameplayer"]; 
params["_racetime","_nameplayer"]; 
 
_position = 0; 
 
_winner = false; 
 
while {true} do { 
diag_log "updating race"; 
sleep 0.2; 
 
_checkPos = racetimes select _position; 
 
_checkPos = call compile format ["%1",(_checkpos select 1)];  
 
if(_racetime < _checkPos) exitwith { _winner = true; }; 
_position = _position + 1; 
 
}; 
 
if (_winner) then { 
 
_position = _position + 1; 
 
if(_position == 1) then { 
_new2 = racetimes select 1; 
_updatestr = format ["updateRaceTime:%1:%2:%3",(_new2 select 1),(_new2 select 2),2]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
}; 
 
if(_position IN [1,2]) then { 
_new3 = racetimes select 2; 
_updatestr = format ["updateRaceTime:%1:%2:%3",(_new3 select 1),(_new3 select 2),3]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
}; 
 
_updatestr = format ["updateRaceTime:%1:%2:%3",_racetime,_nameplayer,_position]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
format["%1 just got a top 3 lap of %2 at the F1 track",_nameplayer,_racetime] remoteexec ["hint",-2]; 
 
[] spawn server_fnc_racetimes; 
}; 
