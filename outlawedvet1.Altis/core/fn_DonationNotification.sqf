/*
	File: welcome.sqf
	Author: RPGforYOU
	Description:
	Creates an intro 
*/
//playSound "Intro";
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
_message = _message + "<t align='center' size='4' shadow='0'><img image='images\outlawed.paa' /><br /></t>";
_message = _message + "<t align='center' size='1' shadow='0'>All donations will be used for keeping our server, website, Teamspeak, etc up and running!<br /><br /><br /></t>";
_message = _message + "<t align='center' size='1' shadow='0'><t color='#FFFF00'><img image='\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\favouritecolumntitle_ca.paa' /></t> Donator Rank 1  - 5 EURO<br /><br /></t>";
_message = _message + "<t align='center' size='1' shadow='0'><img image='textures\playertags\don2.paa' /> Donator Rank 2  - 30 EURO<br /><br /></t>";
_message = _message + "<t align='center' size='1' shadow='0'><img image='textures\playertags\don3.paa' /> Donator Rank 3  - 50 EURO<br /><br /></t>";
_message = _message + "<t align='center' size='1' shadow='0'><img image='textures\playertags\don4.paa' /> Donator Rank 4  - 100 EURO<br /><br /></t>";
_message = _message + "<t align='center' size='1' shadow='0'><img image='textures\playertags\don5.paa' /> Donator Rank 5  - 250 + EURO<br /><br /></t>";
_message = _message + "<t align='center' size='1' shadow='0'>For every 5 Euro donated you will have 1 month status of donator!<br /></t>";
_message = _message + "<t align='center' size='1' shadow='0'>Donations do stack in time, so if you donated 10 euro and you donate 20 euro at a later time you will achieve rank 2!<br /></t>";
_message = _message + "<t align='center' size='1' shadow='0'><a href='http://tinyurl.com/ovdonate' color='#56BDD6'>Donation conditions</a> -- Donating automatically inclines you have read and accepted our conditions!<br /></t>";
 
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