private["_query","_houses","_query2"]; 
 
_containers = format["SELECT id, classname, pos, dir FROM mullabfuhr WHERE aktiv = '%1' AND remainingtime <= '%1'",0]; 
_containers = [_containers,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _containers == 0) exitWith {}; 
 
{ 
_id = _x select 0; 
_position = call compile format["%1",_x select 2]; 
_direction = call compile format["%1",_x select 3]; 
_container = createVehicle[(_x select 1),[0,0,999],[],0,"NONE"]; 
waitUntil {!isNil "_container" && {!isNull _container}}; 
_container allowDamage false; 
_container enablesimulation false; 
_container setVariable["mulltonne_id",_id,true]; 
_container setPosATL _position; 
_container setVectorDirAndUp _direction; 
 
clearWeaponCargoGlobal _container; 
clearMagazineCargoGlobal _container; 
clearItemCargoGlobal _container; 
clearBackpackCargoGlobal _container; 
 
_marker = createMarker [format["mull_%1",(_container getVariable "mulltonne_id")],_position]; 
_mullname = "Mülltonne"; 
_marker setMarkerText _mullname; 
_marker setMarkerColor "ColorOrange"; 
_marker setMarkerType "loc_SmallTree"; 
_marker setMarkerSize [1,1]; 
 
 
_posX = (_position select 0); 
_posY = (_position select 1); 
_posZ = (_position select 2); 
_currentPos = getPosATL _container; 
_fixX = (_currentPos select 0) - _posX; 
_fixY = (_currentPos select 1) - _posY; 
_fixZ = (_currentPos select 2) - _posZ; 
_container setPosATL [(_posX - _fixX), (_posY - _fixY), (_posZ - _fixZ)]; 
_container setVectorDirAndUp _direction; 
 
_query = format ["UPDATE mullabfuhr SET aktiv = '%1' WHERE id = '%2'",1,_id]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} foreach _containers; 
