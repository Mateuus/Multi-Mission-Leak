 
 
 
 
 
 
 
private["_min", "_max", "_ret"]; 
 
while {true} do { 
fuel_diesel = round(5 + random (30 - 5)); 
fuel_super = round(30 + random (60 - 30)); 
fuel_super_plus = round(60 + random (100 - 60)); 
fuel_kerosin = round(100 + random (200 - 100)); 
publicVariable "fuel_diesel"; 
publicVariable "fuel_super"; 
publicVariable "fuel_super_plus"; 
publicVariable "fuel_kerosin"; 
[0,format["Spritpreise haben sich geändert!"]] remoteExecCall ["life_fnc_broadcast",0]; 
uisleep (30 * 60); 
};