/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

/*
	this addAction [ "Sit Down", GTA_fnc_actionChairSit, nil, 10, true, true, "", "player distance _target <= 1.6 && !( _target getVariable [ 'GTA_fnc_actionChairSit_busy', false ] )" ];
*/

private [ "_chair", "_unit", "_pos" ];
_chair = _this select 0;
_unit = _this select 1;

//--- Global chair
GTA_actions_actionChairStand_chair = _chair;

//--- Mark chair as busy
_chair setVariable [ "GTA_fnc_actionChairSit_busy", true, true ];

//--- Sit
[ [ _unit, "HubSittingChairA_idle1" ], "switchMove" ] call GTA_fnc_remoteExec;

//--- Get sit position
_pos = getPos _chair;
_pos set [ 2, ( _pos select 2 ) + 1 ];
_pos = [ _pos, 0.09, 180 ] call BIS_fnc_relPos;

//--- Set sit position
_unit setDir ( getDir _chair ) + 180;
_unit setPos _pos;

//--- Stand up action
GTA_actions_actionChairStand = _unit addAction [ "Stand Up", GTA_fnc_actionChairStand, nil, 10, false, true, "", "" ];
