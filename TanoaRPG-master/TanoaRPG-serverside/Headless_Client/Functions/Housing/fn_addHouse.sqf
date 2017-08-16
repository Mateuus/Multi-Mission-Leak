/* 
 Author: Bryan "Tonic" Boardwine 
 Edit: CooliMC 
  
 Description: 
 I must modify the Script because fuck Bohemia and Tonic 
*/ 
 
private["_player","_uid","_housePos","_query","_data"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_housePos = [_this,1,"",[""]] call BIS_fnc_param; 
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
if(_housePos == "" OR _uid == "" OR isNull _player) exitWith {}; 
 
_housePos = (call compile _housePos); 
 
_query = format["INSERT INTO houses (pid, pos, inventory, containers, owned) VALUES('%1', '%2', '""[[],0]""', '""[]""', '1')",_uid,_housePos]; 
diag_log format["Query: %1",_query]; 
[_query,1] call DB_fnc_asyncCall; 
 
sleep 0.5; 
_query = format["SELECT id FROM houses WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid]; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
systemChat format["House ID assigned: %1",_queryResult select 0]; 
if(isNull _player) exitWith {}; 
[(_queryResult select 0),_housePos] remoteExec ["tanoarpg_fnc_addHouseID", _player]; 
 
_data = (mvh getVariable [format["HousesData_%1", _uid],[]]); 
_data pushBack [(_queryResult select 0), [], _housePos]; 
mvh setVariable [format["HousesData_%1", _uid], _data, true];