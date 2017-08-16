/*
	File: welcomecredits.sqf
	Author: HellsGateGaming.com
	Edit: RenildoMarcio
	Date: 09/05/2014
	Description: bearbeitet durch Cris(iol)
	
*/

_onScreenTime = 8;

sleep 40; //Wait in seconds before the credits start after player is in-game
 
_role1 = "Head Admin";
_role1names = ["Cris"];
_role2 = "Community Leitung";
_role2names = ["ImCore"];
_role3 = "Teamspeak Admin";
_role3names = ["ImCore"];
_role4 = "Head Support Leitung";
_role4names = ["Tim Taylor"];
_role5 = "Supportleitung";
_role5names = ["Folgt"];
_role6 = "Supporter";
_role6names = ["Rico","Jack Brown","Nick Fury"];
_role7 = "Tester";
_role7names = ["Poul Wayts","Rico"];
_role8 = "Scripting";
_role8names = ["Cris","ImCore","Rexstar9"];
_role9 = "Designe by";
_role9names = ["Island of Liberty"];
_role10 = "Polizei Leitung";
_role10names = ["Sam Wilson"];
_role11 = "Medizinisch Technische Division Geschäftsleitung";
_role11names = ["Tim Taylor"];
_role12 = "Das Island of Liberty Team sucht verstärkung:";
_role12names = ["Projektleiter, Scripter, Designer und Supporter"];
_role13 = "Intresse an einer Stelle";
_role13names = ["Wir suchen MTD Mitarbeiter, Polizisten sowie neue Bewohner von Altis"];
_role14 = "Hast du ein Problem oder ein Bug";
_role14names = ["Unsere Supporträume sind Täglich ab ca: 17:00 bis 23:00 für dich geöffnet"];
_role15 = "Neue Ideen und Anregungen?";
_role15names = ["Schreibt uns ins Forum, oder spricht mit einem von Island of Liberty Team"];
_role16 = "Serverrestart:";
_role16names = ["Täglich 00:00 Uhr, 06:00 Uhr,  12:00,  18:00 Uhr"];

{
sleep 8;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='1.00' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime = 8;
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
3
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
[_role8, _role8names],
[_role9, _role9names],
[_role10, _role10names],
[_role11, _role11names],
[_role12, _role12names],
[_role13, _role13names],
[_role14, _role14names],
[_role15, _role15names],
[_role16, _role16names]
];