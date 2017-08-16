/* 
Filename: fn_littleBoy.sqf 
 
Description: spawns a nuke 
 
Author: Unknown modded by Blackd0g 
*/ 
private["_pos","_alt","_countdown"]; 
 
// Position from MapClick 
_pos = _this select 0; 
_alt = _this select 1; 
 
_countdown = 120; // Time to detonate 
If (isServer) then { 
nukeMarker = createMarker ["nuke", _pos]; 
nukeMarker setMarkerText " Nuclear Strike"; 
nukeMarker setMarkerType"mil_warning"; 
nukeMarker setMarkerColor "ColorRed"; 
}; 
 
for "_i" from 0 to _countdown do { 
if (_countdown - _i < 11) then { 
playSound "Alarm"; 
}; 
_txtTmp = format ["Nuclear Bomb Detonation in %1", (_countdown - _i)]; 
[_txtTmp, -1, -0.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
sleep 1; 
}; 
 
nukepos = "Land_Device_assembled_F" createVehicleLocal _pos;  
mdh_nuke_destruction_zone = 1000; 
mdh_nuke_camshake   = 1; 
mdh_nuke_ash    = 1; 
mdh_nuke_colorcorrection = 1; 
mdh_nuke_removecorrection = 1; 
mdh_nuke_removeash    = 1; 
 
 
_Cone = "#particlesource" createVehicleLocal getpos nukepos; 
_Cone setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 10, [0, 0, 0], 
[0, 0, 0], 0, 1.275, 1, 0, [40,80], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5],  
[0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", nukepos]; 
_Cone setParticleRandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0]; 
_Cone setParticleCircle [10, [-10, -10, 20]]; 
_Cone setDropInterval 0.005; 
 
_top = "#particlesource" createVehicleLocal getpos nukepos; 
_top setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 3, 48, 0], "", "Billboard", 1, 20, [0, 0, 0], 
[0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", nukepos]; 
_top setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360]; 
_top setDropInterval 0.002; 
 
_top2 = "#particlesource" createVehicleLocal getpos nukepos; 
_top2 setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 3, 112, 0], "", "Billboard", 1, 20, [0, 0, 0], 
[0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", nukepos]; 
_top2 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360]; 
_top2 setDropInterval 0.002; 
 
_smoke = "#particlesource" createVehicleLocal getpos nukepos; 
_smoke setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0], 
[0, 0, 60], 0, 1.7, 1, 0, [40,15,120],  
[[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]] 
, [0.5, 0.1], 1, 1, "", "", nukepos]; 
_smoke setParticleRandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360]; 
_smoke setDropInterval 0.002; 
 
[] spawn { 
 playSound "Earthquake_04"; 
 sleep 5; 
 playSound "Earthquake_04"; 
 sleep 5; 
 playSound "Earthquake_04"; 
 sleep 5; 
 playSound "Earthquake_04"; 
 sleep 5; 
 playSound "Earthquake_04"; 
 sleep 5; 
 playSound "Earthquake_04"; 
 sleep 5; 
 playSound "Earthquake_04"; 
 sleep 5; 
}; 
 
_Wave = "#particlesource" createVehicleLocal getpos nukepos; 
_Wave setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 20, [0, 0, 0], 
[0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5],  
[0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", nukepos]; 
_Wave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0]; 
_Wave setParticleCircle [50, [-80, -80, 2.5]]; 
_Wave setDropInterval 0.0002; 
 
 
_light = "#lightpoint" createVehicleLocal [((getpos nukepos select 0)),(getpos nukepos select 1),((getpos nukepos select 2)+500)]; 
_light setLightAmbient[1500, 1200, 1000]; 
_light setLightColor[1500, 1200, 1000]; 
_light setLightBrightness 100000.0; 
 
 
if (mdh_nuke_colorcorrection > 0) then 
{ 
 [] spawn { 
 "colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]]; 
 "colorCorrections" ppEffectCommit 0; 
 "colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];   
 "colorCorrections" ppEffectCommit 3; 
 "colorCorrections" ppEffectEnable true; 
 "filmGrain" ppEffectEnable true;  
 "filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false]; 
 "filmGrain" ppEffectCommit 5; 
 }; 
} 
else 
{ 
 [] spawn { 
 "dynamicBlur" ppEffectEnable true; 
 "dynamicBlur" ppEffectAdjust [1]; 
 "dynamicBlur" ppEffectCommit 1; 
 
 "colorCorrections" ppEffectEnable true; 
 "colorCorrections" ppEffectAdjust [0.8, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.0, 0.6, 2],[0.3, 0.3, 0.3, 0.1]];"colorCorrections" ppEffectCommit 0.4; 
 
 "dynamicBlur" ppEffectAdjust [0.5]; 
 "dynamicBlur" ppEffectCommit 3; 
 
 0 setOvercast 0; 
 sleep 0.1; 
 
 _xHandle = []spawn 
 { 
 Sleep 1; 
 "colorCorrections" ppEffectAdjust [1.0, 0.5, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]]; 
 "colorCorrections" ppEffectCommit 2; 
 }; 
 
 
 "dynamicBlur" ppEffectAdjust [2]; 
 "dynamicBlur" ppEffectCommit 1; 
 
 "dynamicBlur" ppEffectAdjust [0.5]; 
 "dynamicBlur" ppEffectCommit 4; 
 
 sleep 4.5; 
 
 "colorCorrections" ppEffectAdjust [1, 1, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];"colorCorrections" ppEffectCommit 1; "colorCorrections" ppEffectEnable TRUE; 
 "dynamicBlur" ppEffectAdjust [0]; 
 "dynamicBlur" ppEffectCommit 1; 
 }; 
}; 
 
