 
 
 
 
 
_uid = param[0]; 
_amount = param[1]; 
 
_query = format["SELECT mailbox FROM players_global WHERE playerid='%1'",_uid]; 
_box = ([_query,2] call DB_fnc_asyncQuery) select 0; 
_box pushBack ["cash",_amount,floor(random 10000)]; 
_query = format["UPDATE players_global SET mailbox='%1' WHERE playerid='%2'",_box,_uid]; 
[_query,1] call DB_fnc_asyncQuery;