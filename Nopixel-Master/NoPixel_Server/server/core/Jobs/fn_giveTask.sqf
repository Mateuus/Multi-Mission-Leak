 
 
 
 
 
_position = _this select 0; 
_type = _this select 1; 
_input = _this select 2; 
 
diag_log ["give task %1", _type]; 
 
if(_type == "News") exitwith { 
_players = []; 
_player = currentNewsMan call BIS_fnc_selectRandom; 
_players pushback _player; 
_player2 = currentNewsMan call BIS_fnc_selectRandom; 
if(_player2 != _player) then { _players pushback _player2; }; 
[_position,_input] remoteExec ["client_fnc_startNews",_players]; 
}; 
 
if(_type == "Tow") exitwith { 
_player = currentTowTruckDrivers call BIS_fnc_selectRandom; 
[_position,_input] remoteExec ["client_fnc_startTowTruck",_player]; 
}; 
