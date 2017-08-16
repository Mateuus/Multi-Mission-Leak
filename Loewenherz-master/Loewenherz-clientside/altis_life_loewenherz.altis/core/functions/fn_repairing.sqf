/*
	File: fn_repairing.sqf
	Author: Blackd0g
	
	Description:

HitEngine (engine #1)
HitEngine2 (engine #2)
HitEngine3 (engine #3)
HitHRotor (main rotor)
HitVRotor (tail rotor)
HitBatteries (electrical systems)
HitLight (landing light)
HitHydraulics (entire hydraulics system)
HitTransmission (engine transmission)
HitGear (landing gear)
HitFuel (all fuel tanks)
HitHStabilizerL1 (first left horizontal stabilizer)
HitHStabilizerR1 (first right horizontal stabilizer)
HitVStabilizer1 (first vertical stabilizer)
HitTail (tail boom)
HitPitotTube (all pitot tubes)
HitStaticPort (all static ports)
HitStarter1 (starter for engine #1)
HitStarter2 (starter for engine #2)
HitStarter3 (starter for engine #3)
HitAvionics
HitHull
HitMissiles
HitRGlass
HitLGlass
HitGlass1
HitGlass2
HitGlass3
HitGlass4
HitGlass5
HitGlass6
*/
private["_vehicle"];
_veh = param [0,ObjNull,[ObjNull]];
if(isNull _veh) exitWith {}; //Bad vehicle type
_damage = 0.9;

// Land Vehicles //
if (_veh isKindOf "LandVehicle") then {
// Body / Hull
//if ((_veh getHitPointDamage "HitBody") > _damage) then {_veh setHitPointDamage ["HitBody", 0.9]};
// Engine
if ((_veh getHitPointDamage "HitEngine") > _damage) then {_veh setHitPointDamage ["HitEngine", 0.89]};
// Fuel Tank
//if ((_veh getHitPointDamage "HitFuel") > _damage) then {_veh setHitPointDamage ["HitFuel", 0.9]};
// Front left wheel
if ((_veh getHitPointDamage "HitLFWheel") > _damage) then {_veh setHitPointDamage ["HitLFWheel", 0.6]};
// Front right wheel
if ((_veh getHitPointDamage "HitRFWheel") > _damage) then {_veh setHitPointDamage ["HitRFWheel", 0.6]};
// Front left wheel 2
if ((_veh getHitPointDamage "HitLF2Wheel") > _damage) then {_veh setHitPointDamage ["HitLF2Wheel", 0.6]};
// Front right wheel 2
if ((_veh getHitPointDamage "HitRF2Wheel") > _damage) then {_veh setHitPointDamage ["HitRF2Wheel", 0.6]};
// Middle left wheel
if ((_veh getHitPointDamage "HitLMWheel") > _damage) then {_veh setHitPointDamage ["HitLMWheel", 0.6]};
// Middle right wheel
if ((_veh getHitPointDamage "HitRMWheel") > _damage) then {_veh setHitPointDamage ["HitRMWheel", 0.6]};
// Back left wheel
if ((_veh getHitPointDamage "HitLBWheel") > _damage) then {_veh setHitPointDamage ["HitLBWheel", 0.6]};
// Back right wheel
if ((_veh getHitPointDamage "HitRBWheel") > _damage) then {_veh setHitPointDamage ["HitRBWheel", 0.6]};

};

// Air Vehicles //
if (_veh isKindOf "Air") then {
// Engine
if ((_veh getHitPointDamage "HitEngine") > _damage) then {_veh setHitPointDamage ["HitEngine", 0.89]};
// Engine2
if ((_veh getHitPointDamage "HitEngine2") > _damage) then {_veh setHitPointDamage ["HitEngine2", 0.89]};
// Engine3
if ((_veh getHitPointDamage "HitEngine3") > _damage) then {_veh setHitPointDamage ["HitEngine3", 0.89]};
// Motor horizontal
if ((_veh getHitPointDamage "HitHRotor") > _damage) then {_veh setHitPointDamage ["HitHRotor", 0.6]};
// Engine vertical
if ((_veh getHitPointDamage "HitVRotor") > _damage) then {_veh setHitPointDamage ["HitVRotor", 0.6]};
// Hydraulics
if ((_veh getHitPointDamage "HitHydraulics") > _damage) then {_veh setHitPointDamage ["HitHydraulics", 0.7]};
// Transmission
if ((_veh getHitPointDamage "HitTransmission") > _damage) then {_veh setHitPointDamage ["HitTransmission", 0.7]};
// Tail
if ((_veh getHitPointDamage "HitTail") > _damage) then {_veh setHitPointDamage ["HitTail", 0.6]};

};