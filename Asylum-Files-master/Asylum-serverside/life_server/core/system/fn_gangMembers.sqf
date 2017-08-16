 
 
 
 
 
 
 
private["_ret"]; 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_id = [_this,1,"0",["0"]] call BIS_fnc_param; 
 
_ret = [_id] call DB_fnc_queryGangMembers; 
 
[_ret,"life_fnc_gangMembersReceive",_unit,false] spawn life_fnc_MP;