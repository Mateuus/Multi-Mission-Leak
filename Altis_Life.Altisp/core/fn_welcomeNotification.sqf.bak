/*
	File: fn_welcomeNotification.sqf
	Author:

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
_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\logo.jpg' /></t><br /><br />";
_message = _message + "WWW:<br />";
_message = _message + " <a href='http://aln.ct8.pl/' color='#56BDD6'>Niespodzianki wersja 1.21</a> - Nasze Forum.<br />";
_message = _message + "Adres Teamspeak'a: stabilne.it<br /><br />";
_message = _message + "Zmiany:Textury, nowa frakcja ochrony, nowe leki, tablet,  <br />";
_message = _message + "Zakaz powrotów na akcję po śmierci :)<br />";
_message = _message + "Wszelki skargi nie zgłaszamy na ts, steam tylko na forum<br />";
_message = _message + "- W sprawach rekrutacji zapraszamy na forum<br />";

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
