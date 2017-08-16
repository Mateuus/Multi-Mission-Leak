private["_ret","_list","_result","_queryResult","_units","_inStatement"]; 
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
if(isNull _ret) exitWith {}; 
_ret = owner _ret; 
if (worldName == "Tanoa") then { 
_queryResult = format["SELECT wantedCrimes FROM wanted_tanoa WHERE wantedID = '%1'",_uid]; 
_queryResult = [_queryResult,2] call SERVERDATABASE_fnc_asyncCall; 
_queryResult remoteExecCall ["CLIENT_fnc_wanted_recieveInformation",_ret]; 
} else { 
_queryResult = format["SELECT wantedCrimes FROM wanted_altis WHERE wantedID = '%1'",_uid]; 
_queryResult = [_queryResult,2] call SERVERDATABASE_fnc_asyncCall; 
_queryResult remoteExecCall ["CLIENT_fnc_wanted_recieveInformation",_ret]; 
};