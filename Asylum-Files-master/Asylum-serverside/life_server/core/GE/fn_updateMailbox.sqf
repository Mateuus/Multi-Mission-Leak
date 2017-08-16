 
 
 
 
 
_box = param [0,[],[[]]]; 
_uid = param [1,"",[""]]; 
_query = format["UPDATE players_global SET mailbox='%1' WHERE playerid='%2'",_box,_uid]; 
[_query,1] call DB_fnc_asyncQuery;