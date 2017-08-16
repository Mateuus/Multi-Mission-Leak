/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fires at a chopper to reduce its fuel (So cops can catch crim's in the sky)
*/

private ["_reload","_fireTime","_miss","_vehicle","_distance","_driver","_targets"];

if(DS_dartFired)exitWith{hint "Still reloading launcher";};
_reload = 5;
_fireTime = 3;

_miss = false;
_vehicle = cursorTarget;

if(isNull _vehicle)then{_miss = true;};
if((!(_vehicle isKindOf "Air"))&&(!(_vehicle isKindOf "Car"))&&(!(_vehicle isKindOf "Ship")))then{_miss = true;};
if(_vehicle isKindOf "Air")then{_distance = 600;}else{_distance = 100;};
if((DS_infoArray select 21) > 11)then{_distance = _distance + 200};
if(player distance _vehicle > _distance)then{_miss = true;};
if(DS_item_fuelDart < 1)exitWith{hint "You have no fuel darts in your inventory";};

DS_dartFired = true;
["fuelDart",false,1] call DS_fnc_handleInventory;

_driver = (crew _vehicle);
if(_driver isEqualTo [])then {
	_miss = true;
} else {
	_driver = (_driver select 0);
};

_targets = allPlayers select {(_x distance player) < 300};
[player,"fuelDart",true] remoteExecCall ["DS_fnc_playSounds",_targets];

if(_miss)exitWith {
	sleep _fireTime;
	hint "Your shot missed";
	sleep _reload;
	hint "Launcher cleared to re-fire";
	DS_dartFired = false;
};

sleep _fireTime;

if(!(cursorTarget isEqualTo _vehicle))exitWith{hint "Your shot missed";DS_dartFired = false;};
if(player distance _vehicle > _distance)exitWith{hint "Your shot missed";DS_dartFired = false;};

[false] remoteExec ["DS_fnc_fuelDartPlayer",_driver];
hint "Direct Hit";
sleep _reload;
hint "Launcher cleared to re-fire";
DS_dartFired = false;