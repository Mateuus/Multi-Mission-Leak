#include "\life_server\script_macros.hpp" 
/* 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Blah 
*/ 
private["_housePos","_query","_house"]; 
params [ 
 ["_uid","",[""]], 
 ["_housePos",[],[[]]] 
]; 
if(_uid isEqualTo "") exitWith {}; 
 
_query = format["INSERT INTO houses (pid, pos, owned, security) VALUES('%1', '%2', '1',0)",_uid,_housePos]; 
 
[_query,1] call DB_fnc_asyncCall; 
 
sleep 0.3; 
 
_query = format["SELECT id FROM houses WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid]; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
//systemChat format["House ID assigned: %1",_queryResult select 0]; 
_house = nearestBuilding _housePos; 
_house setVariable["house_id",(_queryResult select 0),true]; 
