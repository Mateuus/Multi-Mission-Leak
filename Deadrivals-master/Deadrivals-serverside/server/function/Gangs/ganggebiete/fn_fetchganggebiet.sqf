private["_query","_houses","_query2","_mullname","_gangname","_gebietname"]; 
if (worldName == "Tanoa") then { 
_containers = format["SELECT id, classname, pos, gang, gebiet FROM gangebiet_tanoa WHERE aktiv = '%1'",1]; 
_containers = [_containers,2,true] call SERVERDATABASE_fnc_asyncCall; 
NOCRIS_GANGGEBIETE = _containers; 
publicVariable "NOCRIS_GANGGEBIETE"; 
 
if(count _containers == 0) exitWith {}; 
 
{ 
_id = _x select 0; 
_classname = _x select 1; 
_position = call compile format["%1",_x select 2]; 
_gangname = _x select 3; 
_gebietname = _x select 4; 
_capturepoint = _x select 5; 
 
_container = createVehicle[_classname,[0,0,999],[],0,"NONE"]; 
waitUntil {!isNil "_container" && {!isNull _container}}; 
_container allowDamage false; 
_container enablesimulation false; 
_container setVariable["ganggebiet_id",_id,true]; 
_container setVariable["ganggebiet_gangname",_gangname,true]; 
_container setVariable["ganggebiet_gebietname",_gebietname,true]; 
_container setVariable ["undercontrol",false,true]; 
_container setVariable ["unterbrochen",false,true]; 
_container setVariable ["einnehmbar",false,true]; 
 
_container setPosATL _position; 
 
_marker = createMarker [format["ganggebiet_%1",(_container getVariable "ganggebiet_id")],_position]; 
 
_mullname = format["%1 in Besitz von %2",_gebietname,_gangname]; 
 
_marker setMarkerText _mullname; 
_marker setMarkerColor "ColorRed"; 
_marker setMarkerType "hd_flag"; 
_marker setMarkerSize [1,1]; 
 
_areaName = createMarker [format["ganggebietarea_%1",(_container getVariable "ganggebiet_id")],_position]; 
 
_areaName setMarkerColor "ColorWhite"; 
_areaName setMarkerShape "ELLIPSE"; 
_areaName setMarkerBrush "SolidBorder"; 
_areaName setMarkerSize [250, 250]; 
 
 
_posX = (_position select 0); 
_posY = (_position select 1); 
_posZ = (_position select 2); 
_currentPos = getPosATL _container; 
_fixX = (_currentPos select 0) - _posX; 
_fixY = (_currentPos select 1) - _posY; 
_fixZ = (_currentPos select 2) - _posZ; 
_container setPosATL [(_posX - _fixX), (_posY - _fixY), (_posZ - _fixZ)]; 
} foreach _containers; 
 
} else { 
_containers = format["SELECT id, classname, pos, gang, gebiet FROM gangebiet_altis WHERE aktiv = '%1'",1]; 
_containers = [_containers,2,true] call SERVERDATABASE_fnc_asyncCall; 
NOCRIS_GANGGEBIETE = _containers; 
publicVariable "NOCRIS_GANGGEBIETE"; 
 
if(count _containers == 0) exitWith {}; 
 
{ 
_id = _x select 0; 
_classname = _x select 1; 
_position = call compile format["%1",_x select 2]; 
_gangname = _x select 3; 
_gebietname = _x select 4; 
_capturepoint = _x select 5; 
 
_container = createVehicle[_classname,[0,0,999],[],0,"NONE"]; 
waitUntil {!isNil "_container" && {!isNull _container}}; 
_container allowDamage false; 
_container enablesimulation false; 
_container setVariable["ganggebiet_id",_id,true]; 
_container setVariable["ganggebiet_gangname",_gangname,true]; 
_container setVariable["ganggebiet_gebietname",_gebietname,true]; 
_container setVariable ["undercontrol",false,true]; 
_container setVariable ["unterbrochen",false,true]; 
_container setVariable ["einnehmbar",false,true]; 
 
_container setPosATL _position; 
 
_marker = createMarker [format["ganggebiet_%1",(_container getVariable "ganggebiet_id")],_position]; 
 
_mullname = format["%1 in Besitz von %2",_gebietname,_gangname]; 
 
_marker setMarkerText _mullname; 
_marker setMarkerColor "ColorRed"; 
_marker setMarkerType "hd_flag"; 
_marker setMarkerSize [1,1]; 
 
_areaName = createMarker [format["ganggebietarea_%1",(_container getVariable "ganggebiet_id")],_position]; 
 
_areaName setMarkerColor "ColorWhite"; 
_areaName setMarkerShape "ELLIPSE"; 
_areaName setMarkerBrush "SolidBorder"; 
_areaName setMarkerSize [250, 250]; 
 
 
_posX = (_position select 0); 
_posY = (_position select 1); 
_posZ = (_position select 2); 
_currentPos = getPosATL _container; 
_fixX = (_currentPos select 0) - _posX; 
_fixY = (_currentPos select 1) - _posY; 
_fixZ = (_currentPos select 2) - _posZ; 
_container setPosATL [(_posX - _fixX), (_posY - _fixY), (_posZ - _fixZ)]; 
} foreach _containers; 
};