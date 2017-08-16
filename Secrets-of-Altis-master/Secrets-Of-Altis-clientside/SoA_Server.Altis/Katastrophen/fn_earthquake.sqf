/*-----------------------------------------------------------------------------

       Author: G00golplexian
       Name: fn_earthquake.sqf
       Description: Makes an Earthquake, yeah!

------------------------------------------------------------------------------*/

private["_random","_damage"];

if!(IsNull objectParent player) then {playsound "erdbebenwarnung";};

sleep 60;

lautsprecher_1 say3d "warnung";
lautsprecher_2 say3d "warnung";
lautsprecher_3 say3d "warnung";
lautsprecher_4 say3d "warnung";

sleep 10;

_random = _this select 0;
_damage = damage player;

[_random] spawn BIS_fnc_earthQuake;

if(vehicle player iskindOf "Air" OR vehicle player iskindOf "Ship" OR underwater player) exitWith {};

switch(_random) do {
case 0: {
	_damage = _damage + 0.10;
		if!(isNull objectParent player) then {
			(vehicle player) setHitPointDamage ["HitLFWheel", 0.2];   
			(vehicle player) setHitPointDamage ["HitRFWheel", 0.1];   
			(vehicle player) setHitPointDamage ["HitLF2Wheel", 0.2];
			(vehicle player) setHitPointDamage ["HitRF2Wheel", 0.1];
		};
	};
case 1: {
	_damage = _damage + 0.15;
		if!(isNull objectParent player) then {
			(vehicle player) setHitPointDamage ["HitLFWheel", 0.1];   
			(vehicle player) setHitPointDamage ["HitRFWheel", 0.3];   
			(vehicle player) setHitPointDamage ["HitLF2Wheel", 0.2];
			(vehicle player) setHitPointDamage ["HitRF2Wheel", 0.2];
		};
	};
case 2: {
	_damage = _damage + 0.20;
		if!(isNull objectParent player) then {
			(vehicle player) setHitPointDamage ["HitLFWheel", 0.2];
			(vehicle player) setHitPointDamage ["HitRFWheel", 0.3];
			(vehicle player) setHitPointDamage ["HitLF2Wheel", 0.4];
			(vehicle player) setHitPointDamage ["HitRF2Wheel", 0.2];
		};
	};
case 3: {
	_damage = _damage + 0.25;
		if!(isNull objectParent player) then {
			(vehicle player) setHitPointDamage ["HitLFWheel", 0.5];   
			(vehicle player) setHitPointDamage ["HitRFWheel", 0.3];   
			(vehicle player) setHitPointDamage ["HitLF2Wheel", 0.5];
			(vehicle player) setHitPointDamage ["HitRF2Wheel", 0.9];
		};
	};
case 4: {
	_damage = _damage + 0.30;
		if!(isNull objectParent player) then {
			(vehicle player) setHitPointDamage ["HitLFWheel", 1];
			(vehicle player) setHitPointDamage ["HitRFWheel", 0.9];
			(vehicle player) setHitPointDamage ["HitLF2Wheel", 0.7];
			(vehicle player) setHitPointDamage ["HitRF2Wheel", 0.8];
		};
	};
default {};
};

if(animationstate player != "amovppnemstpsnonwnondnon") then {player setdamage _damage;};

sleep 10;
[0] spawn BIS_fnc_earthQuake;