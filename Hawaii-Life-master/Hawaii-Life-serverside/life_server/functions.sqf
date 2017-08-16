#include "script_macros.hpp"
TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith
		{
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};

	[life_atmbank,life_cash,owner player,player,profileNameSteam,getPlayerUID player,playerSide] remoteExecCall [""life_fnc_admininfo"",_ret];
";
publicVariable "TON_fnc_player_query";
publicVariable "TON_fnc_index";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;

	{
		if(_x in _valid) then
		{}
		else
		{
			_return = false;
		};
	} foreach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR {isNil ""_group""}) exitWith {};
	if(player isEqualTo _unit) then {
		if((group player) isEqualTo _group) then {
			life_my_gang = ObjNull;
			[player] joinSilent (createGroup civilian);
			hint ""You have been kicked out of the gang."";
		};
	};
";

publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR {isNil ""_giver""}) exitWith {};
	if(player isEqualTo _unit) then {
		if(!(_vehicle in life_vehicles)) then {
			_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
			hint format[""%1 has gave you keys for a %2"",_giver,_name];
			life_vehicles pushBack _vehicle;
			[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall [""TON_fnc_keyManagement"",2];
		};
	};
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR {isNil ""_group""}) exitWith {};
	if(player isEqualTo _unit) then {
		if((group player) isEqualTo _group) then {
			player setRank ""COLONEL"";
			_group selectLeader _unit;
			hint ""You have been made the new leader."";
		};
	};
";

publicVariable "TON_fnc_clientGangLeader";

TON_fnc_clientGangLeft =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR {isNil ""_group""}) exitWith {};
	if(player isEqualTo _unit) then {
		if((group player) isEqualTo _group) then {
			life_my_gang = ObjNull;
			[player] joinSilent (createGroup civilian);
			hint ""You have quit the gang."";
		};
	};
";

publicVariable "TON_fnc_clientGangLeft";
