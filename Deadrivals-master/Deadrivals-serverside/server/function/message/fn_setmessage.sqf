_nachricht = [_this,0,"",[""]] call BIS_fnc_param; 
 
_query = format ["UPDATE messagesystem SET message = '%1'",_nachricht]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_ATAC_MESSAGE = _nachricht; 
publicVariable "NOCRIS_ATAC_MESSAGE";