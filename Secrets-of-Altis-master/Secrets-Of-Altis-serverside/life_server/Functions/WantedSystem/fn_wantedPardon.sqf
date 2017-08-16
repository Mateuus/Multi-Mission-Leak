 
 
 
 
 
 
 
private["_uid"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
if(_uid == "") exitWith {}; 
 
_index = [_uid,life_wanted_list] call SOA_fnc_index; 
 
if(_index != -1) then 
{ 
life_wanted_list set[_index,-1]; 
life_wanted_list = life_wanted_list - [-1]; 
};