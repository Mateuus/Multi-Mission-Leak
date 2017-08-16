 
 
 
 
 
 
 
 
private["_item", "_house", "_unit", "_position", "_crate", "_container", "_posIndex", "_indexes"]; 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_item = [_this,1,"",[""]] call BIS_fnc_param; 
_house = [_this,2,objNull,[objNull]] call BIS_fnc_param; 
 
_container = (_house getVariable["containerCount", 0]); 
_indexes = [typeOf _house] call ASY_fnc_houseContainerPos; 
_posIndex = -1; 
_id = -1; 
diag_log format["[placeStorage] _indexes = %1", _indexes]; 
 
{ 
_found = false; 
_id = _x; 
if (typeName _x == "ARRAY") then { _id = _forEachIndex+1; }; 
{ 
if (_x getVariable["containerId", -1] == _id) then { _found = true; }; 
} forEach (_house getVariable ["containers", []]); 
if (!_found) exitWith { _posIndex = _id }; 
} forEach _indexes; 
 
if (_posIndex == -1) exitWith { [[1, "The server was unable to find an available position in your home for this container!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; }; 
 
diag_log format["[placeStorage] _posIndex = %1", _posIndex]; 
diag_log format["[placeStorage] _indexes select 0 = %1", _indexes select 0]; 
_position = if (typeName (_indexes select 0) == "ARRAY") then { _house modelToWorld (_indexes select (_posIndex-1)) } else { _house buildingPos _posIndex }; 
diag_log format["[placeStorage] _position = %1", _position]; 
 
_crate = "Box_East_Support_F"; 
switch (_item) do 
{ 
case "storage1": { _crate = "Box_East_Support_F"; }; 
case "storage2": { _crate = "Box_East_WpsSpecial_F"; }; 
case "agingbarrel": { _crate = "Land_WaterBarrel_F"; }; 
}; 
 
[_crate, _position, _posIndex, _house] spawn DB_fnc_insertStorage; 
[_crate, _position, _posIndex, _house, [], [[],0], getPlayerUID _unit] spawn ASY_fnc_addStorage; 
 
[[1, "You placed a storage container in this house!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;