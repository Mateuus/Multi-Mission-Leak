/* 
 Author: Christian "Cifon" Runggas 
 E-mail: me@cifon.de 
*/ 
 
private["_uid","_player","_name","_query","_queryResult"]; 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = _this select 1; 
_name = _this select 2; 
 
if(isNull _player) exitWith {}; 
 
 
 
_query = format["SELECT * FROM ausweis WHERE Playerid='%1' AND Spieler_name='%2'",_uid,_name];  
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
 
if(isNil "_queryResult") exitWith { 
[2,"EMonkeys_fnc_ausweisstatus",_player,false] call EMonkeys_fnc_MP; 
}; 
 
if(count _queryResult == 0) exitWith { 
 
[2,"EMonkeys_fnc_ausweisstatus",_player,false] call EMonkeys_fnc_MP; 
}; 
 
 
 
 
 
[_queryResult,"EMonkeys_fnc_ausweisver",_player,false] call EMonkeys_fnc_MP;