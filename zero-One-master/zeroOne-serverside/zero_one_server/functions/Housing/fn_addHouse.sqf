/* 
 File: addHouse.sqf 
*/ 
private["_house","_uid","_housePos","_query","_queryResult"]; 
_uid = param[0,"",[""]]; 
_house = param[1,ObjNull,[ObjNull]]; 
if(isNull _house OR _uid isEqualTo "") exitWith {}; 
 
_housePos = getPosATL _house; 
_query = format["insertHouses:%1:%2:%3:%4:%5",_uid,_housePos,[[],0],[],1]; 
[_query,1] call zero_fnc_asyncCall; 
 
sleep 0.3; 
_query = format["selectHouses:%1:%2",_housePos,_uid]; 
_queryResult = [_query,2] call zero_fnc_asyncCall; 
_house setVariable["SOyeKO",(_queryResult select 0),true]; 
