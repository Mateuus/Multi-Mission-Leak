/* 
 File: fn_marketInsert.sqf 
 Author: Jannis "Cr41s3" 
        Edited by: Lukas "Alduin86" 
 
 Description: 
 Inserts the new market prices into the database 
*/ 
 
private["_shortname","_price","_query"]; 
 
_shortname = (_this select 0); 
_price = (_this select 1); 
 
_query = format["UPDATE lhm_resources SET price='%1' WHERE resource='%2'",_price,_shortname]; 
 
[_query,1] call DB_fnc_asyncCall;