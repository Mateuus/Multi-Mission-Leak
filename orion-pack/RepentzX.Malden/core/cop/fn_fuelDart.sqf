private ["_reload","_fireTime","_miss","_vehicle","_distance","_driver","_targets"];

if (life_dartFired) exitWith {hint "Launcher: Reloading...";};
_reload = 5;
_fireTime = 2;

_miss = false;
_vehicle = cursorTarget;

if (isNull _vehicle) then {_miss = true;};
if ((!(_vehicle isKindOf "Air")) && (!(_vehicle isKindOf "Car")) && (!(_vehicle isKindOf "Ship"))) then {_miss = true;};
if (_vehicle isKindOf "Air") then {_distance = 1100;} else {_distance = 700;};
if (player distance _vehicle > _distance) then {_miss = true;};
if (life_inv_fuelDart < 1) exitWith {hint "You have no rockets in your inventory";};


life_dartFired = true;
[false,"fuelDart",1] call life_fnc_handleInv;
[player,"launcherLock"] remoteexeccall ["say3D",0];

_driver = (crew _vehicle);
if(_driver isEqualTo [])then {
	_miss = true;
} else {
	_driver = (_driver select 0);
};

_targets = allPlayers select {(_x distance player) < 300};

if(_miss)exitWith {
	sleep _fireTime;
	hint "Launcher: Missed target";
	sleep _reload;
	hint "Launcher: Ready to fire";
	life_dartFired = false;
};

sleep _fireTime;

if (!(cursorTarget isEqualTo _vehicle)) exitWith {hint "Your shot missed"; life_dartFired = false;};
if (player distance _vehicle > _distance) exitWith {hint "Your shot missed"; life_dartFired = false;};

[false] remoteExec ["life_fnc_fuelDartPlayer",_driver];
hint "Launcher: Direct Hit";
sleep _reload;
hint "Launcher: Ready to fire";
life_dartFired = false;

[3] call SOCK_fnc_updatePartial;