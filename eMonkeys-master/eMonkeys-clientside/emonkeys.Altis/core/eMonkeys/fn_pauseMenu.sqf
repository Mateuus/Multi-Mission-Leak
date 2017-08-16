disableSerialization;
_display = (findDisplay 49);

_background = _display displayCtrl 1050;
_background ctrlSetBackgroundColor [0.522,0.784,0.035,1];

_toGameButton = _display displayCtrl 2;
_respawnButton = _display displayCtrl 1010;
_fieldManual = _display displayCtrl 122;
_saveButton = _display displayCtrl 103;
_settingsButton = _display displayCtrl 101;
_abortButton = _display displayCtrl 104;
_respawnButton ctrlEnable false;
_saveButton ctrlEnable false;

_toGameButton ctrlSetStructuredText parseText "<t color='#FFFFFF'>Fortfahren</t>";
_saveButton ctrlSetStructuredText parseText "<t color='#FFFFFF'>Electronic Monkeys</t>";
_respawnButton ctrlSetStructuredText parseText "<t color='#FFFFFF'>eine affenstarke Community!</t>";
_settingsButton ctrlSetStructuredText parseText "<t color='#FFFFFF'>Einstellungen</t>";
_fieldManual ctrlSetStructuredText parseText "<t color='#FFFFFF'>Informationen</t>";
_abortButton ctrlSetStructuredText parseText "<t color='#FFFFFF'>Verlassen</t>";
_abortButton buttonSetAction "";

_fieldManual buttonSetAction 
"
	[] spawn 
	{
		closeDialog 0;
		(findDisplay 49) closeDisplay 0;
		closeDialog 0;
		[
			parseText ""
				<br/>
				<t>Direktlink zur Website:</t><br/>
				<a color='#85c809' href='http://e-monkeys.com'>zur Website</a><br/><br/>
				<t>Direktlink zum Forum:</t><br/>
				<a color='#85c809' href='http://e-monkeys.com/forum'>zum Forum</a><br/><br/>
				<t>Direktlink zum Teamspeak 3</t><br/>
				<a color='#85c809' href='http://invite.teamspeak.com/ts.e-monkeys.com'>Teamspeak 3</a><br/>
			"",
			""Informationen"",
			true,
			false
		] spawn bis_fnc_GUImessage;
	};
";

eM_session_completed = missionNamespace getVariable["eM_session_completed",false];
eM_istazed = missionNamespace getVariable["eM_istazed",false];

if(side player in [civilian,east] && (player getVariable["restrained",false] || player getVariable["Escorting",false] || player getVariable["restrainedciv",false] || player getVariable["Escortingciv",false] || eM_istazed)) then 
{
	_abortButton ctrlEnable false;
	_abortButton buttonSetAction "";
} 
	else 
{
	_time = diag_tickTime + 10;
	waitUntil 
	{
		_abortButton ctrlSetText format["Verlassen möglich in %1",[(_time - diag_tickTime),"SS.MS"] call BIS_fnc_secondsToString];
		_abortButton buttonSetAction "";
		_abortButton ctrlEnable false;
		_abortButton ctrlCommit 0;
		round(_time - diag_tickTime) <= 0 || isNull (findDisplay 49)
	};

	_abortButton ctrlSetStructuredText parseText "<t color='#FFFFFF'>Verlassen</t>";
	_abortButton ctrlSetEventHandler [ "ButtonClick", "[] call SOCK_fnc_syncData2; [] spawn Emonkeys_fnc_logoutCam; (findDisplay 49) closeDisplay 2; true" ];
	_abortButton ctrlCommit 0;
	_abortButton ctrlEnable true;
};

waitUntil {isNull (findDisplay 49)};
showChat true;