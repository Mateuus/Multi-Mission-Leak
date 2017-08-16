 
 
 
 
 
 
 
private["_price","_uid","_ind","_entry"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_price = [_this,1,0,[0]] call BIS_fnc_param; 
if(_uid == "" OR _price == 0) exitWith {}; 
 
_ind = [_uid,life_wanted_list] call SOA_fnc_index; 
if(_ind == -1) exitWith {}; 
life_wanted_list set[_ind,-1]; 
life_wanted_list = life_wanted_list - [-1];