_onScreenTime = 8;
 
sleep 5; //Wait in seconds before the credits start after player is in-game

_role1 = "theMUDhost Altis Life"; //In yellow
_role1names = ["http://themudhost.enjin.com/"]; //In white

_role2 = "If You're New";
_role2names = ["Checkout the Rules on our Forums!"]; 

_role3 = "Forums";
_role3names = ["http://themudhost.enjin.com/forum"];

_role4= "Server Updated Regularly!";
_role4names = ["Be sure to check the thread!"];

_role5 = "Join Our Teamspeak";
_role5names = ["IP: ts.themudhost.net"];

_role6 = "Please Report";
_role6names = ["Any in-game issues, bugs, or problems on the forums!"];

_role7 = "Thanks for playing with us!";
_role7names = ["Have fun and enjoy your stay :D"];
 
{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='.75' color='#ff0000' align='left'>%1<br /></t>", _memberFunction]; //Changes colours
	_finalText = _finalText + "<t size='0.65' color='#ffffff' align='left'>";
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
[_role7, _role7names]
];