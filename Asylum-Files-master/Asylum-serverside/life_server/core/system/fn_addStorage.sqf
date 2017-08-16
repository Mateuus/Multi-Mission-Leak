 
 
 
 
 
 
 
 
 
private["_crate", "_position", "_posIndex", "_house", "_inventory", "_container", "_containers", "_virtual","_containerId","_houseId"]; 
_crate = [_this,0,"",[""]] call BIS_fnc_param; 
_position = [_this,1,[],[[]]] call BIS_fnc_param; 
_posIndex = [_this,2,-1,[-1]] call BIS_fnc_param; 
_house = [_this,3,objNull,[objNull]] call BIS_fnc_param; 
_inventory = [_this,4,[],[[]]] call BIS_fnc_param; 
_virtual = [_this,5,[],[[]]] call BIS_fnc_param; 
_ownerId = [_this,6,"",[""]] call BIS_fnc_param; 
_gangHouse = [_this,7,false,[false]] call BIS_fnc_param; 
_containerId = [_this,8,-1,[-1]] call BIS_fnc_param; 
_houseId = [_this,9,"0",["0"]] call BIS_fnc_param; 
 
if (count _position == 0) exitWith {};  
 
_nObject = _position nearestObject _crate; 
_found = false; 
if (!isNull _nObject) then 
{ 
if ((_nObject getVariable["containerId", -1]) == _posIndex) then { _found = true; }; 
}; 
if (_found) exitWith {}; 
 
_position = [_position select 0, _position select 1, (_position select 2) + 0.15]; 
_container = createVehicle [_crate, _position, [], 0, "CAN_COLLIDE"]; 
 
_container setVectorUp [0,0,1]; 
_container setDamage 0; 
 
clearWeaponCargoGlobal _container; 
clearMagazineCargoGlobal _container; 
clearBackpackCargoGlobal _container; 
clearItemCargoGlobal _container; 
 
 
_modified = false; 
_vItems = _virtual select 0; 
 
if (!(_houseId in life_scanned_houses) && _crate == "Land_WaterBarrel_F") then 
{ 
_newItems = []; 
{ 
_var = _x select 0; 
_val = _x select 1; 
_new = switch (_x select 0) do 
{ 
case "scotch_0": { "scotch_1" }; 
case "scotch_1": { "scotch_2" }; 
case "scotch_2": { "scotch_3" }; 
case "whiskeyc_0": { "whiskeyc_1" }; 
case "whiskeyc_1": { "whiskeyc_2" }; 
case "whiskeyc_2": { "whiskeyc_3" }; 
case "whiskeyr_0": { "whiskeyr_1" }; 
case "whiskeyr_1": { "whiskeyr_2" }; 
case "whiskeyr_2": { "whiskeyr_3" }; 
 
 
 
case "rum_0": { "rum_1" }; 
case "rum_1": { "rum_2" }; 
case "rum_2": { "rum_3" }; 
default { "" }; 
}; 
if (_new in ["scotch_1","scotch_2","scotch_3"] && _val > 20) then { _newVal = _val - 20; _newItems pushBack [_x select 0, _newVal]; _val = 20; }; 
if (_new != "") then { _vItems set [_forEachIndex, [_new, _val]]; _modified = true; }; 
} foreach _vItems; 
{ 
_vItems pushBack _x; 
} forEach _newItems; 
if (_modified) then 
{ 
_virtual set [0, _vItems]; 
_container setVariable ["lootModified", true]; 
}; 
}; 
_container setVariable["house", _house, true]; 
_container setVariable["containerId", _posIndex, true]; 
_container setVariable["Trunk", _virtual, true]; 
_container enableRopeAttach false; 
if (_gangHouse) then { _container setVariable["crateOwner", "0"]; } 
else { _container setVariable["crateOwner", _ownerId]; }; 
_house setVariable["containerCount", (_house getVariable["containerCount", 0])+1, true]; 
_containers = _house getVariable ["containers", []]; 
_containers set [count _containers, _container]; 
_house setVariable["containers", _containers]; 
_house setVariable["conUniqueId", _containerId]; 
 
if ((count _inventory) > 0) then 
{ 
_x = _inventory select 0; 
for "_i" from 0 to ((count (_x select 0)) - 1) do 
{ 
_container addWeaponCargoGlobal [(_x select 0) select _i,(_x select 1) select _i]; 
}; 
_x = _inventory select 1; 
for "_i" from 0 to ((count (_x select 0)) - 1) do 
{ 
_container addMagazineCargoGlobal [(_x select 0) select _i,(_x select 1) select _i]; 
}; 
_x = _inventory select 2; 
for "_i" from 0 to ((count (_x select 0)) - 1) do 
{ 
_container addBackpackCargo [(_x select 0) select _i,(_x select 1) select _i]; 
}; 
_x = _inventory select 3; 
for "_i" from 0 to ((count (_x select 0)) - 1) do 
{ 
_container addItemCargoGlobal [(_x select 0) select _i,(_x select 1) select _i]; 
}; 
}; 
 
[[_container],"life_fnc_crateAction",true,false] spawn life_fnc_MP; 
 
life_storage_array pushBack _container; 
 
 
 
_container;