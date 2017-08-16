 
 
_shoppos = _this select 0; 
_player = _this select 1; 
_marker = _this select 2; 
 
diag_log ["rent office %1", _player]; 
 
if(isNil "rentedshops") then { rentedshops = []; }; 
 
if(_shoppos IN rentedshops) exitwith { "This shop is already rented, find one with out a marker!" remoteexec ["hint",_player]; }; 
 
rentedshops pushback _shoppos; 
 
_player setvariable ["office",_shoppos,false]; 
 
_markerz = createMarker [format["%1OFFICE",getPlayerUID _player], _shoppos]; 
_markerz setMarkerShape "ICON"; 
_markerz setMarkerType "hd_dot"; 
_markerz setMarkerColor "ColorGreen"; 
_markerz setMarkerText format["%1", _marker]; 
 
[] remoteexec ["client_fnc_completeoffice",_player];  
 
