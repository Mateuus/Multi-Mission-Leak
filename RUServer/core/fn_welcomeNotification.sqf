/*
    File: fn_welcomeNotification.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called upon first spawn selection and welcomes our player.
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
_buttonSpoiler = _display displayCtrl 2400;
_textSpoiler = _display displayCtrl 1101;
_text2 = _display displayCtrl 1102;

/*
_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\armalife.jpg' /></t><br /><br />";
//_message = _message + "Useful links (click on the links to open your browser)<br /><br />";
//_message = _message + " <a href='https://github.com/AsYetUntitled/Framework' color='#56BDD6'>AsYetUntitled</a> -- The official repository for the project.<br /><br />";
_message = _message + "Herzlich Willkommen auf unserem Tanoa Life Server.<br /><br />
Wir sind derzeit noch im Aufbau des Servers bitte respektiert dies.<br /><br />
Desweiteren freuen wir uns auf Feedbacks (Positiv und Negativ) und auch Verbeserungsvorschläge sind Herzlichst Willkommen.<br /><br />
Unsere Admin-Crew wünscht ihnen einen schönen Aufenthalt auf Tanoa.  <br /><br />";
_message = _message + "TeamSpeak 3 addresse: phoenix-sqaud.de  <br /><br />";
_message = _message + "Website: <a href='http://phoenix-squad.de/index.php' color='#56BDD6'>Phoenix Squad</a>  <br /><br />";
*/

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\armalife.jpg' /></t><br /><br />";
//_message = _message + "Useful links (click on the links to open your browser)<br /><br />";
//_message = _message + " <a href='https://github.com/AsYetUntitled/Framework' color='#56BDD6'>AsYetUntitled</a> -- The official repository for the project.<br /><br />";
_message = _message + "Herzlich Willkommen auf unserem Tanoa Life Server.<br /><br />
Wir heißen euch Herzlich Willkommen auf unserem Server<br /><br />
Wir wünschen euch viel Spaß beim Spielen.<br /><br />
Phoenix Squad Team<br /><br />";
_message = _message + "TeamSpeak 3 addresse: phoenix-sqaud.de  <br /><br />";
_message = _message + "Website: <a href='http://phoenix-squad.de/index.php' color='#56BDD6'>Phoenix Squad</a>  <br /><br />";

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlCommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
