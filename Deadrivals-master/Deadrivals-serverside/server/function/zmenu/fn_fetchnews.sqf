private["_ownerID","_queryResult"]; 
_ownerID = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_ownerID = owner _ownerID; 
 
_queryResult = format["SELECT id, artikelname, news, likes FROM news WHERE aktiv = '%1'",1]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_ZMENU_NEWS = _queryResult; 
_ownerID publicVariableClient "NOCRIS_ZMENU_NEWS"; 
 
 
