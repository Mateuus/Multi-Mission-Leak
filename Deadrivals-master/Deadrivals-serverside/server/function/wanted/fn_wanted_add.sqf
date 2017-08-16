private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_type = [_this,1,"",[""]] call BIS_fnc_param; 
if(_uid == "" OR _type == "") exitWith {}; 
if (worldName == "Tanoa") then { 
_queryResult = format["SELECT wantedID, wantedCrimes FROM wanted_tanoa WHERE wantedID = '%1'",_uid]; 
_queryResult = [_queryResult,2] call SERVERDATABASE_fnc_asyncCall; 
_pastCrimes = _queryResult select 1; 
_pastCrimes pushBack _type; 
_query = format ["UPDATE wanted_tanoa SET wantedCrimes = '%1' WHERE wantedID = '%2'",_pastCrimes,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_queryResult = format["SELECT wantedID, wantedCrimes FROM wanted_altis WHERE wantedID = '%1'",_uid]; 
_queryResult = [_queryResult,2] call SERVERDATABASE_fnc_asyncCall; 
_pastCrimes = _queryResult select 1; 
_pastCrimes pushBack _type; 
_query = format ["UPDATE wanted_altis SET wantedCrimes = '%1' WHERE wantedID = '%2'",_pastCrimes,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
