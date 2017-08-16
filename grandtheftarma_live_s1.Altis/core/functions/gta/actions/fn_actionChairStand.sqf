/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_chair" ];
_unit = _this select 0;
_chair = GTA_actions_actionChairStand_chair;

//--- Mark chair as not busy
_chair setVariable [ "GTA_fnc_actionChairSit_busy", false, true ];

//--- Get stand position
_pos = getPos _chair;
_pos = [ _pos, 1.5, 90 ] call BIS_fnc_relPos;

//--- Stand
[ [ _unit, "amovpercmstpsnonwnondnon" ], "switchMove" ] call GTA_fnc_remoteExec;

//--- Set stand position
_unit setPos _pos;

//--- Remove action
_unit removeAction GTA_actions_actionChairStand;

//--- Cleanup
GTA_actions_actionChairStand_chair = nil;
GTA_actions_actionChairStand = nil;
