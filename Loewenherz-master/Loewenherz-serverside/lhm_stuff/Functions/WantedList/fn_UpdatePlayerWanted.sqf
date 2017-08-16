Private["_query","_sql","_name","_uid","_crims","_bounty"]; 
if ((count _this) < 4) exitWith { 
 diag_log format["DEBUG: lhm_fnc_UpdatePlayerWanted: Need more Parameters: [_name,_uid,_crims,_bounty]"]; 
}; 
_name = _this select 0; 
_uid = _this select 1; 
_crims = _this select 2; 
_bounty = _this select 3; 
 
_query = format["REPLACE INTO lhm_wantedlist (pname,puid,crims,bounty) VALUES ('%1','%2','%3',%4)",_name,_uid,_crims,_bounty]; 
 
 
[_query,1] call DB_fnc_asyncCall;