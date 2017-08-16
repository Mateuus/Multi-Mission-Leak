 
 
 
 
 
 
 
 
 
 
private["_uid","_ret"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
if(_uid == "") exitWith {false};  
_ret = false; 
{ 
if(getPlayerUID _x == _uid) exitWith {_ret = true;}; 
} foreach allPlayers; 
 
_ret;