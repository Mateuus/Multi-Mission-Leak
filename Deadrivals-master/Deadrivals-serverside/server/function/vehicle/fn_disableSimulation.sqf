private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_bool = [_this,2,false,[true]] call BIS_fnc_param; 
 
_vehicle allowDamage _bool; 
 
 
