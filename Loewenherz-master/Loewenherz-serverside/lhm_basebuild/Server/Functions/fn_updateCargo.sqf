private["_query","_object","_objectID","_inventory","_queryResult"]; 
_object = _this select 0; 
_objectID = _object getVariable ["ObjectID",0]; 
 
if (isNull _object) exitWith {diag_log"SERVER UPDATE: Reammobox: Error Object isNull!"}; 
if (_objectID == 0) exitWith {diag_log "SERVER UPDATE: Reammobox: Error ID = 0"}; 
 
_inventory =  
[ 
 getWeaponCargo _object, 
 getMagazineCargo _object, 
 getBackpackCargo _object, 
 getItemCargo _object 
]; 
 
waitUntil {sleep 1; !isNil "_inventory"}; 
 
_previous = str(_object getVariable["lastInventory",[]]); 
if (str(_inventory) != _previous) then { 
 diag_log format["SERVER UPDATE: Reammobox: ObjectID: %1 Type: %2",_objectID,str(typeOf _object)];   
 _object setVariable["lastInventory",_inventory]; 
 _query = format["UPDATE lhm_basebuild SET Inventory='%1' WHERE ObjectID='%2'",_inventory,_objectID]; 
  
 _queryResult = [_query,1] call DB_fnc_asyncCall; 
};