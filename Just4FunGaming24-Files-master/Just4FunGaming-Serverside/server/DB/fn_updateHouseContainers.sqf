private["_house", "_houseID", "_containers", "_query"]; 
 
diag_log format["updateHouseContainers(%1)", _this]; 
 
_house = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param; 
if( isNull _house ) exitWith { diag_log "House is null" }; 
 
_houseID = _house getVariable["house_id", -1]; 
if( _houseID < 0 ) exitWith { diag_log "House ID is invalid" }; 
 
_containers = _house getVariable "containers"; 
if( isNil "_containers" ) exitWith {}; 
 
_arr = []; 
{ 
 _className = typeOf _x; 
 _weapons = getWeaponCargo _x; 
 _magazines = getMagazineCargo _x; 
 _items = getItemCargo _x; 
 _backpacks = getBackpackCargo _x; 
  
 _arr pushBack [_className,[_weapons,_magazines,_items,_backpacks]]; 
} forEach _containers; 
 
_arr = [_arr] call XYDB_fnc_mresArray; 
 
_query = format["UPDATE houses SET containers = '%1' WHERE id = '%2'", _arr, _houseID]; 
diag_log format["UPDATE house: %1", _query]; 
 
[ _query, 1 ] call XYDB_fnc_asyncCall;