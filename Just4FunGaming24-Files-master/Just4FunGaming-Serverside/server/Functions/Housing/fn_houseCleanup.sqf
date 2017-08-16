private["_uid", "_pos", "_house"]; 
 
if( !params[ ["_uid", "", [""]] ]) exitWith {}; 
 
{ 
 _pos = call compile format["%1", _x select 1]; 
 _house = nearestBuilding _pos; 
 { 
  if( !(isNull _x) ) then { 
   deleteVehicle _x; 
  }; 
 } forEach (_house getVariable ["containers", []]); 
  
 _house setVariable["containers", nil, true]; 
 
} forEach ([ format["SELECT pid, pos, inventory, containers FROM houses WHERE pid = '%1' AND owned = '1'", _uid], 2, true] call XYDB_fnc_asyncCall);