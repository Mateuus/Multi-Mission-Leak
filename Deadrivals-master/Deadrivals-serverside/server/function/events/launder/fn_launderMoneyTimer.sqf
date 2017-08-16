private["_player", "_playeruid", "_query", "_result", "_money_result","_money"]; 
 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
 
_money = format["SELECT value FROM geldwasche WHERE player = '%1' AND remainingtime <= '0'",_uid]; 
_money = [_money,2] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _money == 0) exitWith {}; 
 
_query = format["DELETE FROM geldwasche WHERE player = '%1' AND remainingtime <= '0'", _uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
[_money] remoteExec ["CLIENT_fnc_moneyauszahlen",_player]; 
 
 
