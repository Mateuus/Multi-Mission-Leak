//	FILENAME: server_WelcomeCredits.sqf
//	=====
//	SCRIPT NAME: Server Intro Credits Script by IT07
//	SCRIPT VERSION: v1.3.7 BETA
//	Credits for original script: Bohemia Interactive http://bistudio.com

//	========== SCRIPT CONFIG ============
_onScreenTime = 6; 		//how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role 
	//NOTE: Above value is not in seconds. It is percentage. Default: 6

//	==== CUSTOMIZING THE CREDITS ===
//	If you want more or less credits on the screen, you have to add/remove roles.
//	Watch out though, you need to make sure BOTH role lists match eachother in terms of amount.
//	Just take a good look at the _role1 and the rest and you will see what I mean.

//	== CUSTOMIZING TEXT COLOR ==
//	Find line 49 and look for: color='#f2cb0b'
//  #f2cb0b is the HTML color code for the text. As well as #FFFFFF in the row below it.
//	Find the color code you want here: http://html-color-codes.info
//	=====

//	==== SCRIPT START ====
/*
	waitUntil {!isNil "dayz_animalCheck"}; //remove this line completely to make it work in ArmA 3. Yes you read that correctly.
*/
 uisleep 2; //Wait in seconds before the credits start after player IS ingame

_role1 = "Willkommen auf";
_role1names = ["e-Monkeys.com", "Altis Life"]; //In white
_role2 = "Website";
_role2names = ["e-Monkeys.com"]; 
_role3 = "Teamspeak IP";
_role3names = ["ts.e-Monkeys.com"];
_role4 = "Support";
_role4names = ["Du hast Fragen", "oder ein Problem?", " Wir helfen dir via Teamspeak"];
_role5 = "Bitte beachtet";
_role5names = ["Dies ist ein Rollenspielserver", "Es gelten besondere Regeln", "Infos im Forum"];
_role6 = "Server Highlights";
_role6names = ["Housing System", "Logistik System", "Wirtschaftssystem", "Feuerwehr", "Paintball", "locked backpack", "Tankstellen System", "Aktive Admins"];
_role7 = "Besonderer Dank an unsere";
_role7names = ["Techniker", "Scripter", "Entwickler", "Designer", "Moderatoren", "Ausbilder", "Stammspieler", "und VIP`s"];
_role8 = "Community Management";
_role8names = ["Caesar"];
_role9 = "Server Admins";
_role9names = ["n1jUx", "Cifon", "DerOnkel"];
_role10 = "Inhaber";
_role10names = ["phoenic DeSol", "Gorki"];

{
	uisleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t font='PuristaMedium' size='0.55' color='#a6f20b' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t font='PuristaMedium' size='0.70' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[0.745438 * safezoneW + safezoneX, 0.201094 * safezoneW],	//DEFAULT: 0.5,0.35
		[0.4098 * safezoneH + safezoneY, 0.374 * safezoneH], 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	uisleep (_onScreenTime);
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
	[_role10, _role10names]	//make SURE the last one here does NOT have a , at the end
];