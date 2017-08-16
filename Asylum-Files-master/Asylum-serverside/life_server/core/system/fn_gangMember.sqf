 
 
 
 
 
 
 
 
private["_uid","_gang","_rank"]; 
 
_uid = [_this,0,"0",["0"]] call BIS_fnc_param; 
_gang = [_this,1,"0",["0"]] call BIS_fnc_param; 
_rank = [_this,2,3,[3]] call BIS_fnc_param; 
 
if (_rank < 0) exitWith {}; 
 
[_uid,_gang,_rank] call DB_fnc_gangMember;