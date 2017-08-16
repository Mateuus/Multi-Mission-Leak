 
 
 
 
 
 
 
private["_query","_queryResult","_uid","_player"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_query = format["SELECT fromID, toID, message, fromName, toName FROM messages WHERE toID='%1' ORDER BY time DESC LIMIT 20",_uid]; 
 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
 
if(count _queryResult == 0) exitWith {}; 
{ 
[1,_x] remoteExecCall ["life_fnc_sms",_player]; 
}forEach _queryResult;