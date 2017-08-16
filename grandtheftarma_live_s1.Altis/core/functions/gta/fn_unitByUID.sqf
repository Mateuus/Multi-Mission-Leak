/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_uid", "_player" ];
_uid = [ _this, 0, "", [""] ] call GTA_fnc_param;
_player = objNull;

{

	if ( getPlayerUID _x == _uid ) exitWith {

		_player = _x;

	};

} foreach ( [] call GTA_fnc_allPlayers );

_player
