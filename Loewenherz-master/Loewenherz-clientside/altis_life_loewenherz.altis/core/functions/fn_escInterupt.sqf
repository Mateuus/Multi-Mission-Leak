/*
    Author: Blackd0g
    File: fn_escInterrupt.sqf

    Description:
    Esc menu override

    Parameters:
    None

    Returns:
    Nothing
*/
disableSerialization;

_display = (findDisplay 49);

_backgroundTitle = _display displayCtrl 1050;
_backgroundTitle ctrlSetBackgroundColor [1,0,0,1];

_abortButton = _display displayCtrl 104;
_abortButton buttonSetAction "";
_abortButton ctrlSetText localize "STR_NOTF_AbortESC";
_abortButton buttonSetAction "[] spawn { [] spawn lhm_fnc_clientDisconnect;};";


_title = _display displayCtrl 523;
_title ctrlSetText "Loewenherz";

_saveButton = _display displayCtrl 103;
_saveButton ctrlSetText "Website::TS::Forum";
_saveButton buttonSetAction "
[] spawn {
	closeDialog 0;
	(findDisplay 49) closeDisplay 0;
	closeDialog 0;
	[
		parseText ""
			<br/>
			<t>Direktlink zur Website:</t><br/>
			<a color='#D0E354' href='http://www.loewenherz-projekt.de'>Website</a><br/><br/>
			<t>Direktlink zum Forum:</t><br/>
			<a color='#D0E354' href='http://www.loewenherz-projekt.de/smf/'>Forum</a><br/><br/>
			<t>Teamspeak 3</t><br/>
			<t>http://www.teamspeak.com/invite/ts.loewenherz-projekt.de/</t><br/>
		"",
		""Weiterleitung"",
		true,
		false
	] spawn bis_fnc_GUImessage;
	};
";

_saveButton ctrlEnable true;

_respawnButton = _display displayCtrl 1010;
_respawnButton ctrlSetText localize "STR_Global_Newlife";
_respawnButton ctrlEnable false;

_fieldManual = _display displayCtrl 122;
_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
_fieldManual ctrlSetText "";

lhm_session_completed = missionNamespace getVariable["lhm_session_completed",false];
lhm_istazed = missionNamespace getVariable["lhm_istazed",false];
lhm_is_arrested = missionNamespace getVariable["lhm_is_arrested",false];

// player is ingame all is fine
if(lhm_session_completed) then {
	_abortButton ctrlEnable false;
	if(playerSide == civilian && (player getVariable["restrained",false] || player getVariable["Escorting",false] || lhm_istazed || lhm_is_arrested == 1 || lhm_is_arrested == 2)) then {
		_abortButton ctrlEnable false;
	} else {
		_timeStamp = time + 30;
		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};

		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
		_abortButton ctrlEnable true;
		_abortButton ctrlSetBackgroundColor [1,0,0,1];

		if((getDammage player >= 0.5)) then {
			_respawnButton ctrlCommit 0;
			_respawnButton ctrlEnable true; //Enable respawn button
		};

	};
} else {
// in case of this the game has not finished the initialization process... player can only abort end exit
		_abortButton ctrlEnable false;
		_timeStamp = time + 10;
		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};

		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
		_abortButton ctrlEnable true;
		_abortButton ctrlSetBackgroundColor [1,0,0,1];
};

waitUntil {isNull (findDisplay 49)};
showChat true;