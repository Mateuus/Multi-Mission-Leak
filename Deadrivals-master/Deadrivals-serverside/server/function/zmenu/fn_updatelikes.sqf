private["_id","_query","_queryResult"]; 
_id = [_this,0,0,[0]] call BIS_fnc_param; 
_likes = [_this,1,[],[[]]] call BIS_fnc_param; 
 
_query = format ["UPDATE news SET likes = '%1' WHERE id = '%2'",_likes,_id]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall;