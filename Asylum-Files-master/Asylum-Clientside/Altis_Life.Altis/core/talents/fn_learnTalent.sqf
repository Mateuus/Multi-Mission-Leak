/*
	File: fn_learnTalent.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player has learned a new talent, such as scripting.
	Please either get Asylum permission to use this or create this system yourself.
*/

[] spawn
{
	private["_display","_index","_id","_max","_free","_str","_talentInfo","_talents"];

	disableSerialization;
	_display = findDisplay 3700;
	_index = lbData[3702,lbCurSel (3702)];
	_index = call compile format["%1", _index];
	_learn = _display displayCtrl 3710;
	
	if (life_gangperk && life_gang_rank > 1) exitWith {};
	
	_talentInfo = if (life_gangperk) then { life_gangTalentInfo } else { life_talentInfo };
	_talents = if (life_gangperk) then { life_gangtalents } else { life_talents };

	if(isNil "_index") exitWith {_text ctrlSetText "Invalid talent data.";};
	_talent = [];
	{
		if ((_x select 0) == _index) exitWith{ _talent = _x; };
	} foreach _talentInfo;
	if(count _talent < 1) exitWith {_text ctrlSetText "Talent data not found.";};

	_id = _talent select 0;
	_parent = _talent select 3;
	if(!life_gangperk && _id == 31 && 126 in life_talents) exitWith {hint "You can not learn marksman while having the master bounty hunter talent."};
	if(!life_gangperk && _id == 126 && 31 in life_talents) exitWith {hint "You must first unlearn the marksman talent to become a master bounty hunter."};
	if (_id in _talents) then
	{
		_gotChild = [];
		{
			if (_id == (_x select 3) && (_x select 0) in _talents) exitWith { _gotChild = _x; };
		} forEach _talentInfo;
		if (count _gotChild > 0) exitWith { hint format["You can't unlearn this talent as it has a child talent, %1, which will need to be unlearned first.", _gotChild select 2] };
		
		_handle = [format["<t align='center'>If you proceed you will unlearn the talent %1 for a cost of $%2!</t>", _talent select 2, [life_respec_fee] call life_fnc_numberText]] spawn life_fnc_confirmMenu;
		waitUntil {scriptDone _handle};
		if(!life_confirm_response) exitWith {};
		
		if (life_atmmoney < life_respec_fee) exitWith { hint "You don't have enough money in your bank to unlearn this talent." };
		["atm","take",life_respec_fee] call life_fnc_uC;
		
		if (life_gangperk) then { life_gangtalents = life_gangtalents - [_id]; }
		else { life_talents = life_talents - [_id]; };
		
		hint format["You have unlearned the talent, %1.", _talent select 2];
	}
	else
	{
		_max = [] call life_fnc_calTalents;
		_free = _max - (count _talents);

		if (_free < 1) exitWith { hint "You don't have an available talent point to spend!"; closeDialog 0; };
		if (_parent != 0 && !(_parent in _talents)) exitWith { hint "This talent requires another talent that you don't have!"; closeDialog 0; };

		if (life_gangperk) then { life_gangtalents pushBack (_talent select 0); }
		else { life_talents pushBack (_talent select 0); };

		_str = format["You have learned the talent, %1.", _talent select 2];
		hint _str;
		systemChat _str;
	};
	
	[] spawn life_fnc_talentMenu;

	if (life_gangperk) then
	{
		[[player,life_gang,life_gangtalents],"ASY_fnc_setGangTalents",false,false] spawn life_fnc_MP;
	};
};