player spawn { 
 enableCamShake true; 
 addCamShake [10, 70, 25]; 
 sleep 70; 
 enableCamShake false; 
}; 
 
if(mdh_nuke_ash > 0) then { 
 [] spawn { 
 sleep 20; 
  [] spawn { 
   _pos = position player; 
   _parray = [ 
   ["A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 8, 1], 
   "", 
   "Billboard", 
   1, 
   4, 
   [0,0,0], 
   [0,0,0], 
   1, 
   0.000001, 
   0, 
   1.4, 
   [0.05,0.05], 
   [[0.1,0.1,0.1,1]], 
   [0,1], 
   0.2, 
   1.2, 
   "", 
   "", 
   vehicle player 
   ]; 
   mdh_ash = "#particlesource" createVehicleLocal _pos;   
   mdh_ash setParticleParams _parray; 
   mdh_ash setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0]; 
   mdh_ash setParticleCircle [0.0, [0, 0, 0]]; 
   mdh_ash setDropInterval 0.01; 
  }; 
 }; 
}; 
 
if (mdh_nuke_destruction_zone > 0) then 
{ 
// only server runs the dmg script 
if (isServer) then { 
 { 
  _x setdamage 1; 
  sleep 0.01; 
 } forEach (nearestObjects [(getpos nukepos), [], mdh_nuke_destruction_zone]); 
 }; 
}; 
 
 
_Wave setDropInterval 0.001; 
deletevehicle _top; 
deletevehicle _top2; 
 
sleep 4.5; 
 
_i = 0; 
while {_i < 100} do 
{ 
 _light setLightBrightness 100.0 - _i; 
 _i = _i + 1; 
 sleep 0.1; 
}; 
deleteVehicle _light; 
 
sleep 2; 
 
_smoke setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0], 
[0, 0, 45], 0, 1.7, 1, 0, [40,25,80],  
[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]] 
, [0.5, 0.1], 1, 1, "", "", nukepos]; 
 
_Cone setDropInterval 0.01; 
_smoke setDropInterval 0.006; 
_Wave setDropInterval 0.001; 
 
sleep 2; 
 
_smoke setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0], 
[0, 0, 30], 0, 1.7, 1, 0, [40,25,80],  
[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]] 
, [0.5, 0.1], 1, 1, "", "", nukepos]; 
_smoke setDropInterval 0.012; 
_Cone setDropInterval 0.02; 
_Wave setDropInterval 0.01; 
 
sleep 150; 
deleteVehicle _Wave; 
deleteVehicle _cone; 
deleteVehicle _smoke; 
deletevehicle nukepos; 
 
[] spawn { 
 if(mdh_nuke_removecorrection > 0) then { 
 sleep 25; 
 "colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]]; 
 "colorCorrections" ppEffectCommit 0; 
 "filmGrain" ppEffectEnable false; 
 "filmGrain" ppEffectCommit 0; 
 }; 
}; 
 
if(mdh_nuke_removeash > 0) then { 
 sleep 25; 
 deletevehicle mdh_ash; 
}; 
 
[] spawn { 
 sleep 120; 
 deleteMarkerLocal "nukeMarker"; 
};