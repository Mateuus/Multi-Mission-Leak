private["_mode","_query","_aktuellepartei","_queryResult"]; 
_mode = [_this,0,-1,[0]] call BIS_fnc_param; 
_ownerID = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_ownerID = owner _ownerID; 
 
switch(_mode) do { 
case 1: { 
_queryResult = format["SELECT id, item, verkauferuid, verkaufername, preis, howlong FROM auctionhouse WHERE aktiv = '1' AND status= '%1'",1]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
}; 
case 2: { 
_uid = [_this,2,"",[""]] call BIS_fnc_param; 
_queryResult = format["SELECT id, item, verkauferuid, kaufername, preis, status FROM auctionhouse WHERE abholbar = '1' AND verkauferuid = '%1'",_uid]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
NOCRIS_AUKTIONSLISTE = _queryResult; 
_ownerID publicVariableClient "NOCRIS_AUKTIONSLISTE"; 
 
