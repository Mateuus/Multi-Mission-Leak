/*
	File: welcome.sqf
	Author: Unknown, Blackd0g

	Description:
	Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 20;

sleep 60; //Wait in seconds before the credits start after player is in-game
waitUntil {spawningCam};
If (!alive player) exitWith {};

_role1 = "Willkommen Bürger auf";
_role1names = ["www.LoewenherZ-Projekt.de !"];
_role2 = "Unser Teamspeak 3";
_role2names = ["ts.loewenherz-projekt.de:9988 PW: blah"];
_role3 = "Wichtig !!!";
_role3names = ["Drück M und lies Dir die Regeln durch! Und wenn du Lust hast, dann check mal die Paintball Arena bzw. das Casino aus!"];
_role4 = "SafeZones";
_role4names = ["ACHTUNG: In der Nähe von SafeZones ist Töten, Ausrauben, Stehlen usw. nicht erlaubt. SaveZones sind Car/Truck/Airshop, Garagen, GunStore, Police Station, Rebell Outpost und DonatorShop!"];
_role5 = "Housing";
_role5names = ["Miete Dir ein Haus mit einer 'Homeowner Licence'. Features: Einlagerung von Gegenständen bzw. Inventarsystem, spawnen am Haus und eine Garage für Fahrzeuge. Für mehr Infos drück M bzw. frag einen anderen Bürger, Medic oder Polizist."];
_role6 = "Changelog";
_role6names = ["Infos zu den neusten Updates findest Du auf www.loewenherz-projekt.de in unserem Forum! Dort kannst Du Dich auch als Polizist bzw. Arzt bewerben und vieles mehr."];
_role7 = "Donator Info";
_role7names = ["Donator, sogenannte Ehrenbürger, haben neben dem Donatorshop einen erhöhten Paycheck. Mehr Infos zu diesem System findest du im Teamspeak3."];
_role8 = "Roleplay";
_role8names = ["Dies ist ein RPG-Server. Willkürlich auf Spieler zu schiessen, RANDOM-DEATHMATCHING, ist nicht erwünscht. Überfahren, sogenanntes VDM, auch nicht!"];
_role9 = "Viel Spaß";
_role9names = ["wünschen Dir Leo, Blackd0g, TREiBER, Joker und Team. Wenn du Hilfe benötigst, findest du im TS3 Admins, Moderatoren und Helper!"];
 
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.45' color='#FF0000' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.50' color='#FFFFFF' align='right'>";
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
If (!alive player) exitWith {};
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
[_role9, _role9names]


];