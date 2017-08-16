#include "\life_server\script_macros.hpp" 
/* 
 Author: Sink (Al Morise) 
        Description: Upgrade the security house level. 
*/ 
private["_house","_uid","_housePos","_query","_securityLvl"]; 
params [ 
 ["_uid","",[""]], 
 ["_house",objNull,[objNull]], 
 ["_securityLvl",0,[0]] 
]; 
if(isNull _house OR {_uid isEqualTo ""}) exitWith {}; 
 
_housePos = getPosATL _house; 
 
_query = format["UPDATE houses set security = %1 where pid = '%2' AND pos = '%3'",_securityLvl,_uid,_housePos]; 
//waitUntil{!DB_async_active}; 
[_query,1] call DB_fnc_asyncCall; 
 
sleep 0.3; 
//waitUntil{!DB_async_active}; 
_query = format["SELECT security FROM houses WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid]; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
_house setVariable["house_security",(_queryResult select 0),true];