 
 
 
 
 
 
private ["_car"]; 
_car = _this; 
_car setVectorUp surfaceNormal position _car; 
_car setPosASL [getPosASL _car select 0, getPosASL _car select 1, (getPosASL _car select 2) + 2.2]; 
