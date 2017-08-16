/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_bank", "_cfg"];
_bank = [_this, 0, "", [""]] call GTA_fnc_param;
_cfg = missionConfigFile >> "GTA_CfgBanks" >> _bank;

//--- Format bank name
format [getText (_cfg >> "name"), [getArray (_cfg >> "location")] call GTA_fnc_nearestTown]
