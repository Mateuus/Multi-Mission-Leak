private["_pid","_side","_type","_unit","_dienst","_queryResult"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_unit = owner _unit; 
 
_queryResult = format["SELECT logname, logtext FROM supportlog WHERE playerid = '%1' AND active = '1'",_uid]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_SUPPORTTOOL_LOG_REQUEST = _queryResult; 
_unit publicVariableClient "NOCRIS_SUPPORTTOOL_LOG_REQUEST";