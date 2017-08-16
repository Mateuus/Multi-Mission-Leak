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

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\armalife.jpg' /></t><br /><br />";
_message = _message + "Herzlich Willkommen bei der Panthera Community<br /><br />";
_message = _message + "Neue Features:<br /><br />";
_message = _message + "Brandneue Sounds und Items wie Schaufel und Axt<br />";
_message = _message + "Neue Farmitems und mehrfach Verarbeitung<br />";
_message = _message + "Faire Preise und anfängerfreundliche Farmrouten<br />";
_message = _message + "Amerikanische Polizei und EMS<br />";
_message = _message + "Serverregeln aktualisiert<br />";
_message = _message + "Unendliche Tool Kits<br />";
_message = _message + "Blackfish<br />";
_message = _message + "Anfängerfreundliche Safezones<br />";
_message = _message + "Neues Z Menü<br />";
_message = _message + "TeamSpeak 3 address: coming soon  <br /><br />";


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
