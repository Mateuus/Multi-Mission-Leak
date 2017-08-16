/* 
 Author: Christian "Cifon" Runggas 
 E-mail: me@cifon.de 
*/ 
 
private["_uid","_query","_queryResult","_player","_name","_daten"]; 
 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = _this select 1; 
_name = _this select 2; 
_data = _this select 3; 
_player1 = _player; 
 
if(isNull _player) exitWith {}; 
 
 
 
 
_query = format["SELECT * FROM ausweis WHERE Playerid='%1' AND Spieler_name='%2'",_uid,_name];  
 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
 
if(count _queryResult != 0) exitWith  
{ 
 
[1,"EMonkeys_fnc_ausweisstatus",_player,false] call EMonkeys_fnc_MP; 
}; 
 
_query = format["INSERT INTO ausweis (Playerid, Spieler_name, Ausweisdaten, Ausstelldatum) VALUES('%1', '%2', '%3',CURRENT_TIMESTAMP)",_uid,_name,_data]; 
 
_queryResult = [_query,1] call DB_fnc_asyncCall; 
 
[_player1,_uid,_name] call EMonkeys_fnc_ausweisload; 
