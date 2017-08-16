/*
        File: fn_InfoLinks.sqf
        Author: Maximum
        Description:
        Shows the welcome message.
		main == 512x256
		sign == 256x128
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
//_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\Wolflogo\Tablet\info.paa' /></t><br /><br />";
_message = _message + "Informations Links (Klick auf die Links um dein Browser zu öffnen.)<br /><br />";
_message = _message + " <a href='http://forum.division-wolf.de' color='#56BDD6'>Forum</a><br /><br />";
_message = _message + " <a href='http://forum.division-wolf.de/index.php?thread/12-altis-life-server-regeln/' color='#56BDD6'>Server Regeln</a><br /><br />";
_message = _message + " <a href='http://forum.division-wolf.de/index.php?faq/' color='#56BDD6'>Neu bei uns? Hier findest du Tipps.</a><br /><br />";
_message = _message + " <a href='http://forum.division-wolf.de/ticketsystem/' color='#56BDD6'>Bug gefunden? Melde ihn bitte.</a><br /><br />";
_message = _message + " <a href='http://forum.division-wolf.de/index.php?board/20-polizei/' color='#56BDD6'>Bewerbung Polizei</a><br /><br />";
_message = _message + " <a href='http://forum.division-wolf.de/index.php?board/21-feuerwehr/' color='#56BDD6'>Bewerbung Feuerwehr</a><br /><br />";
//_message = _message + " <a href='http://forum.division-wolf.de/viewforum.php?f=36' color='#56BDD6'>Bewerbung Sicherheitsdienst</a><br /><br />";

 
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