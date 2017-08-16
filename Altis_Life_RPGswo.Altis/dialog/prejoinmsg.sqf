// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#define welcomeText 3200

10 cutrsc["WelcomeMessage", "PLAIN"];

disableSerialization;

_display = uiNamespace getVariable "WelcomeMessage";
_control = _display displayCtrl welcomeText;

private ["_teamrules", "_teamicon", "_teamcol"];

_timer = 120;
disableUserInput true;
while {true} do
{
	_message = format ["<t shadow=""1"" align=""center"" size=""2.3"" color=""#FF0000"">Willkommen bei<br/><t size=""6"" color=""#800000"">Division Wolf </t><br/><br/>
	Du bist zu schnell nach dem Restart auf den Server gegangen<br/><br/><t align=""left"" size=""1.25"" color=""#00FF00"">
	Bitte warte in Zukunft bis der Server fertig ist mit dem Laden der Mission<br/><br/>
	Dies erkennst du an dem Status Playing / Spielt im Serverbrowser<br/><br/>
	Der Server sperrt sich nach einem Restart kurze Zeit um alles in Ruhe laden zu können.<br/><br/>
	Wenn er diese Zeit nicht bekommt kann es sein das er rumzickt<br/><br/>
	Und genau desswegen sollst du warten bis er fertig ist<br/><br/>
	Als kleine Erinnerung daran musst du nun warten bis der Timer abgelaufen ist<br/><br/><br/><br/>
	<t size=""6"" align=""center"" color=""#800000"">%1</t>
	</t></t>",_timer];

	_control ctrlSetStructuredText (parseText _message);
	if (_timer <= 0) exitWith {};
	_timer = _timer -1;
	sleep 1;
	
};

_control ctrlSetFade 1;
_control ctrlCommit 2;

waitUntil {ctrlCommitted _control};

_control ctrlShow false;
_control ctrlCommit 0;
disableUserInput false;

