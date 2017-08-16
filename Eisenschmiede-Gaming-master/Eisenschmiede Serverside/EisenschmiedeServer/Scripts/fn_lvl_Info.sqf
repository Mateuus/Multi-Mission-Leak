private ["_next"];
_mode = param [0,-1,[-1]];
disableSerialization;

switch (playerSide) do {
	case west: {_next = getNumber(missionConfigFile >> "CfgXP" >> "levels_COP" >> str(ES_xp_lvl + 1) >> "xpNeeded");menuContent = getArray(missionConfigFile >> "ES_Settings" >> "lvlInfoCOP");};
	case independent: {_next = getNumber(missionConfigFile >> "CfgXP" >> "levels_MED" >> str(ES_xp_lvl + 1) >> "xpNeeded");menuContent = getArray(missionConfigFile >> "ES_Settings" >> "lvlInfoMED");};
	case civilian: {_next = getNumber(missionConfigFile >> "CfgXP" >> "levels_CIV" >> str(ES_xp_lvl + 1) >> "xpNeeded");menuContent = getArray(missionConfigFile >> "ES_Settings" >> "lvlInfoCIV");};
	default { };
};

if(_mode == 0) then {
	if (!(isNull (findDisplay 1250))) exitWith {};
	createDialog "ES_lvl_menu";
	_dialog = findDisplay 1250;
	_contentList = _dialog displayCtrl 2000;
	{
		_contentList lbAdd (_x select 0);
	} forEach menuContent;

	[] call ES_fnc_lvl_Color;

((findDisplay 1250) displayCtrl 1235) ctrlSetText PlayerXpStat;
((findDisplay 1250) displayCtrl 1007) ctrlsetText format["%1", ES_xp_lvl];
switch (playerSide) do {
	case west: {((findDisplay 1250) displayCtrl 1008) ctrlsetText format["%1", ES_xp_cop];((findDisplay 1250) displayCtrl 1009) ctrlsetText format["%1/%2", ([ES_xp_cop] call ES_fnc_numberText), ([_next] call ES_fnc_numberText)];};
	case independent: {((findDisplay 1250) displayCtrl 1008) ctrlsetText format["%1", ES_xp_med];((findDisplay 1250) displayCtrl 1009) ctrlsetText format["%1/%2", ([ES_xp_med] call ES_fnc_numberText), ([_next] call ES_fnc_numberText)];};
	case civilian: {((findDisplay 1250) displayCtrl 1008) ctrlsetText format["%1", ES_xp_civ];((findDisplay 1250) displayCtrl 1009) ctrlsetText format["%1/%2", ([ES_xp_civ] call ES_fnc_numberText), ([_next] call ES_fnc_numberText)];};
	default { };
};
((findDisplay 1250) displayCtrl 1111) ctrlsetText format["(%1%2)", round (([] call ES_fnc_xp_getProgress) * 100), "%"];
((findDisplay 1250) displayCtrl 1850) progressSetPosition ([] call ES_fnc_xp_getProgress);

} else {

	_dialog = findDisplay 1250;
	if(isNull _dialog) exitWith {};
	_contentList = _dialog displayCtrl 2000;
	_content = _dialog displayCtrl 1750;
	_title = _dialog displayCtrl 1251;
	_curSel = lbCurSel _contentList;
	_title ctrlSetText ((menuContent select _curSel) select 1);
	_content ctrlSetStructuredText parseText ((menuContent select _curSel) select 2);

};