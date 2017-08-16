 
 
 
 
 
 
 
private["_price","_uid","_ind","_entry"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_price = [_this,1,0,[0]] call BIS_fnc_param; 
if(_uid == "" OR _price == 0) exitWith {}; 
 
[_uid] spawn life_fnc_wantedPardon;