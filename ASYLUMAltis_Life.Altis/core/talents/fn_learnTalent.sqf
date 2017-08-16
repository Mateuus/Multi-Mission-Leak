/*
	File: fn_learnTalent.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player has learned a new talent, such as scripting.
	Please either get Asylum permission to use this or create this system yourself.
*/

[] spawn
{
	private["_display","_index","_id","_max","_free","_str"];

	disableSerialization;
	_display = findDisplay 3700;
	_index = lbData[3702,lbCurSel (3702)];
	_index = call compile format["%1", _index];
	_learn = _display displayCtrl 3710;

	if(isNil "_index") exitWith {_text ctrlSetText "Invalid talent data.";};
	_talent = [];
	{
		if ((_x select 0) == _index) exitWith{ _talent = _x; };
	} foreach life_talentInfo;
	if(count _talent < 1) exitWith {_text ctrlSetText "Talent data not found.";};

	_id = _talent select 0;
	_parent = _talent select 3;

	if (_id in life_talents) then
	{
		_gotChild = [];
		{
			if (_id == (_x select 3) && (_x select 0) in life_talents) exitWith { _gotChild = _x; };
		} forEach life_talentInfo;
		if (count _gotChild > 0) exitWith { hint format["You can't unlearn this talent as it has a child talent, %1, which will need to be unlearned first.", _gotChild select 2] };
		
		_handle = [format["<t align='center'>If you proceed you will unlearn the talent %1 for a cost of $%2!</t>", _talent select 2, [life_respec_fee] call life_fnc_numberText]] spawn life_fnc_confirmMenu;
		waitUntil {scriptDone _handle};
		if(!life_confirm_response) exitWith {};
		
		if (life_atmmoney < life_respec_fee) exitWith { hint "You don't have enough money in your bank to unlearn this talent." };
		["atm","take",life_respec_fee] call life_fnc_uC;
		
		life_talents = life_talents - [_id];
		
		hint format["You have unlearned the talent, %1.", _talent select 2];
		
		[] spawn life_fnc_talentMenu;
	}
	else
	{
		_max = [] call life_fnc_calTalents;
		_free = _max - (count life_talents);

		if (_free < 1) exitWith { hint "You don't have an available talent point to spend!"; closeDialog 0; };
		if (_parent != 0 && !(_parent in life_talents)) exitWith { hint "This talent requires another talent that you don't have!"; closeDialog 0; };

		life_talents set [count life_talents, _talent select 0];

		_str = format["You have learned the talent, %1.", _talent select 2];
		hint _str;
		systemChat _str;
		
		[] spawn life_fnc_talentMenu;
	};
};