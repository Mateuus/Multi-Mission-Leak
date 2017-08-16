private["_loadperso","_player","_side","_name","_uid","_generaldata","_geardata","_whitelistdata","_gangRequest","_gangdata","_specificdata","_kranheitsdata"]; 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_player = owner _player; 
 
_loadperso = format["SELECT name,bild,adress,birthday,serial FROM perso WHERE playerid = '%1'",_uid]; 
 
_loadperso = [_loadperso,2] call SERVERDATABASE_fnc_asyncCall; 
 
[_loadperso] remoteExec ["CLIENTSERVER_fnc_loadperso",_player]; 
