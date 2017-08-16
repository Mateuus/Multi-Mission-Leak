/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns server rules
*/
_dialog = findDisplay 69696;
_textArea = _dialog displayCtrl 1100;

_ruleNum = ((_this select 0) select 1);

_rule = [DS_rulesMenuIndex,_ruleNum] call DS_fnc_rulesConfig;

hint format ["%1",_rule];

_textArea ctrlSetStructuredText parseText format ["%1",_rule];

/*

_text ctrlSetStructuredText parseText format["Name: <a href='http://steamcommunity.com/profiles/%1'>%2</a><br/>Bank: %3<br/>Money: %4<br/>Breaking NLR: %5<br/>Gang: %6<br/>Total Time: %7 %8<br/>Weapon: %9",
	(getPlayerUID _unit),
	format ["<t color='#cdcdcd'>%1</t>",_unit getVariable ["name",name _unit]],
	format ["<t color='#cdcdcd'>$%1</t>",[_bank] call DS_fnc_numberText],
	format ["<t color='#cdcdcd'>$%1</t>",[_cash] call DS_fnc_numberText],
	format ["%1",_breakingNLR],
	format ["<t color='#cdcdcd'>%1</t>",_gang],
	format ["<t color='#cdcdcd'>%1h</t>",_totalHours],
	format ["<t color='#cdcdcd'>%1m</t>",_totalMinutes],
	format ["<t color='#cdcdcd'>%1</t>",_primaryWeapon]
];

*/