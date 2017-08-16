 
 
 
 
 
 
 
 
 
private["_house","_uid","_housePos","_query"]; 
 
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_mode = _this select 2; 
 
if(isNull _house OR _uid == "") exitWith {}; 
 
_housePos = getPosATL _house; 
 
if(_mode == 0)then 
{ 
_GangQuery = format["SELECT id FROM gangs WHERE active='1' AND members LIKE '%2%1%2'",_uid,"%"]; 
waitUntil{!DB_Async_Active}; 
_GangQueryResult = [_GangQuery,2] call DB_fnc_asyncCall; 
 
_query = format["UPDATE houses SET gid = '%1' WHERE pos='%2' AND pid='%3'",_GangQueryResult select 0, _housePos, _uid]; 
waitUntil {!DB_Async_Active}; 
_thread = [_query,false] spawn DB_fnc_asyncCall; 
waitUntil {scriptDone _thread}; 
}; 
 
if(_mode == 1)then 
{ 
_query = format["UPDATE houses SET gid = '0' WHERE pos='%1' AND pid='%2'",_housePos, _uid]; 
waitUntil {!DB_Async_Active}; 
_thread = [_query,false] spawn DB_fnc_asyncCall; 
waitUntil {scriptDone _thread}; 
};