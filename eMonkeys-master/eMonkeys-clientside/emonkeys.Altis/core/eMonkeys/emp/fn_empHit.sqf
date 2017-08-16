_vehicle = _this select 0;
_engineName = getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name");

playSound3d [MISSION_ROOT + "sounds\wasEMPwarning.ogg", _vehicle, true];
playSound3d [MISSION_ROOT + "sounds\wasEMPwarning.ogg", _vehicle];

uisleep timeUntinFilanEmpExecution;

_vehicle setHit [_engineName, 1.0];