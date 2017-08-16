/*
	File: fn_achievementMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays player achievements
*/
private["_display","_list","_titleMenu"];

disableSerialization;
waitUntil {!isNull (findDisplay 3100)};

[] call life_fnc_p_updateMenu;

_display = findDisplay 3100;
_list = _display displayCtrl 3110;
_titleMenu = _display displayCtrl 3122;

lbClear _list;
lbClear _titleMenu;
_titleMenu lbAdd "No Title";
_titleMenu lbSetData [0,"-1"];
_titleSel = 0;
{
	if (playerSide in (_x select 0)) then
	{
		_list lbAdd (_x select 1);
		_list lbSetData [(lbSize _list)-1,str (_forEachIndex)];
		if (!(_forEachIndex in life_achievements)) then
		{
			_list lbSetColor [(lbSize _list)-1, [1,0,0,0.8]];
		}
		else
		{
			if (_x select 5 != "") then
			{
				_titleMenu lbAdd (_x select 5);
				_titleMenu lbSetData [(lbSize _titleMenu)-1,str (_forEachIndex)];
				if (_x select 5 == (player getVariable ["life_title","Nope!"])) then { _titleSel = (lbSize _titleMenu)-1 };
			};
		};
	};
} forEach life_achievementInfo;

_list lbSetCurSel 0;
_titleMenu lbSetCurSel _titleSel;

//if (life_donator == 0) then { systemChat format["You have %1 prestige. If you donated on the Asylum website you can receive a %2 prestige boost per donor level.", life_wealthPrestige, [life_prestige_per_donor] call life_fnc_numberText] }
//else { systemChat format["You have %1 base prestige plus a %2 bonus for donating.", life_wealthPrestige, life_donator * life_prestige_per_donor] };