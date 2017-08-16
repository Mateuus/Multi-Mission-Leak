/*
	File: welcomecredits.sqf
	Edit (not Author): Don Richter
	Date: 1/10/2015
	Description:
	Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 8;

sleep 12; //Wait in seconds before the credits start after player is in-game
 
_role1 = "Willkommen auf dem Server von:";
_role1names = ["neighbourhood-life"];
_role2 = "Homepage:";
_role2names = ["neighbourhood-life.enjin.com"];
_role3 = "Teamspeak:";
_role3names = ["46.20.46.76:10111"];
_role4 = "Deine Admins sind:";
_role4names = ["Don Richter","Wancliff","Caine","Niwo","PhiL"];
_role5 = "Entwickler:";
_role5names = ["Don Richter"];
_role6 = "Designer:";
_role6names = ["Lukas"];
_role7 = "Supporter:";
_role7names = ["R. Dussel","H. Moody","Simon","Armin","Sven"];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.55' color='#a6f20b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.9);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names]

];