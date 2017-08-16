private["_array1","_rndnr1","_rndnr2"]; 
 
_array1 = ["rarzeug_1","rarzeug_2","rarzeug_3","rarzeug_4","rarzeug_5","rarzeug_6","rarzeug_7","rarzeug_8","rarzeug_9","rarzeug_10","rarzeug_11","rarzeug_12","rarzeug_13","rarzeug_14"]; 
_random1 = _array1 select floor random count _array1; 
_rndnr1 = round(random 5); 
_rndnr2 = round(random 7); 
 
if(_rndnr1 == 3 && _rndnr2 == 6 && !(isNull rarzeug1)) then { 
rarzeug1 setpos (getMarkerPos _random1); 
rarzeug1 setdir (markerDir _random1); 
}; 
if(_rndnr1 == 1 && _rndnr2 == 7 && !(isNull rarzeug2)) then { 
rarzeug2 setpos (getMarkerPos _random1); 
rarzeug2 setdir (markerDir _random1); 
}; 
if(_rndnr1 == 4 && _rndnr2 == 5 && !(isNull rarzeug3)) then { 
rarzeug3 setpos (getMarkerPos _random1); 
rarzeug3 setdir (markerDir _random1); 
}; 
if(_rndnr1 == 0 && _rndnr2 == 0 && !(isNull rarzeug4)) then { 
rarzeug4 setpos (getMarkerPos _random1); 
rarzeug4 setdir (markerDir _random1); 
};