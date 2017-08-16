/*
	File: fn_learnPrestige.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player has learned a new speciality.
	Please either get Asylum permission to use this or create this system yourself.
*/

[] spawn
{
	private["_display","_index","_id","_max","_free","_str","_cost"];

	disableSerialization;
	_display = findDisplay 1700;
	_index = lbData[1702,lbCurSel (1702)];
	_index = call compile format["%1", _index];
	_learn = _display displayCtrl 1710;

	if(isNil "_index") exitWith {_text ctrlSetText "Invalid prestige data.";};
	_talent = [];
	{
		if ((_x select 0) == _index) exitWith{ _talent = _x; };
	} foreach life_prestigeInfo;
	if(count _talent < 1) exitWith {_text ctrlSetText "Prestige data not found.";};

	_id = _talent select 0;
	_cost = _talent select 1;
	_parent = _talent select 3;

	if (life_prestige < _cost) exitWith { hint "You don't have enough prestige for this!"; closeDialog 0; };
	if (_parent != 0 && !(_parent in life_coptalents)) exitWith { hint "This speciality requires another which you don't have!"; closeDialog 0; };

	life_coptalents pushBack (_talent select 0);
	life_prestige = life_prestige - _cost;

	_str = format["You have learned %1.", _talent select 2];
	hint _str;
	systemChat _str;
	
	[] spawn life_fnc_prestigeMenu;
	
	life_track_radius = switch (true) do
	{
		case (8 in life_coptalents): { 200 };
		case (7 in life_coptalents): { 300 };
		case (6 in life_coptalents): { 400 };
		case (5 in life_coptalents): { 500 };
		case (4 in life_coptalents): { 800 };
		case (3 in life_coptalents): { 900 };
		case (2 in life_coptalents): { 1000 };
		default { 1400 };
	};
};