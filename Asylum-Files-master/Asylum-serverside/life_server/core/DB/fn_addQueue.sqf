 
 
 
 
 
 
 
private["_data"]; 
_data = [_this,0,[],[[]]] call BIS_fnc_param; 
if(count _data == 0) exitWith {};  
 
life_DB_queue set[count life_DB_queue,_data];