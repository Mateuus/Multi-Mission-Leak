private ["_types","_lamps","_empDevice"]; 
_empDevice = param [0,ObjNull,[ObjNull]]; 
 
_types = 
[ 
 "Land_PowerPoleWooden_F", 
 "Land_LampHarbour_F", 
 "Land_LampHalogen_F", 
 "Land_LampShabby_F", 
 "Land_runway_edgelight_blue_F", 
 "Land_PowerPoleWooden_L_F", 
 "Land_LampDecor_F", 
 "Land_LampSolar_F", 
 "Land_LampStreet_small_F", 
 "Land_LampStreet_F", 
 "Land_LampAirport_F", 
 "Lamps_Base_F", 
 "Land_ts_roof_F", 
 "PowerLines_base_F", 
 "Land_PowLines_WoodL", 
 "Land_PowLines_ConcL", 
 "Land_lampa_ind_zebr", 
 "Land_lampa_sidl_3", 
 "Land_lampa_vysoka", 
 "Land_lampa_ind", 
 "Land_lampa_ind_b", 
 "Land_lampa_sidl", 
 "Car", 
 "Ship", 
 "Air" 
]; 
 
sleep 3.35; 
[[_empDevice,"empwarn"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp; 
sleep 3.35; 
[[_empDevice,"empfire"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp; 
 
 _empflash = "#lightpoint" createVehicleLocal getpos (vehicle player); 
 _empflash setLightAmbient[0, 750, 1500]; 
 _empflash setLightColor[0, 750, 1500]; 
 _empflash setLightBrightness 1000; 
 sleep 0.001; 
 deletevehicle _empflash; 
 
for [{_i=0},{_i < (count _types)},{_i=_i+1}] do 
{ 
 
 _lamps = getMarkerPos "fed_reserve" nearObjects [_types select _i, 500]; 
 
 { 
  _x allowDamage true 
 } forEach _lamps; 
 { 
 
 if (_x isKindOf "Car" || _x isKindOf "Ship" || _x isKindOf "Air") then 
 { 
  hint str _x; 
  BIS_CARS action ["LightOff", _x]; 
  _x setHit [getText(configFile >> "cfgVehicles" >> typeOf _x >> "HitPoints" >> "HitEngine" >> "name"), 1]; 
 } else { 
  _x setDamage 0.95 
 }; 
 
 } forEach _lamps; 
sleep 0.1; 
}; 
 
[] spawn { 
 sleep 1 + (random 5); 
 fedFire1 = "test_EmptyObjectForFireBig" createVehicle getPos fed_transf1; 
 sleep 1 + (random 5); 
 fedFire2 = "test_EmptyObjectForFireBig" createVehicle getPos fed_transf2; 
 sleep 1 + (random 5); 
 fedFire3 = "test_EmptyObjectForFireBig" createVehicle getPos fed_powerline; 
 sleep 1 + (random 5); 
 fedFire4 = "test_EmptyObjectForFireBig" createVehicle getPos fed_com; 
}; 
