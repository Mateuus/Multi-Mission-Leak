 
 
 
 
 
 
 
private["_locId","_locName"]; 
_locId = [_this,0,0,[0]] call BIS_fnc_param; 
_locName = [_this,1,"",[""]] call BIS_fnc_param; 
 
deletevehicle life_martial_alarm;  
deleteMarker life_martial_marker; 
 
[[1, format["<t align='center' size='2' color='#00ff00'>Order Restored in %1</t><br />Order has been restored in %1.", _locName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;