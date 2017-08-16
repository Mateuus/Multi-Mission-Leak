/*
	File: welcome.sqf
	Author: ZedBuster
	Link: opendayz.net/threads/dayz-welcome-message-credits-style.13071/
*/

_onScreenTime = 7;

_role1 = "WILLKOMMEN AUF HAWAII LIFE RPG";
_role1names = ["Wir wuenschen ihnen viel Spass auf Hawaii."];
_role2 = "EINIGE TIPPS";
_role2names = ["Melde dich beim Einwohnermeldeamt","Du findest in grossen Staedten Checkpoints, diese sind sehr hilfreich."];
_role3 = "HOMEPAGE";
_role3names = ["www.hawaii-life.net"];
_role4 = "TEAMSPEAK";
_role4names = ["ts.hawaii-life.net"];
_role5 = "Ein großes Dankeschoen geht an";
_role6 = "JACOB";
_role6names = ["Er ist unser Designer und sorgt bei jedem für den passenden Lack","Ausserdem hat er den groeßten Teil der Insel entworfen"];
_role5 = "DAS TEAM";
_rolenames = ["ohne euch waere der Server nicht so wie er ist."];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.6' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction]; //Ändert die Farbe und Größe der Überschrift
_finalText = _finalText + "<t size='0.8' color='#FFFFFF' align='right'>"; //Ändert die Farbe und Größe des Textes
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
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
[_role3, _role3names]

];