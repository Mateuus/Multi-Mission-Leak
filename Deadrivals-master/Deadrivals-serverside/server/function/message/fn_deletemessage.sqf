_query = "UPDATE messagesystem SET message = '""""'"; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_ATAC_MESSAGE = ""; 
publicVariable "NOCRIS_ATAC_MESSAGE";