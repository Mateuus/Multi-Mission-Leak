private["_uid","_query"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
if(_uid == "") exitWith {};  
_array = []; 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE wanted_tanoa SET wantedCrimes = '%1' WHERE wantedID = '%2'",_array,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format ["UPDATE wanted_altis SET wantedCrimes = '%1' WHERE wantedID = '%2'",_array,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
};