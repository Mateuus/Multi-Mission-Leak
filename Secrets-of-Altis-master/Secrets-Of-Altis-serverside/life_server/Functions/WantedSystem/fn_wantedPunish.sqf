 
 
 
 
 
 
 
private["_uid","_index"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
if(_uid == "") exitWith {}; 
 
_index = [_uid,life_wanted_list] call SOA_fnc_index; 
if(_index == -1) exitWith {}; 
[0] remoteExecCall ["life_fnc_removeLicenses",_uid];