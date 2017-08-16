/*
	File: fn_dispatchMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Requests and displays dispatcher dialog
	Please ask for permission to use this and stop stealing my stuff.
*/

disableSerialization;

if (playerSide != west) exitWith {};
if (life_coplevel < 2) exitWith { hint "You are not of sufficient rank within the police force to operate as a dispatcher." };

life_dispatcher = nil;
hint "Requesting permission to act as dispatcher...";
[[player],"ASY_fnc_requestDispatcher",false,false] spawn life_fnc_MP;

waitUntil { !isNil "life_dispatcher" };

if (!isNull life_dispatcher && life_dispatcher != player) exitWith { hint format["Another officer, %1, is already operating as dispatcher.", name life_dispatcher] };

hint "Logged in as dispatcher.";

[dispatch_chair,player] execVM "Chair\sitdown.sqf";

if(!(createDialog "life_dispatch_menu")) exitWith {};

player allowDamage false;

ctrlEnable [39512, false];
ctrlEnable [39518, false];
ctrlEnable [39520, false];
ctrlEnable [39522, false];
ctrlEnable [39526, false];
ctrlEnable [39528, false];
ctrlEnable [39530, false];
ctrlEnable [39534, false];

_map = (findDisplay 39500) displayCtrl 39501;
[_map, 1, 0.1, getPos player] call life_fnc_setMapPosition;
["dispatchMap", "onMapSingleClick",
{
	private ["_unit"];
	if ((lbCurSel 39510) < 0) exitWith {};
	_unit = call compile (((findDisplay 39500) displayCtrl 39510) lbData (lbCurSel 39510));
	if (isNull _unit) exitWith {};
	[[_unit, _pos, _alt], "ASY_fnc_setWaypoint", false, false] spawn life_fnc_MP;
}] call BIS_fnc_addStackedEventHandler;

// Cop to task line drawing
_map ctrlRemoveAllEventHandlers "Draw";
_map ctrlAddEventHandler ["Draw",'
	private ["_task"];
	if (!isNil "life_dispatchTasks") then
	{
		{
			if (count (_x select 4) > 0) then
			{
				_task = _x;
				{
					(_this select 0) drawLine [
						getPos _x,
						_task select 5,
						[0,0,1,1]
					];
				} forEach (_task select 4);
			};
		} forEach life_dispatchTasks;
	};
	{
		_unit = _x select 0;
		_pos = _x select 1;
		if (!isNull _unit) then
		{
			if (side _unit == west) then
			{
				(_this select 0) drawLine [
					getPos _unit,
					_pos,
					[0,1,1,1]
				];
			};
		};
	} forEach life_dispatchWaypoints;
'];

// Thread to monitor active police
(getPos player) spawn
{
	disableSerialization;
	_copList = (findDisplay 39500) displayCtrl 39510;
	_listedCops = [];
		
	while { !isNull (findDisplay 39500) && alive player && player distance _this < 10 } do
	{
		_requireRedraw = false;
		_i = (lbCurSel 39510);
		_curSel =  if (_i > -1) then { call compile (_copList lbData _i); } else { objNull };
		
		_activeCops = [];
		{
			if (side _x == west && _x != player) then { _activeCops pushBack _x; };
		} forEach allPlayers;
		
		if (count _activeCops != count _listedCops) then { _requireRedraw = true }
		else
		{
			{
				if (!(_x in _listedCops)) exitWith { _requireRedraw = true };
			} forEach _activeCops;
			if (!_requireRedraw) then
			{
				{
					if (!(_x in _activeCops)) exitWith { _requireRedraw = true };
				} forEach _listedCops;
			};
		};
		
		if (_requireRedraw) then
		{
			lbClear _copList;
			_listedCops = [];
			_i = -1;
			{
				_icon = switch (_x getVariable["copLevel", 0]) do
				{
					case (1) : {[0,"texture"] call BIS_fnc_rankParams};
					case (2) : {"icons\pfc_gs.paa"};
					case (3) : {[1,"texture"] call BIS_fnc_rankParams};
					case (4) : {[2,"texture"] call BIS_fnc_rankParams};
					case (5) : {[3,"texture"] call BIS_fnc_rankParams};
					case (6) : {[4,"texture"] call BIS_fnc_rankParams};
					default { "" };
				};
				_copList lbAdd (name _x);
				_copList lbSetData [(lbSize _copList)-1, Str _x];
				_copList lbSetPicture [(lbSize _copList)-1, _icon];
				_listedCops pushBack _x;
				if (!isNull _curSel) then
				{
					if (_x == _curSel) then { _i = (lbSize _copList)-1 };
				};
			} forEach _activeCops;
			if (_i > -1) then
			{
				_copList lbSetCurSel _i;
			};
		};
		
		sleep 5;
	};
	
	closeDialog 0;
	["dispatchMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	[] execVM "Chair\standup.sqf";
	life_dispatcher = objNull;
	publicVariable "life_dispatcher";
	player allowDamage true;
	[[player, -1, true], "ASY_fnc_manageRadio", false, false] spawn life_fnc_MP;
};