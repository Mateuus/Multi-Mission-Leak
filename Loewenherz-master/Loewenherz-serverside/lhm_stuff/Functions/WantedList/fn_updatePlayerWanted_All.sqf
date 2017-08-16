Private["_query","_sql","_name","_uid","_crims","_bounty"]; 
{ 
 _name = _x select 0; 
 _uid = _x select 1; 
 _crims = _x select 2; 
 _bounty = _x select 3; 
 
 _query = format["REPLACE INTO lhm_wantedlist (pname,puid,crims,bounty) VALUES ('%1','%2','%3',%4)",_name,_uid,_crims,_bounty]; 
 
  
 [_query,1] call DB_fnc_asyncCall; 
} foreach lhm_wanted_list;