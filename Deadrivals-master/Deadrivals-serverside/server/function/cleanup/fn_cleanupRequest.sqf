private["_client","_loops"]; 
_client = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
if (isNull _client) exitWith {}; 
 
_loops = 0; 
for "_i" from 0 to 1 step 0 do { 
if (_loops >= 25) exitWith {}; 
if (!alive _client) exitWith { 
_containers = nearestObjects[(getPosATL _client),["WeaponHolderSimulated"],5]; 
if (count _containers > 0) then { 
{deleteVehicle _x;} forEach _containers;  
}; 
deleteVehicle _client;  
}; 
 
_loops = _loops + 1; 
uiSleep 1; 
};