/*
	File: welcomecredits.sqf
	Author: HellsGateGaming.com
	Edit: dica
	Date: 09/05/2014
	Description:
	Creates an intro on the bottom-right hand corner of the screen. złodziej lester :)
*/

_onScreenTime = 7;

sleep 15; //Wait in seconds before the credits start after player is in-game

_role1 = "Witaj na nowej wersji";
_role1names = ["NIESPODZIANEK"];
_role2 = "Admini:";
_role2names = ["Acid, Daktyl "];
_role3 = "Pamiętaj o RP!";
_role3names = ["A napewno bedziesz dobrze sie bawił!"];
_role4 = "TeamSpeak3:";
_role4names = ["stabilne.it"];
_role5 = "Discord";
_role5names = ["www.goo.gl/rWBD8B"];
_role6 = "Restarty serwera(czas na pasku może być różny od rzeczywistego)";
_role6names = ["00:00, 06:00, 12:00, 18:00"];
_role7 = "Wersja 1.2.1!";
_role7names = ["!!!!!!"];
_role8 = "Zespół ALN życzy miłej gry!";
_role8names = ["Wszelki skargi nie zgłaszamy na ts, steam tylko na forum!"];


{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.55' color='#00FFFF' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.80' color='#FFFFFF' align='right'>";
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
[_role7, _role7names],
[_role8, _role8names]
];
