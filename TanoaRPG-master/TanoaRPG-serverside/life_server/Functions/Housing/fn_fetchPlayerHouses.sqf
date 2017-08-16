/* 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Fetches all the players houses and sets them up. 
*/ 
if(!isNull life_hc_inUse) exitWith {_this remoteExec ["TEX_fnc_fetchPlayerHouses", life_hc_inUse]}; 
 
private["_query","_houses","_return"]; 
if(_this == "") exitWith {}; 
 
_query = format["SELECT id, pos, inventory, containers FROM houses WHERE pid='%1' AND owned='1'",_this]; 
_houses = [_query,2,true] call DB_fnc_asyncCall; 
 
_return = []; 
{ 
 _pos = call compile format["%1",(_x select 1)]; 
  
 _trunk = [_x select 2] call DB_fnc_mresToArray; 
 if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];}; 
  
 _containerData = [_x select 3] call DB_fnc_mresToArray; 
 if(typeName _containerData == "STRING") then {_containerData = call compile format["%1", _containerData];}; 
  
 _data = (mvh getVariable [format["HousesData_%1", _this],[]]); 
 _data pushBack [(_x select 0), [], _pos]; 
 mvh setVariable [format["HousesData_%1", _this], _data, true]; 
  
 _return pushBack [(_x select 1),[_trunk,_containerData]]; 
} foreach _houses; 
 
missionNamespace setVariable[format["houses_%1",_this],_return];