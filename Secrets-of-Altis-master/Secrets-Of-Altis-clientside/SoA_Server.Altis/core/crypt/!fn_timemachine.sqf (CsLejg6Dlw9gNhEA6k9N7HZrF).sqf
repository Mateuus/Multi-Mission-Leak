private["_locations", "_locationsrandom", "_fire", "_explo"];

hint "Raum-Zeitkontinuum wurde konfiguriert. Fahre nun schneller als 80 km/h!";

_locations = ["timemarker1", "timemarker2", "timemarker3", "timemarker4", "timemarker5", "timemarker6", "timemarker7"];
_locationsrandom = _locations select floor random count _locations;


WaitUntil {(speed vehicle player) > 80 && !life_inTime};
life_inTime = true;
hint "Fluxkompensator aktiviert";
[vehicle player, "timemachinestart"] remoteExecCall ["say3D",0];
sleep 6;

_fire = "#particlesource" createVehicle getPos vehicle player;
_fire setParticleClass "ObjectDestructionFire1Smallx";
_fire attachto [vehicle player,[0,0,0]];
addCamShake [1, 15, 25];
sleep 4;

vehicle player allowdamage false; 
_explo = "SmallSecondary" createVehicle getPos vehicle player; 
_explo attachto [vehicle player,[0,0,0]];
vehicle player setPos (getMarkerPos _locationsrandom);
vehicle player setdir (MarkerDir _locationsrandom); 
vehicle player setVelocity [0,(MarkerDir _locationsrandom),0];
deletevehicle _fire;
sleep 0.1;
_explo = "SmallSecondary" createVehicle getPos vehicle player; 
_explo attachto [vehicle player,[0,0,0]];
[vehicle player, "timemachineend"] remoteExecCall ["say3D",0];
2 cutText ["","BLACK IN",1];
hint "Zeitschleuse geschlossen.";
sleep 0.5;

if(!erfolg_timemachine) then {erfolg_timemachine = true; playsound "erfolg"; hint format ["Erfolg verdient: %1",["erfolg_timemachine"] call life_fnc_varToStr];};

vehicle player allowdamage true;
sleep (10 * 60);
life_inTime = false;