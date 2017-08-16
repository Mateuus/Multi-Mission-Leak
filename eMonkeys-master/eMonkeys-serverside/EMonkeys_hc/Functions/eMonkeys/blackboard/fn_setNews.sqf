private["_message","_time","_query"]; 
_message = _this select 0; 
 
_query = format["INSERT INTO blackboard (message) VALUES('""%1""')",_message]; 
[_query,1] call DB_fnc_asyncCall;