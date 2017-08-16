/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Override BIS_fnc_MP packet EH
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call GTA_fnc_MPexec};

//--- Server addon init
[] call compileFinal PreprocessFileLineNumbers "\gta_server\init.sqf";

//--- Spawn the new hospitals.
{
  _hs = createVehicle ["Land_Hospital_main_F", [0, 0, 0], [], 0, "NONE"];
  _hs setDir markerDir _x;
  _hs setPosATL getMarkerPos _x;
  _hs allowDamage false;
  _hs enableSimulationGlobal false;

  _var = createVehicle ["Land_Hospital_side1_F", [0, 0, 0], [], 0, "NONE"];
  _var attachTo [_hs, [4.69775, 32.6045, -0.1125]];
  detach _var;
  _var allowDamage false;
  _var enableSimulationGlobal false;

  _var = createVehicle ["Land_Hospital_side2_F", [0, 0, 0], [], 0, "NONE"];
  _var attachTo [_hs, [-28.0336, -10.0317, 0.0889387]];
  detach _var;
  _var allowDamage false;
  _var enableSimulationGlobal false;
} foreach ["hospital_2", "hospital_3"];

//--- Execute time manager
[8, true, 12] call GTA_fnc_timeManager;
