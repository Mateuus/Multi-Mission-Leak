 
 
 
 
 
 
 
 
private["_id","_gang","_inviteRank","_kickRank"]; 
_id = [_this,0,"0",["0"]] call BIS_fnc_param; 
_inviteRank = [_this,1,2,[2]] call BIS_fnc_param; 
_kickRank = [_this,2,2,[2]] call BIS_fnc_param; 
 
_gang = []; 
_index = -1; 
{ if (_id == (_x select 0)) then { _gang = _x; _index = _forEachIndex; }; } foreach life_server_gangs; 
if (count _gang < 1 || _index < 0) exitWith {}; 
life_server_gangs set [_index, [(_gang select 0),(_gang select 1),(_gang select 2),_inviteRank,_kickRank,(_gang select 5),(_gang select 6)]]; 
[_id, _inviteRank, _kickRank] spawn DB_fnc_updateGang;