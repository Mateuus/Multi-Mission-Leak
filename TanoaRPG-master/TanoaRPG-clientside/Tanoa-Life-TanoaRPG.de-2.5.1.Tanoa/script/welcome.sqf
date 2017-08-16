/*
	File: welcome.sqf
	Author: TheTotenkopf
	Date: 26.6.2014
*/
private["_memberFunction"];

//Start erst nach Spawn
waitUntil{ !isNull(findDisplay 38500)};
waitUntil{ isNull(findDisplay 38500)};

//Sound
playSound "welcome";

_onScreenTime = 2;

_role1 = "Willkommen bei";
_role1names = ["TanoaRPG.de"];
_role2 = "Willkommen bei";
_role2names = ["TanoaRPG.de"];
_role3 = "Regelwerk und weitere Infos unter";
_role3names = ["tanoarpg.de"];
_role4 = "Achtung!";
_role4names = ["Wir bannen auch bei schlechtem RP"];
_role5 = "Ohrstöpsel";
_role5names = ["Taste = Ende"];
_role6 = "Aktionstaste";
_role6names = ["Taste = Windows"];
_role7 = "TeamSpeak";
_role7names = ["ts.tanoarpg.de"];
_role8 = "Server Restarts";
_role8names = ["0:00,8:00,12:00,16:00,20:00"];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.50' color='#D72020' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
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
[_role7, _role7names],
[_role8, _role8names]
];