/*
	File: fn_sessionUpdate.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sends the update request to the server to save information in session.
*/
private["_packet","_val","_inv","_blockNetwork","_x","_send"];

_blockNetwork = [_this,0,false,[false]] call BIS_fnc_param;

if (X_Server) exitWith {};
if (!life_session_completed) exitWith {};
if (life_activeSWAT)  exitWith {};
if ((player distance (getMarkerPos "Respawn_west")) < 750) exitWith {};
if ((player distance (getMarkerPos "courtroom")) < 50) exitWith {};
if ((player distance (getMarkerPos "lasertag")) < 35) exitWith {};
if ((player distance (getMarkerPos "life_bank_door")) < 55) exitWith {};

if (life_corruptData || (life_moneyCache != (life_money / 2) + 5) || (life_atmmoneyCache != (life_atmmoney / 2) + 3)) exitWith
{
	[] spawn 
	{
		life_corruptData = true;
		hint "YOUR CHARACTER DATA HAS BEEN CORRUPTED. Log out to the lobby and rejoin to fix this. None of your progress will be saved until this is done.";
		[[911, player, "Money MEMORY HACK! Ban!"],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
};

_packet = [profileName,playerSide,life_money,life_atmmoney,getPlayerUID player];

switch (playerSide) do
{
	case west:
	{
		[] call life_fnc_saveGear;
		_array = [];
		{
			if(_x select 1 == "cop") then
			{
				_array set[count _array,[_x select 0,(missionNamespace getVariable (_x select 0))]];
			};
		} foreach life_licenses;
		_packet set[5, _array];
		[] call life_fnc_checkCopGear;
		_gear = if(!alive player) then {[]} else {cop_gear};
		_packet set[7, _gear];
		_packet set[9, true]; //changed - cop alive status was screwing with civ alive status, causing gear loss on civ
		//instead we say that if they are dead, sync empty array for gear to avoid this issue - Kevin
		_packet set[23, life_precinct];
		_packet set[24, life_prestige];
		_packet set[25, life_coptalents];
	};
	
	case civilian:
	{
		_array = [];
		{
			if(_x select 1 == "civ") then
			{
				_array set[count _array,[_x select 0,(missionNamespace getVariable (_x select 0))]];
			};
		} foreach life_licenses;
		_packet set[5, _array];
		if (!life_is_arrested) then { [] call life_fnc_civFetchGear; };
		_packet set[6, life_jail_time];
		_packet set[7, if(!alive player) then {[]} else {civ_gear}];
		_pos = getPosATL player;
		if (vehicle player isKindOf "Air") then { _pos set [2, 1]; };
		if(!alive player) then {_pos = [0,0,0]}; //Exploit prevention, player won't actually spawn at 0,0,0
		_packet set[8, _pos];
		_packet set[9, alive player];
		_packet set[15, life_gang];
		_packet set[16, life_gang_rank];
		_packet set[19, round (life_pain * 100)];
		_packet set[20, life_brokenLeg];
		if ((player getVariable["can_revive",-1000]) > time) then { _packet set[30, (player getVariable["can_revive",time]) - time]; }
		else { _packet set[30, 0]; };
		_packet set[31, [player getVariable ["customTexture", ["",""]], player getVariable ["customTextureBP", ["",""]]]];
		if ((player getVariable["parole",-1000]) > time) then { _packet set[32, [(player getVariable["parole",time]) - time, player getVariable["paroleViolated",false]]]; }
		else { _packet set[32, [0,false]]; };
		_packet set[33, life_honor];
		_packet set[34, life_honortalents];
	};
};

_inv = [];
{
	_val = missionNameSpace getVariable _x;
	if(_val > 0 && _x != "life_inv_dirty_money") then
	{
		_inv set[count _inv, [_x,_val]];
	};
} foreach life_inv_items;
if(playerSide == west) then {
	_select = if(life_coprole == "detective") then {1} else {0};
	life_yItems set[_select,_inv];
} else {life_yItems = _inv};
_packet set[10, life_yItems];
_packet set[11, player getVariable["holstered",["",""]]];
_packet set[12, round ((damage player) * 100)];
_packet set[13, life_thirst];
_packet set[14, life_hunger];
_packet set[17, life_talents];
_packet set[18, life_experience];
_packet set[21, [life_drug_level,life_addiction]];
_packet set[26, life_wealthPrestige];
_packet set[27, life_achievements];
_packet set[28, life_statistics];
_packet set[29, player getVariable ["life_title",""]];

_send = [];
{
	if (!isNil "_x") then
	{
		if (!isNil "(life_last_session select _forEachIndex)") then
		{
			if (typeName (life_last_session select _forEachIndex) != "OBJECT") then
			{
				if ((life_last_session select _forEachIndex) != str _x) then
				{
					_send set [_forEachIndex, _x];
					life_last_session set[_forEachIndex, str _x];
				};
			}
			else
			{
				_send set [_forEachIndex, _x];
				life_last_session set[_forEachIndex, str _x];
			};
		}
		else
		{
			_send set [_forEachIndex, _x];
			life_last_session set[_forEachIndex, str _x];
		};
	};
} forEach _packet;
_send set [0, profileName];
_send set [1, playerSide];
_send set [4, getPlayerUID player];

_numSet = 0;
{
	if (!isNil "_x") then { _numSet = _numSet + 1; };
} forEach _send;

if (_numSet < 4) exitWith {};

[_send,"ASY_fnc_update",false,false] spawn life_fnc_MP;