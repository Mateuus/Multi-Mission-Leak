private["_ret","_list","_result","_queryResult","_units","_inStatement"]; 
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
if(isNull _ret) exitWith {}; 
_ret = owner _ret; 
if (worldName == "Tanoa") then { 
_queryResult = "SELECT wantedID,wantedCrimes FROM wanted_tanoa"; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
NOCRIS_WANTED_LISTE = _queryResult; 
_ret publicVariableClient "NOCRIS_WANTED_LISTE"; 
} else { 
_queryResult = "SELECT wantedID,wantedCrimes FROM wanted_altis"; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
NOCRIS_WANTED_LISTE = _queryResult; 
_ret publicVariableClient "NOCRIS_WANTED_LISTE"; 
};