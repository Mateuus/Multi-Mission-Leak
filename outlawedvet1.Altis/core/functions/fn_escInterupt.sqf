#include "..\..\script_macros.hpp"
/*
    File: fn_escInterupt.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Monitors when the ESC menu is pulled up and blocks off
    certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
    private["_abortButton","_thread","_syncManager"];
    disableSerialization;

    _syncManager = {
        disableSerialization;
        private["_abortButton","_timeStamp"];
        _abortButton = CONTROL(49,104);
        _timeStamp = time + 7;

        waitUntil {
            _abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
            _abortButton ctrlCommit 0;
            round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
        };

        _abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
        _abortButton ctrlCommit 0;
    };

    _abortButton = CONTROL(49,104);

    if (_this) then {
        _thread = [] spawn _syncManager;
        waitUntil{scriptDone _thread || isNull (findDisplay 49)};
        _abortButton ctrlEnable true;
    };
};

_canUseControls = {
    if (playerSide isEqualTo west) exitWith {true};
    if ((player getVariable ["restrained",false]) || (player getVariable ["Escorting",false]) || (player getVariable ["transporting",false]) || (life_is_arrested) || (life_istazed) || (life_isknocked)) then {false} else {true};
};

for "_i" from 0 to 1 step 0 do {
    waitUntil{!isNull (findDisplay 49)};
	_abortButton = CONTROL(49,104);
	//_abortButton buttonSetAction "[player] remoteExec [""TON_fnc_cleanupRequest"",2];";
	_links = CONTROL(49,1010);
	_fieldManual = CONTROL(49,122);
	_websitebutton = CONTROL(49,103);
	_abortButton ctrlSetText "Disconnect";
	_abortButton ctrlSetEventHandler [
		"ButtonClick",
		"[] spawn life_fnc_exit; (findDisplay 49) closeDisplay 2; true"
	];

	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.

	_websitebutton ctrlSetText "Outlawed-veterans.com";
	_links ctrlSetText "TS & Website";
	_links buttonsetAction " closeDialog 0;
	(findDisplay 49) closeDisplay 0;
	closeDialog 0;
	[] spawn {
			[
				parseText ""
					<br/>
					<t>OUTLAWED-VETERANS</t><br/><t> GAMING COMMUNITY 18+:</t><br/>
					<br/>
					<br/>
					<t>Check out our Website:</t><br/>
					<a color='#ff5a1a' href='http://outlawed-veterans.com/'>Website</a><br/><br/>
					<t>Connect to our Teamspeak Server:</t><br/>
					<a color='#ff5a1a' href='http://tinyurl.com/jk8j2bk'>Direct Connect</a>
					<br/>
					<br/>
					<br/>
					<t>Server rules:</t><br/>
					<a color='#ff5a1a' href='http://goo.gl/eTPp5G'>Server Rules Topic</a>
					<br/>
					<br/>
					<br/>
					<t>Unban application:</t><br/>
					<a color='#ff5a1a' href='http://outlawed-veterans.com/unbanlayout.php'>Unban Application</a><br/><br/>
					<t>Whitelist application:</t><br/>
					<a color='#ff5a1a' href='http://outlawed-veterans.com/appcoplayout.php'>Whitelist application</a><br/><br/>
				"",
				""Outlawed-veterans.com - JOIN US!"",
				true,
				false
			] spawn bis_fnc_GUImessage;
	};
	";
	/*
    _usebleCtrl = call _canUseControls;
    _usebleCtrl spawn _escSync;
	
    if (_usebleCtrl) then {
        _respawnButton ctrlEnable true; //Enable the button.
    };
	*/
	if(life_session_completed) then {
		_abortButton ctrlEnable false;
		_usebleCtrl = call _canUseControls;
		_usebleCtrl spawn _escSync;
	};
	
    waitUntil{isNull (findDisplay 49)};
};
