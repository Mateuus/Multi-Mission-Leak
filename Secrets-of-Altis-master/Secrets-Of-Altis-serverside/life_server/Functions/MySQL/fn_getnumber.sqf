 
 
 
 
 
 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_query = format["SELECT phone, phonekontakte FROM players WHERE playerid='%1'",_uid]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
_new = [(_queryResult select 1)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[1,_new]; 
 
_queryResult remoteExecCall ["SOCK_fnc_getnumber",_player];