 
 
 
 
 
 
private["_query","_houses"]; 
_query = format["SELECT pid, pos, inventory, containers FROM houses WHERE pid='%1' AND owned='1'",_this]; 
; 
_houses = [_query,2,true] call DB_fnc_asyncCall; 
 
if(count _houses == 0) exitWith {}; 
{ 
_pos = call compile format["%1",_x select 1]; 
_house = nearestBuilding _pos; 
 
if(!isNil {(_house getVariable "containers")}) then { 
{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers"); 
_house setVariable["containers",nil,true]; 
}; 
 
if(!isNil {(_house getVariable "spendenhaus")}) then { 
{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "spendenhaus"); 
_house setVariable["spendenhaus",nil,true]; 
}; 
} foreach _houses;