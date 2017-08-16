/*
	File: welcomecredits.sqf
	Author: HellsGateGaming.com
	Edit: RenildoMarcio
	Date: 09/05/2014
	Description:
	Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 5;

//createdialog "aktion";

_role1 = "Willkommen bei";
_role1names = ["Secrets of Altis"];
_role2 = "Team SoA";
_role2names = ["G00golplexian", "CPT Matthi", "MOoriiii"];
_role3 = "First-Level-Support";
_role3names = ["Wir bieten im Teamspeak einen direkten Support!"];
_role4 = "Website | TS³";
_role4names = ["www.secretsofaltis.de | ts.secretsofaltis.de"];
_role5 = "Restartzeiten";
_role5names = ["00,04,08,12,16,20 Uhr"];
_role6 = "Wichtige Infos";
_role6names = ["Regeln findet ihr auf unserer Website!"];
_role7 = "Besonderer Dank geht an";
_role7names = ["Tonic, Ragebone und Feindflug!"];
{
sleep 3;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.55' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#CA0A0A' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.9);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50],
[safezoneY + safezoneH - 0.8,0.7],
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names]
];