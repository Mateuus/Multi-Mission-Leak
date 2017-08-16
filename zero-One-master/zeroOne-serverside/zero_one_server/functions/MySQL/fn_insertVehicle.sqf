/* 
 File: fn_insertVehicle.sqf 
*/ 
private["_uid","_side","_type","_className","_color","_plate","_query","_film","_insurance"]; 
_uid = param[0,"",[""]]; 
_side = param[1,"",[""]]; 
_type = param[2,"",[""]]; 
_className = param[3,"",[""]]; 
_color = param[4,"",[""]]; 
_plate = param[5,-1,[0]]; 
_film = param[6,"",[""]]; 
_insurance = param[7,false,[false]]; 
 
if(_uid isEqualTo "" || _side isEqualTo "" || _type isEqualTo "" || _className isEqualTo "" || _color isEqualTo "" || _plate isEqualTo -1) exitWith {}; 
 
_query = format["insertVehicle:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",_side,_className,_type,_uid,1,1,([_insurance,0] call zero_fnc_bool),_color,_plate,_film]; 
[_query,1] call zero_fnc_asyncCall; 
