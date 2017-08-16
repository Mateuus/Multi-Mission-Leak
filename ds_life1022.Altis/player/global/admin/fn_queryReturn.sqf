/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Returns a query
*/

private ["_dialog","_text","_unit","_bank","_cash","_breakingNLR","_gang","_totalMinutes","_totalHours","_temp","_primaryWeapon"];

disableSerialization;

_dialog = findDisplay 2900;
if(isNull _dialog)exitWith{};

_text = _dialog displayCtrl 1100;

_unit = _this select 0;
_bank = _this select 1;
_cash = _this select 2;
_breakingNLR = _this select 3;
_gang = (group _unit) getVariable ["gangName","Not in a Gang"];
_totalMinutes = ((_this select 4) select 0);
_totalMinutes = _totalMinutes + ((_this select 4) select 1);
_totalMinutes = _totalMinutes + ((_this select 4) select 2);
_totalHours = (floor(_totalMinutes/60));
_totalMinutes = _totalMinutes - (_totalHours*60);

_primaryWeapon = if(primaryWeapon _unit isEqualTo "")then {"None"} else {primaryWeapon _unit};
if(!(_primaryWeapon isEqualTo ""))then {
	_temp = configFile >> "CfgWeapons" >> _primaryWeapon;
	_primaryWeapon = getText (_temp >> "displayName");
};

_breakingNLR = if(_breakingNLR)then {"<t color='#db3b3b'>Yes</t>"} else {"<t color='#3cd039'>No</t>"};

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