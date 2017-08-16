private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"]; 
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_percent = [_this,2,0,[0]] call BIS_fnc_param; 
if (worldName == "Tanoa") then { 
_queryResult = format["SELECT wantedID, wantedCrimes FROM wanted_tanoa WHERE wantedID = '%1'",_uid]; 
_queryResult = [_queryResult,2] call SERVERDATABASE_fnc_asyncCall; 
[_queryResult,_percent] remoteExecCall ["CLIENT_fnc_wanted_querybounty",(owner _cop)];  
} else { 
_queryResult = format["SELECT wantedID, wantedCrimes FROM wanted_altis WHERE wantedID = '%1'",_uid]; 
_queryResult = [_queryResult,2] call SERVERDATABASE_fnc_asyncCall; 
[_queryResult,_percent] remoteExecCall ["CLIENT_fnc_wanted_querybounty",(owner _cop)]; 
}; 
 
