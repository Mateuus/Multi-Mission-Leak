/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (isNil "GTA_player_received" || {!GTA_player_received}) exitWith {};

//--- Overrides
params [
  ["_force", false, [true]],
  ["_money", GTA_money_cash, [0]],
  ["_bank", GTA_money_bank, [0]],
  ["_gear", [player, true] call GTA_fnc_saveInventory, [[]]],
  ["_arrested", life_is_gta_arrested, [true]]
];

if (!_force && {!isNil "GTA_disablePlayerUpdates"} && {GTA_disablePlayerUpdates}) exitWith {};

private _params = [];

//--- Money
_params pushBack _money;

//--- Bank
_params pushBack _bank;

//--- TODO: Licenses
private ["_licenses", "_licenseType"];
_licenses = [];
_licenseType = switch playerSide do { case west: { "cop" }; case civilian: { "civ" }; case independent: { "med" }; };

{
  if (_x select 1 == _licenseType) then {
    _licenses pushBack [_x select 0, missionNamespace getVariable (_x select 0)];
  };
} foreach life_licenses;

_params pushBack _licenses;

//--- Side specific
switch playerSide do {
	case civilian: {
		//--- Gear
		_params pushBack _gear;

		//--- Arrested
		_params pushBack _arrested;
	};
};

//--- Send update request to server
[[getPlayerUID player, profileName, playerSide, _params], "GTA_db_fnc_updatePlayer", false] call GTA_fnc_remoteExec;
