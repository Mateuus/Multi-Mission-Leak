disableSerialization;

private ["_display","_search_for_player","_lb_AllPlayers","_playername","_name_length","_tempArray","_playerwanted","_arr","_length","_foreachindex","_found","_west","_independent","_east","_civilian","_count","_weapon"];
if(isnull (findDisplay 9858)) exitWith {};

Seach_in_use = true;

_display = findDisplay 9858;
_search_for_player = _display displayCtrl 1400;
_lb_AllPlayers = _display displayCtrl 1500;

_playername = ctrlText _search_for_player;
_name_length = count _playername;
if(_name_length == 0) exitWith {[] call lhm_fnc_new_admin_menu_refresh_players;};
lbClear _lb_AllPlayers;
_lb_AllPlayers lbadd format["Search: %1",_playername];

_tempArray = [];
_playerwanted = toarray _playername;
Seach_in_use = false;

{

	if(Seach_in_use) exitWith {};
	_name = name _x;
	_arr = toarray _name;
	if(count(_arr) >= _name_length) then {
		_length = count _arr;
		{
			if(Seach_in_use) exitWith {};

			if(_x == (_arr select _foreachindex)) then {
				_found = true;
			} else {
				_found = false;
			};

			if(!_found) exitWith {};

		} foreach _playerwanted;
		if(_found) then {
			_tempArray pushback [_name,_x];
		};
	};





} foreach playableunits;

if(Seach_in_use) exitWith {};
if(isnull (findDisplay 9858)) exitWith {};
lbclear _lb_AllPlayers;


_west = [];
_independent = [];
_east = [];
_civilian = [];

if(Count _tempArray > 0) then {
	{
		switch(side (_x select 1)) do {
		case west: { _west pushback (_x select 1);};
		case independent: {_independent pushback (_x select 1);};
		case east: {_east pushback (_x select 1);};
		default {_civilian pushback (_x select 1);};

		};

	} foreach _tempArray;
	diag_log str _west;
	_count = 0;
	_lb_AllPlayers lbadd "--== WEST ==--";
	_lb_AllPlayers lbsetdata[_count,""];
	_lb_AllPlayers lbSetColor[_count,[0.506,0.506,0.969,1]];
	_count = _count + 1;
	{
		if(!alive _x) then {
			_lb_AllPlayers lbadd format["%1 - dead",name _x];
		} else {
			_lb_AllPlayers lbadd format["%1",name _x];
		};

		if(vehicle _x == _x) then {
			_weapon = primaryWeapon _x;
			diag_log str _weapon;
			if(_weapon != "")  then {
				_lb_AllPlayers lbSetPicture[_count,getText(configFile >> "CfgWeapons" >> _weapon >> "picture")];
			};
		} else {

			_lb_AllPlayers lbSetPicture[_count,getText(configFile >> "CfgVehicles" >> (typeof (vehicle _x)) >> "picture")];

		};

		_lb_AllPlayers lbsetdata[_count,(name _x)];
		_lb_AllPlayers lbSetColor[_count,[0.506,0.506,0.969,1]];
		_count = _count + 1;


	} foreach _west;


	_lb_AllPlayers lbadd "--== INDEPENDENT ==--";
	_lb_AllPlayers lbsetdata[_count,""];
	_lb_AllPlayers lbSetColor[_count,[0.004,0.875,0.004,1]];
	_count = _count + 1;
	{
		if(!alive _x) then {
			_lb_AllPlayers lbadd format["%1 - dead",name _x];
		} else {
			_lb_AllPlayers lbadd format["%1",name _x];
		};

		if(vehicle _x == _x) then {
			_weapon = primaryWeapon _x;

			if(_weapon != "")  then {
				_lb_AllPlayers lbSetPicture[_count,getText(configFile >> "CfgWeapons" >> _weapon >> "picture")];
			};
		} else {

			_lb_AllPlayers lbSetPicture[_count,getText(configFile >> "CfgVehicles" >> (typeof (vehicle _x)) >> "picture")];

		};

		_lb_AllPlayers lbsetdata[_count,(name _x)];
		_lb_AllPlayers lbSetColor[_count,[0.004,0.875,0.004,1]];
		_count = _count + 1;


	} foreach _independent;


	_lb_AllPlayers lbadd "--== OPFOR ==--";
	_lb_AllPlayers lbsetdata[_count,""];
	_lb_AllPlayers lbSetColor[_count,[1,0,0,1]];
	_count = _count + 1;
	{
		if(!alive _x) then {
			_lb_AllPlayers lbadd format["%1 - dead",name _x];
		} else {
			_lb_AllPlayers lbadd format["%1",name _x];
		};

		if(vehicle _x == _x) then {
			_weapon = primaryWeapon _x;

			if(_weapon != "")  then {
				_lb_AllPlayers lbSetPicture[_count,getText(configFile >> "CfgWeapons" >> _weapon >> "picture")];
			};
		} else {

			_lb_AllPlayers lbSetPicture[_count,getText(configFile >> "CfgVehicles" >> (typeof (vehicle _x)) >> "picture")];

		};

		_lb_AllPlayers lbsetdata[_count,(name _x)];
		_lb_AllPlayers lbSetColor[_count,[1,0,0,1]];
		_count = _count + 1;


	} foreach _east;

	_lb_AllPlayers lbadd "--== CIVILIANS ==--";
	_lb_AllPlayers lbsetdata[_count,""];
	_lb_AllPlayers lbSetColor[_count,[1,0,1,1]];
	_count = _count + 1;
	{
		if(!alive _x) then {
			_lb_AllPlayers lbadd format["%1 - dead",name _x];
		} else {
			_lb_AllPlayers lbadd format["%1",name _x];
		};

		if(vehicle _x == _x) then {
			_weapon = primaryWeapon _x;

			if(_weapon != "")  then {
				_lb_AllPlayers lbSetPicture[_count,getText(configFile >> "CfgWeapons" >> _weapon >> "picture")];
			};
		} else {

			_lb_AllPlayers lbSetPicture[_count,getText(configFile >> "CfgVehicles" >> (typeof (vehicle _x)) >> "picture")];

		};

		_lb_AllPlayers lbsetdata[_count,(name _x)];
		_lb_AllPlayers lbSetColor[_count,[1,0,1,1]];
		_count = _count + 1;


	} foreach _civilian;

} else {

	_lb_AllPlayers lbadd format["404 Not Found: %1",_playername];

};


