 /* 
 File: fn_updateeconomy.sqf 
 Author: Olli aka Hauklotz 
  
 Description: 
 Aktualisiert den "verkauft"-Wert in MYSQL 
*/ 
private["_type","_amount","_query","_tickTime","_queryResult","_newamount"]; 
 
_item = [_this,0,""] call BIS_fnc_param; 
_amount = [_this,1,[]] call BIS_fnc_param; 
 
 
 
 
_query = format["UPDATE economy SET verkauft=verkauft+'%1' WHERE item='""%2""' AND active='1'",_amount,_item]; 
 
_queryResult = [_query,1] call DB_fnc_asyncCall; 
 
diag_log format ["%1::::::%2",_queryResult,_query];