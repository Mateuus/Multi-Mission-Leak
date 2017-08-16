/* 
 Author: Sink (Al Morise) 
        Description: Upgrade the security house level. 
*/ 
private["_house","_uid","_housePos","_query","_queryResult","_securityLvl"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_securityLvl = [_this,2,0,[0]] call BIS_fnc_param; 
if(isNull _house OR _uid == "") exitWith {}; 
 
_housePos = getPosATL _house; 
 
waitUntil{!DB_Async_Active}; 
_query = format["housingUpgradeSecurity:%1:%2:%3",_securityLvl,_uid,_housePos]; 
[_query,1] call DB_fnc_asyncCall; 
 
sleep 0.3; 
 
waitUntil{!DB_Async_Active}; 
_query = format["housingFetchSecurity:%1:%2",_uid,_housePos]; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
_house setVariable["house_security",(_queryResult select 0),true];