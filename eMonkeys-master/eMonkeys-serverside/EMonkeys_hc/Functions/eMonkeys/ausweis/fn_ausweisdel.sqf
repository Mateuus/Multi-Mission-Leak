 
/* 
 Author: Christian "Cifon" Runggas 
 E-mail: me@cifon.de 
*/ 
 
private["_uid","_query","_queryResult","_player","_name","_daten"]; 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_name = [_this,2,"",[""]] call BIS_fnc_param; 
 
if(isNull _player) exitWith {}; 
 
 
_query = format["UPDATE ausweis SET Playerid='0' WHERE Playerid='%1' AND Spieler_name='%2'",_uid,_name]; 
 
_queryResult = [_query,1] call DB_fnc_asyncCall; 
 
[3,"EMonkeys_fnc_ausweisstatus",_player,false] call EMonkeys_fnc_MP;