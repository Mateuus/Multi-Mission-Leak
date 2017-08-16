_onScreenTime = 4;
 
_role1 = "Willkommen auf";
_role1names = ["Eisenschmiede"];
_role2 = "Webseite";
_role2names = ["www.Eisenschmiede-Gaming.de"];
_role3 = "Teamspeak";
_role3names = ["ts.Eisenschmiede-Gaming.de"];
_role4 = "Mods nutzbar:";
_role4names = ["JSRS3: DragonFyre APEX","Blastcore: Phoenix"];
_role5 = "Eisenschmiede We Love RPG";
_role5names = ["wünscht euch viel Spass beim Gaming"];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.55' color='#ff9900' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
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
[_role5, _role5names]
];