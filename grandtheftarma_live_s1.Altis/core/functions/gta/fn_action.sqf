/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (GTA_actionLock) exitWith {};
if (vehicle player != player) exitWith {};
GTA_actionLock = true;
GTA_actionInterrupt = false;

private [ "_duration", "_actionText", "_animation", "_condition", "_params", "_animLoop", "_result" ];
params [
  ["_duration", 10, [0]],
  ["_actionText", "", [""]],
  ["_animation", "ainvpknlmstpslaywnondnon_medic", [""]],
  ["_condition", {true}, [{}]],
  ["_params", []]
];

//--- Set variables
GTA_RscDisplayAction_result = nil;
GTA_RscDisplayAction_duration = _duration;
GTA_RscDisplayAction_action = _actionText;
GTA_RscDisplayAction_condition = _condition;
GTA_RscDisplayAction_params = _params;

//--- Create progress layer
findDisplay 46 createDisplay "GTA_RscDisplayAction";

if (_animation != "" && {!underwater player}) then {
  player action ["SwitchWeapon", player, player, 100];
  player playMove "amovpknlmstpsnonwnondnon";
};

//--- Wait for result
waitUntil {!isNil "GTA_RscDisplayAction_result"};

//--- Store result
private _result = GTA_RscDisplayAction_result;

//--- Destroy variables
GTA_RscDisplayAction_result = nil;
GTA_RscDisplayAction_duration = nil;
GTA_RscDisplayAction_action = nil;
GTA_RscDisplayAction_condition = nil;
GTA_RscDisplayAction_params = nil;

//--- Unlock
GTA_actionLock = false;

//--- Return result
_result
