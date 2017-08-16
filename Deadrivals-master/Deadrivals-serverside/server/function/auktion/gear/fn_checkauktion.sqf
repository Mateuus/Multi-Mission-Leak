private["_mode","_query","_aktuellepartei","_queryResult"]; 
 
_query = format["DELETE FROM auctionhouse WHERE candelete = '%1'", 1]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_queryResult = format["SELECT id FROM auctionhouse WHERE aktiv = '%1'",1]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _queryResult == 0) exitWith {}; 
 
{ 
_id = _x select 0; 
 
_query = format["UPDATE auctionhouse SET howlong = howlong - '1' WHERE id = '%1'", _id]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} foreach _queryResult; 
 
 
_queryResult = format["SELECT id, howlong FROM auctionhouse WHERE aktiv = '%1'",1]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _queryResult == 0) exitWith {}; 
 
{ 
_id = _x select 0; 
_howlong = _x select 1; 
 
if (_howlong <= 0) then { 
_query = format["UPDATE auctionhouse SET abholbar = '1', status = '0', aktiv = '0' WHERE id = '%1'", _id]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
} foreach _queryResult; 
 
 
 
 
