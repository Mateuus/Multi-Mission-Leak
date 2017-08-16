/* 
    file: fn_loadBounties.sqf 
 Author: Kevin Webb 
 Description: Adds the player to the wanted list when they join the server if they were wanted. 
*/ 
private["_uid"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_queryResult = []; 
_query = format["SELECT bounties FROM players WHERE playerid = '%1'",_uid];  
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
_queryResult = _queryResult select 0; 
if(count _queryResult == 0) exitWith {}; 
if(isNil "_queryResult") exitWith {}; //Don't add them to the wanted list if they're not wanted 
if(_queryResult in EMonkeys_wanted_list) exitWith {}; //Don't re-add them to the wanted list if they are already on it. 
 
EMonkeys_wanted_list pushBack _queryResult;