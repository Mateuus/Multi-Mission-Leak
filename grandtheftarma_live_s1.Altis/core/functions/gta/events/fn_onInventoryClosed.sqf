/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["_unit", "_container"];
if (isNull _container) exitWith {};

//--- Update housing container
if (typeOf _container in ["Box_IND_Grenades_F", "B_supplyCrate_F"]) then {
  //--- Get the associated house
  private _house = _container getVariable ["house", objNull];

  //--- Try again
  if (isNull _house) then {
    _house = [_container] call GTA_fnc_nearestBuilding;;
  };

  //--- Update containers
  [[_house], "TON_fnc_updateHouseContainers", false] call GTA_fnc_remoteExec;
};

//--- Update player inventory
[3] call GTA_fnc_updatePlayerPartial;
