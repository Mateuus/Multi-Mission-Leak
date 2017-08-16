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

//--- Message Start Here
//--Welcome Text
    _message = "";
	_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\irmissionimg.jpg' /></t><br />";
    _message = _message + "<br /><br />";
	_message = _message + format [ localize "STR_WELCOME_PARA1" ];
	_message = _message + "<br /><br />";

//--OUR UNIQUE FEATURES 
    _message = _message + format [ localize "STR_WELCOME_PARA3_TITLE" ];

    _message = _message + "<br />";
//--Unique levelling system
    _message = _message + " " + localize "STR_WELCOME_PARA3_LIST1" + "<br />";
//--Perk system based on your level
    _message = _message + " " + localize "STR_WELCOME_PARA3_LIST2" + "<br />";
//--Vote Day / Night
	_message = _message + " " + localize "STR_WELCOME_PARA3_LIST3" + "<br />";
//--Robbable gas stations
	_message = _message + " " + localize "STR_WELCOME_PARA3_LIST4" + "<br />";
//--New jobs
	_message = _message + " " + localize "STR_WELCOME_PARA3_LIST5" + "<br />";
//--Treasure hunting
	_message = _message + " " + localize "STR_WELCOME_PARA3_LIST6" + "<br />";
//--Custom gang bases for the biggest gangs
	_message = _message + " " + localize "STR_WELCOME_PARA3_LIST7" + "<br />";
//--Anti-cheat and script protection
	_message = _message + " " + localize "STR_WELCOME_PARA3_LIST8" + "<br />";

//--And much More
    _message = _message + "<br />";
	_message = _message + format [ localize "STR_WELCOME_PARA3" ];
	_message = _message + "<br /><br />";
//--Get INVOLVED
    _message = _message + format [ localize "STR_WELCOME_PARA4_TITLE" ];
    _message = _message + "<br /><br />";

//--Teamspeak
	_message = _message + " " + format [ localize "STR_WELCOME_PARA4_LIST1" ] + "<br />";
//--Community / Website
_message = _message + "<br /><br />";
	_message = _message + " " + format [ localize "STR_WELCOME_PARA4_LIST2" ] + "<br />";
	_message = _message + "<br />";
//--Message Ends Here


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