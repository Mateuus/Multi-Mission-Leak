/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_building", "_uid", "_door", "_time"];
_building = [_this, 0, objNull, [objNull]] call GTA_fnc_param;

//--- Error checks
if (life_inv_boltcutter <= 0) exitWith {};
if(isNull _building) exitWith {};
if !(_building isKindOf "House_F") exitWith {hint "You are not looking at a house door."};

if (isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0};

//--- House
_uid = (_building getVariable "house_owner") select 0;

if (isNil "_uid") exitWith {};
if !([_uid] call life_fnc_isUIDActive) exitWith {hint "You can't break in to this persons house because he's not online."};

[[[0, 1, 2], ["STR_GTA_ACTIONS_BREAKINHOUSE", [ASLtoAGL getPosASL _building] call GTA_fnc_nearestTown], ["Alert", "#ff0000"]], "GTA_fnc_broadcast", [_uid] call GTA_fnc_unitByUID] call GTA_fnc_remoteExec;

//--- Retrive the nearest door
_door = [_building] call GTA_fnc_nearestDoor;

if (_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //--- Not near a door to be broken into.
if ((_building getVariable [format ["bis_disabled_Door_%1", _door], 0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

//--- Action time
private _lockQuality = _building getVariable ["lock_quality", 0];
private _actionTime = 480 + (60 * _lockQuality);

//--- Action
if ([_actionTime, "Breaking Lock"] call GTA_fnc_action) then {
	//--- Unlock the door
	_building setVariable[format ["BIS_disabled_door_%1", _door], 0, true];

	//--- Unlock building storage
	if (_building getVariable ["locked", false]) then {
		_building setVariable ["locked", false, true];
	};

	//--- Wanted
	[[getPlayerUID player, profileName, "459"], "life_fnc_wantedAdd", false] call GTA_fnc_remoteExec;

	//--- Bolt cutter uses
	life_boltcutter_uses = life_boltcutter_uses + 1;

	if (life_boltcutter_uses >= 3) then {
		[false, "boltcutter", 1] call life_fnc_handleInv;
		life_boltcutter_uses = 0;
	};
};
