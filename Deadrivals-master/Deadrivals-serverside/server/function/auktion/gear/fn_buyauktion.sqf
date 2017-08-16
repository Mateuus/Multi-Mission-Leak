private["_mode","_query","_aktuellepartei","_queryResult"]; 
_id = [_this,0,0,[0]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_name = [_this,2,"",[""]] call BIS_fnc_param; 
_ownerID = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param; 
_ownerID = owner _ownerID; 
 
_query = format["UPDATE auctionhouse SET abholbar = '1', aktiv = '0', status = '10', kauferuid = '%1', kaufername = '%2' WHERE id = '%3'", _uid,_name,_id] call SERVERDATABASE_fnc_fireAndForget; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_auctions_inserate = "ready"; 
_ownerID publicVariableClient "NOCRIS_auctions_inserate"; 
