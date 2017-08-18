/*
	File: fn_welcome.sqf
	Author: Maximum
	
	Description:
	Shows the welcome message.
*/
disableSerialization;
[
	"",
	0,
	0.2,
	10,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\intro.paa' /></t><br /><br />";
_message = _message + "Welcome to <a href='http://www.Origin-Entertainment.com' color='#5600FF'>Origin-Entertainment.com</a>, the genesis of master roleplay!<br /><br />";
_message = _message + "This is a serious roleplay server so before you spawn in please make sure you read our rules at <a href= 'http://origin-entertainment.com' color='#5600FF'>Origin Life Rules</a> otherwise you will end up banned and we don't want that!<br /><br />";
_message = _message + "Origin Entertainment is running a 2 country system; <t color='#5600FF'>United States</t> and <t color='#5600FF'>Canada</t>. We hope you enjoy our server and if you have any issues or concerns then please feel free to join our teamspeak!<br /><br />";
_message = _message + "<a href='http://www.Origin-Entertainment.com' color='#5600FF'>Website</a>: Origin-Entertainement.com<br />";
_message = _message + "<a href='http://www.Origin-Entertainment.com' color='#5600FF'>TS3</a>: ts.origin-entertainment.com<br /><br />";
_message = _message + "Keybinds for all sides!<br />";
_message = _message + "<t color='#5600FF'>Custom Key 10</t> : Gather + Interaction Menu<br />";
_message = _message + "<t color='#5600FF'>Tab</t> : Surrender<br />";
_message = _message + "<t color='#5600FF'>U</t> : Lock / Unlock<br />";
_message = _message + "<t color='#5600FF'>Q, E, W</t> : Left, Right, Warning Vehicle Signals<br />";
_message = _message + "<t color='#5600FF'>1</t> : Persistent Wanted Menu<br />";
_message = _message + "<t color='#5600FF'>2</t> : Persistent Smartphone<br />";
_message = _message + "<t color='#5600FF'>3</t> : Dynamic Market<br />";
_message = _message + "<t color='#5600FF'>Shift 4-8</t> : Custom Animation<br />";
_message = _message + "<t color='#5600FF'>Left Ctrl + R</t> : Magazine Repack<br /><br />";
_message = _message + "Sincerely,<br /><br />";
_message = _message + "<t size='3' shadow='0'><img image='textures\kai.paa' /></t>";

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlcommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;