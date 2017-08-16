Private["_query","_sql","_uid"]; 
if ((count _this) < 1) exitWith { 
 diag_log format["DEBUG: lhm_fnc_DeletePlayerWanted: Need more Parameters: [_uid]"]; 
}; 
_uid = _this select 0; 
_query = format["DELETE FROM lhm_wantedlist WHERE lhm_wantedlist.puid = '%1'",_uid]; 
 
 
[_query,1] call DB_fnc_asyncCall;