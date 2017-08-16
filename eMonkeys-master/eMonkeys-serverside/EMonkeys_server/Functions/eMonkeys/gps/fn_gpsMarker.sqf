/* 
 Author: Niklas "Rappelkiste" Quenter 
 File: fn_gpsMarker.sqf 
 Contact: niklas.quenter@hotmail.de 
  
 Discription: Create Marker for GPS Tracker 
*/ 
private["_veh","_markerGPS","_vehmarker","_markerName","_gps_marker","_markers"]; 
_vehmarker = []; 
_markers = []; 
 
{ 
_veh = _x; 
_markerGPS = (_veh getVariable "vehicle_info_gps"); 
  
 if(!(isNil "_markerGPS")) then { 
  { 
   if ((GetPlayerUID player) in _x) then  
   { 
   _vehmarker pushback [_veh ,(_x select 2)]; 
 
   }; 
  } foreach _markerGPS; 
 }; 
} foreach allMissionObjects "LandVehicle"; 
 
{ 
_veh = _x; 
_markerGPS = (_veh getVariable "vehicle_info_gps"); 
  
 if(!(isNil "_markerGPS")) then { 
  { 
   if ((GetPlayerUID player) in _x) then  
   { 
   _vehmarker pushback [_veh ,(_x select 2)]; 
 
   }; 
  } foreach _markerGPS; 
 }; 
} foreach allMissionObjects "Air"; 
 
//Marker erstellen 
{ 
 _veh = _x select 0; 
 _gps_marker = _x select 1; 
 _markerName = format["%1_gpstracker",_veh];  
  
 _marker = createMarkerLocal [_markerName, visiblePosition _veh]; 
 _marker setMarkerColorLocal "ColorRed"; 
 _marker setMarkerTypeLocal "Mil_dot"; 
 _marker setMarkerTextLocal _gps_marker; 
  
 _markers pushBack [(_markerName),(_x select 0)]; 
} foreach _vehmarker; 
 
//Marker aktuallisieren  
while {visibleMap} do 
{ 
 { 
  _marker = _x select 0; 
  _marker setMarkerPosLocal (visiblePosition (_x select 1)); 
 } foreach _markers; 
 if(!visibleMap) exitWith {}; 
 uisleep 1; 
}; 
 
{ 
 deleteMarkerLocal (_x select 0); 
} foreach _markers;