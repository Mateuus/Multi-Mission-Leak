/* 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Cleans up containers inside the house. 
*/ 
private["_query","_houses"]; 
_query = format["housingCleanup:%1",_this]; 
waitUntil{!DB_Async_Active}; 
_houses = [_query,2,true] call DB_fnc_asyncCall; 
 
if(count _houses == 0) exitWith {}; 
 
_blockTime = 0; 
{_pos = call compile format["%1",_x select 1]; _house = nearestBuilding _pos; _blockTime = _blockTime max (_house getVariable["HouseSpawnBlockTime",0])}forEach _houses; 
waitUntil{serverTime > _blockTime}; 
 
{  
 _pos = call compile format["%1",_x select 1]; 
 _house = nearestBuilding _pos; 
 _save = [_house] spawn TON_fnc_updateHouseContainers; 
 waitUntil{scriptDone _save}; 
 
 if(!isNil {(_house getVariable "containers")}) then { 
  {if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers"); 
  _house setVariable["containers",nil,true]; 
 }; 
} foreach _houses;