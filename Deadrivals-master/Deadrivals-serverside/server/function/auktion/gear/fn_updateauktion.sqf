private["_mode","_query","_aktuellepartei","_queryResult"]; 
_mode = [_this,0,-1,[0]] call BIS_fnc_param; 
_id = [_this,1,0,[0]] call BIS_fnc_param; 
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
_ownerID = owner _ownerID; 
 
switch(_mode) do { 
case 1: { 
_query = format["UPDATE auctionhouse SET abholbar = '0', status = '1', candelete = '1' WHERE id = '%1'", _id]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
NOCRIS_auctions_inserate = "ready"; 
_ownerID publicVariableClient "NOCRIS_auctions_inserate";