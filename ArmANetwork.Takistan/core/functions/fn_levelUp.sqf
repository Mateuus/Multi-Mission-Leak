#include <macro.h>
/*
ArmA.Network
*/
private[];
_onScreenTime = 5;
_levelUpNotification = [];

[] spawn BIS_fnc_earthquake;
uiSleep 2;
[
	"<img size='7' image='icons\levelUP.paa'/>",
	[safezoneX + safezoneW - 1.5,0.50],
	[safezoneY + safezoneH - 1.5,0.7]
]spawn BIS_fnc_dynamicText;

//0.1 fadesound 0.3;
//playsound "levelUp";
//0.1 fadesound 1;
uiSleep 5;
_level = LEVEL;

switch(_level) do {
	case 1:
	{
		life_firstSpawn = false;
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 1!"];
		_role2 = "Extra:";
		_role2names = ["1 Skillpoint"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

	case 2:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 2!"];
		_role2 = "Extra:";
		_role2names = ["1 Skillpoint"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

	case 3:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 3!"];
		_role2 = "Extra:";
		_role2names = ["1 Skillpoint"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

	case 4:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 4!"];;
		_role2 = "Extra:";
		_role2names = ["1 Skillpoint"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

	case 5:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 5!"];
		_role2 = "Extra";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

	case 6:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 6!"];
		_role2 = "Extra:";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

	case 7:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 7!"];
		_role2 = "Extra:";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

	case 8:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 8!"];
		_role2 = "Extra:";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

	case 9:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 9!"];
		_role2 = "Extra:";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

	case 10:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 10!"];
		_role2 = "Bonus Payment:";
		_role2names = ["You received a bonus of $1,000,000!"];
		_role3 = "Extra";
		_role3names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names]];

		ADD(BANK,1000000);
	};

		case 11:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 11!"];
		_role2 = "Extra:";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

		case 12:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 12!"];
		_role2 = "Extra:";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

		case 13:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 13!"];
		_role2 = "Extra:";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

		case 14:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 14!"];
		_role2 = "Extra:";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};

		case 15:
	{
		_role1 = "Level Up!";
		_role1names = ["Congratulations on reaching Level: 15!"];
		_role2 = "Extra:";
		_role2names = ["2 new Skillpoints"];

		_levelUpNotification = [[_role1, _role1names],[_role2, _role2names]];
	};
};

{
	uiSleep 3;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
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
	uiSleep (_onScreenTime);
} forEach _levelUpNotification;
