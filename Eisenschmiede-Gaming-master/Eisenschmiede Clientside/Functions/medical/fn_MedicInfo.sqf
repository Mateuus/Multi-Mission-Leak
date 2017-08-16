
_onScreenTime = 15;
 
_role1 = "Warte auf die Feuerwehr";
_role1names = ["Das erhöht deine Chance reanimiert zu werden!"];
_role2 = "Warte auf die Feuerwehr";
_role2names = ["Die Feuerwehr sieht, dass du tot bist und eilen bereits zu dir um dir zu helfen"];


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
[_role2, _role2names]
];