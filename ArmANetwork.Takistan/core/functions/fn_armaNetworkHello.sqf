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
_message = _message + "<t align='center' size='8' shadow='0'></t><br /><br />";
_message = _message + "Welcome to <a href='http://arma.network/' color='#5600FF'>Arma.Network</a>, Arma 3 Takistan and British Roleplay!<br /><br />";
_message = _message + "<a href='ts3.evolvedga.me' color='#5600FF'>TS3</a>: ts3.arma.network<br /><br />";
_message = _message + "<t color='#5600FF'>Custom Key 10 (Windows)</t> : Gather + Interaction Menu<br />";
_message = _message + "<t color='#5600FF'>Shift 1</t> : Surrender<br />";
_message = _message + "<t color='#5600FF'>3</t> : Friendly Wave<br />";
_message = _message + "<t color='#5600FF'>U</t> : Lock / Unlock<br />";
_message = _message + "<t color='#5600FF'>Crtl P</t> : Open Basic Radio Settings<br />";
_message = _message + "<t color='#5600FF'>Shift P</t> : Lower Sound<br /><br />";
_message = _message + "This is a serious roleplay server so before you play, please make sure you read our rules at <a href= 'http://arma.network/forums/index.php?/forum/5-rules/' color='#5600FF'>Arma.Network Rules</a> otherwise you will end up banned and we don't want that!<br /><br />";
_message = _message + "- You will not exploit, duplicate, abuse, glitch, hack any mechanism on the server.<br /><br />";
_message = _message + "- You will report any exploitation, abuse, hacking, glitches, errors and/or bugs encountered on the server to the appropriate party.<br /><br />";
_message = _message + "- You understand that failure to report any breach in the rules of the server of another player makes you just as responsible as the offender.<br /><br />";
_message = _message + "- You understand that Arma Network is a serious RP community and that it is just a game where others are trying to have a fun experience and you will contribute to that experience.<br /><br />";
_message = _message + "Keybinds for all sides!<br />";
_message = _message + "Sincerely, <a color='#5600FF'>Arma Network</a><br /><br />";


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