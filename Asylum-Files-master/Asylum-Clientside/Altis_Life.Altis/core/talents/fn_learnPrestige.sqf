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
	_vars = if(playerSide == civilian) then {[life_skiptracerInfo,life_honortalents,life_honor]} else {[life_prestigeInfo,life_coptalents,life_prestige]};
	if(isNil "_index") exitWith {_text ctrlSetText "Invalid prestige data.";};
	_talent = [];
	{
		if ((_x select 0) == _index) exitWith{ _talent = _x; };
	} foreach (_vars select 0);
	if(count _talent < 1) exitWith {_text ctrlSetText "Prestige data not found.";};

	_id = _talent select 0;
	_cost = _talent select 1;
	_parent = _talent select 3;

	if ((_vars select 2) < _cost) exitWith { hint format["You don't have enough %1 for this!",if(playerSide == civilian) then {"honor"} else {"prestige"}]; closeDialog 0; };
	if (_parent != 0 && !(_parent in (_vars select 1))) exitWith { hint "This speciality requires another which you don't have!"; closeDialog 0; };
	if(playerSide == civilian && ((_talent select 0 == 11 && (!(10 in life_honortalents) || !(7 in life_honortalents) || !(4 in life_honortalents))) || (_talent select 0 == 22 && (!(15 in life_honortalents) || !(18 in life_honortalents) || !(21 in life_honortalents))))) exitWith {hint "This is a master level talent which requires all previous talents."};
	if(count life_honortalents > 14) exitWith {hint "You may only have a maximum of 15 specialties in the skiptracer system"};
	if(playerSide == civilian) then {
		life_honortalents pushBack (_talent select 0);
		life_honor = life_honor - _cost;
	} else {
		life_coptalents pushBack (_talent select 0);
		life_prestige = life_prestige - _cost;
	};
	_str = format["You have learned %1.", _talent select 2];
	hint _str;
	systemChat _str;
	
	[] spawn life_fnc_prestigeMenu;
	if(playerSide == civilian) exitWith {};
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