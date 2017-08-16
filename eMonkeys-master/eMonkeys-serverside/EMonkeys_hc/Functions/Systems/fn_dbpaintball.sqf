/* 
 Author: Christian "Cifon" Runggas 
 E-mail: me@cifon.de 
*/ 
 
private["_killer","_dead","_deadid","_killerid","_name","_daten"]; 
 
 
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_dead = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
_killerid = getPlayerUID _killer; 
_deadid = getPlayerUID _dead; 
 
 
_query = format["UPDATE players SET paintballk=paintballk+1 WHERE playerid=%1",_killerid]; 
 
[_query,2] call DB_fnc_asyncCall; 
 
sleep 1; 
 
_query = format["UPDATE players SET paintballd=paintballd+1 WHERE playerid=%1",_deadid]; 
 
[_query,2] call DB_fnc_asyncCall; 
 
