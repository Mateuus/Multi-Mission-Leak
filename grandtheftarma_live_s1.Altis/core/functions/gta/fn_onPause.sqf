/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

with missionNamespace do {

	if ( !isMultiplayer ) exitWith {};

	disableSerialization;

	[ "Paused." ] call GTA_fnc_log;

	private [ "_display", "_ctrlRespawn", "_ctrlManual", "_ctrlAbort", "_waitTime", "_combatTime", "_timeLeft" ];
	_display = _this select 0;
	_ctrlRespawn = ( _this select 0 ) displayCtrl 1010;
	_ctrlManual = ( _this select 0 ) displayCtrl 122;
	_ctrlAbort = ( _this select 0 ) displayCtrl 104;
	_ctrlTitle = ( _this select 0 ) displayCtrl 1050;

	//--- Store the display in uiNamespace
	uiNamespace setVariable [ "GTA_interruptDisplay", _display ];

	//--- Overwrite abort button
	_ctrlAbort ctrlSetTooltip "Sync player data and abort";
	_ctrlAbort ctrlSetEventHandler [ "ButtonClick", "with missionNamespace do { [] spawn GTA_fnc_abort; }; ( uiNamespace getVariable ""GTA_interruptDisplay"" ) closeDisplay 2; true" ];

	//--- Disable buttons
	_ctrlRespawn ctrlEnable false;
	//_ctrlManual ctrlEnable false;

	//--- Abort timer
	if ( !isNil "GTA_init" && { GTA_init } ) then {

		//--- Disable abort button
		_ctrlAbort ctrlEnable false;

		//--- Timer
		_waitTime = diag_tickTime + 10;
		_combatTime = missionNamespace getVariable "GTA_combat_lastTick";

		//--- Check combat time exists
		if ( !isNil "_combatTime" ) then {

			_combatTime = diag_tickTime - _combatTime;

			//--- Check last combat time
			if ( _combatTime < 20 ) then {

				//--- Add to wait time
				_waitTime = _waitTime + ( 20 - _combatTime );

			};

		};

		while { !isNull _display } do {

			_timeLeft = _waitTime - diag_tickTime;

			//--- Check for timeout
			if ( diag_tickTime < _waitTime ) then {

				//--- Abort countdown
				_ctrlAbort ctrlSetText format [ localize "STR_NOTF_AbortESC", [ _timeLeft, "SS.MS" ] call BIS_fnc_secondsToString ];

			} else {

				//--- Abort available
				_ctrlAbort ctrlSetText localize "STR_DISP_INT_ABORT";
				_ctrlAbort ctrlEnable true;

			};

			//--- Check if respawn should be available
			_ctrlRespawn ctrlEnable !( player getVariable [ "restrained", false ]
			&& player getVariable [ "escorting", false ]
			&& player getVariable [ "transporting", false ]
			|| !isNil "life_is_gta_arrested" && { life_is_gta_arrested }
			|| player getVariable ["tased", false] );

			sleep 0.01;

		};

	};

};

true
