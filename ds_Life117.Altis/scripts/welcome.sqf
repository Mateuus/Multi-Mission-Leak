/*
	File: welcomecredits.sqf
	Author: HellsGateGaming.com
	Edit: RenildoMarcio
	Date: 09/05/2014
	Description:
	Creates an intro on the bottom-right hand corner of the screen.

Edits by Huntah.. To put important info in center and less important to left middle.

*/
//Admins//Mods//Award winners
if(DS_pistolsOnly)then
	{
	player say3D "AdminWarning";
	_action = [
		"You have joined our server during a pistols only event. Until the event is over you will only be-able to use pistols",
		"Darkside Event",
		"Play",
		"Play"
	] call BIS_fnc_guiMessage;
	};
if((DS_perkLevel < 5)&&(DS_donorLevel == 5))then{DS_perkLevel = 5};
if((DS_perkLevel < 4)&&(DS_donorLevel == 4))then{DS_perkLevel = 4};
_onScreenTime = 5;

_role1 = "The DarkSide Presents.....";
_role1names = [""];
_role2 = "The Darkside Life";
_role2names = [""];
_role3 = "A RPG Mission created by Huntah for TheDarksideGames";
_role3names = [""];
_role4 = "The server rules can be found on the Map screen";
_role4names = [""];

{
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.99' color='#00BFFF' align='center'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.99' color='#00BFFF' align='center'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.9);
[
_finalText,
[safezoneX + safezoneW - 1.6,0.70], //DEFAULT: 0.8,0.50
[safezoneY + safezoneH - 1.1,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names]
];

sleep 5;

_role1 = "Join our Teamspeak:";
_role1names = [""];
_role2 = "ts.thedarksidegames.com:10004";
_role2names = [""];
_role3 = "Senior Server Admins are....";
_role3names = [""];
_role4 = "Huntah, Mad Maxx, SCORPIOX, Evo and The Governor";
_role4names = [""];
_role5 = "Server Admins/Mods are";
_role5names = [""];
_role6 = "Nuta, Nolegs, Gusbus, Keagan, Memecuisine, Fliqqs, Paul, Mitzaron and Ace";
_role6names = [""];

{
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.80' color='#00BFFF' align='left'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.80' color='#00BFFF' align='left'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.9);
[
_finalText,
[safezoneX + safezoneW - 2.4,0.70], //DEFAULT: 0.8,0.50
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
[_role6, _role6names]
];