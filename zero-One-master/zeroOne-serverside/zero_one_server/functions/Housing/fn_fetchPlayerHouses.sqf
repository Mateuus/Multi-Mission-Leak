/* 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Fetches all the players houses and sets them up. 
*/ 
private["_query","_houses","_pos","_return","_house","_containers","_trunk"]; 
if(_this isEqualTo "") exitWith {}; 
 
_query = format["selectHouse:%1",_this]; 
_houses = [_query,2,true] call zero_fnc_asyncCall; 
if (isNil "_houses") exitWith {}; 
_return = []; 
{ 
 if(_x isEqualTo [] || typeName _x != "ARRAY" || {count _x != 4}) exitWith { 
   diag_log format ["fetchPlayerHouses error _x: %1", _x]; 
 }; 
 diag_log format ["fetchPlayerHouses _x: %1", _x]; 
 _pos = _x select 1; 
 if(isNil "_pos") exitWith {diag_log format ["fetchPlayerHouses isNil _pos, _x: %1", _x];}; 
 _pos = call compile format["%1",_pos]; 
 _house = nearestBuilding _pos; 
 _house allowDamage false; 
 _containers = []; 
 _return pushBack [_x select 1,_containers]; 
} forEach _houses; 
 
missionNamespace setVariable[format["houses_%1",_this],_return]; 
