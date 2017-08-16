 
 
 
 
 
 
 
private["_locName","_locId","_speaker","_marker"]; 
_locId = [_this,0,0,[0]] call BIS_fnc_param; 
_locName = [_this,1,"",[""]] call BIS_fnc_param; 
 
if(_locName == "" OR _locId == 0) exitWith {}; 
if(_locId in life_martial) exitWith {}; 
life_martial set[count life_martial, _locId]; 
 
[[1, format["<t align='center' size='2' color='#ff0000'>Martial Law in %1</t><br />Martial law has been declared in %1. Civilians are requested to leave the area until further notice. <t underline='true'>Your safety cannot be guaranteed!</t> All armed citizens in this area will be considered hostile.", _locName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
call compile format["_speaker = martial_alarm_%1", _locId]; 
 
life_martial_alarm = createSoundSource ["Sound_Alarm", position _speaker, [], 0]; 
 
life_martial_marker = format["martial_marker_%1", _locId]; 
createMarker [life_martial_marker, position _speaker]; 
life_martial_marker setMarkerShape "ELLIPSE"; 
life_martial_marker setMarkerType "Warning"; 
life_martial_marker setMarkerColor "ColorRed"; 
life_martial_marker setMarkerBrush "DiagGrid"; 
life_martial_marker setMarkerSize [400,400]; 
life_martial_marker setMarkerText "Martial Law";