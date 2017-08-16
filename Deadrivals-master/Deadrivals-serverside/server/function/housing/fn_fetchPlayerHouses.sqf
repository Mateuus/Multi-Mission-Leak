private["_query","_houses"]; 
if(_this == "") exitWith {}; 
if (worldName == "Tanoa") then { 
_query = format["SELECT pid, pos FROM houses_tanoa WHERE owned = '1' AND pid = '%1' OR schlussel LIKE '%2%1%2'",_this,"%"]; 
 
_houses = [_query,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
_return = []; 
{ 
_pos = call compile format["%1",_x select 1]; 
_house = nearestObject [_pos, "House"]; 
_house allowDamage false; 
_return pushBack [_x select 1]; 
} forEach _houses; 
 
missionNamespace setVariable[format["houses_%1",_this],_return]; 
} else { 
_query = format["SELECT pid, pos FROM houses_altis WHERE owned = '1' AND pid = '%1' OR schlussel LIKE '%2%1%2'",_this,"%"]; 
 
_houses = [_query,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
_return = []; 
{ 
_pos = call compile format["%1",_x select 1]; 
_house = nearestObject [_pos, "House"]; 
_house allowDamage false; 
_return pushBack [_x select 1]; 
} forEach _houses; 
 
missionNamespace setVariable[format["houses_%1",_this],_return]; 
};