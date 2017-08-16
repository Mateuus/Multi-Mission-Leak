/*
	File: fn_onDeath.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Does whatever it needs to when a player dies.
*/
private["_unit","_killer","_weapons","_handle","_gangPoints","_bountyAmount"];
closeDialog 0;
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_source = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_isCivRestrained = _unit getVariable ["isCivRestrained",false];
if(isNull _unit) exitWith {};
_firstLetterA = "";
_time = time;
life_medic_enroute = objNull;
_gangPoints = 0;
_bountyAmount = 0;
if(group player getVariable["gangTag",""] != "") then {_firstLetterA = group player getVariable "gangTag"} else {
	_index = [group player,life_group_list] call life_fnc_index;
	_gang = if(_index > -1) then {(life_group_list select _index) select 0} else {""};
	if(_gang == "") then {
		_gang = player getVariable["gangName",""];
	};
	_length = [_gang] call KRON_StrLen;
	_select = false;
	_firstLetterA = _gang select [0,1];
	for "_i" from 1 to (_length-1) do {
		_character = _gang select [_i,1];
		if(_select) then {_firstLetterA = _firstLetterA + _character; _select = false} else {
			if(_character == " ") then {_select = true};
		};
	};
	_tagLength = [_firstLetterA] call KRON_StrLen;
	if(_tagLength == 1) then {_firstLetterA = _firstLetterA + (_gang select[_length - 1,1])};
	if(_firstLetterA == "APD") then {_firstLetterA = ""};
};
if(_firstLetterA != "") then {_firstLetterA = format["[%1] ",_firstLetterA]};
_message = format["%2%1 was killed",name player,_firstLetterA];
if(isPlayer _source && _source != player) then {
	if(typeOf _source == "B_G_Offroad_01_armed_F" && {!isNull gunner _source}) then {_source = gunner _source};
	switch(true) do {
		case(side _source == west): {
			if(_source getVariable["copLevel",0] == 0) exitWith {_message = _message + format[" by %1",name _source];};
			_message = _message + format[" by APD %2 %1",name _source,
				switch (_source getVariable["copLevel", 0]) do {
					case 1: {"Cadet"};
					case 2: {"Constable"};
					case 3: {"Corporal"};
					case 4: {"Sergeant"};
					case 5: {"Lieutenant"};
					case 6: {"Captain"};
				}
			];

		};
		case (side _source == civilian && (_source getVariable["gangName",""] != "" || [group _source,life_group_list] call life_fnc_index > -1)): {
			_firstLetter = "";
			_index = [group _source,life_group_list] call life_fnc_index;
			_gang = if(_index > -1) then {(life_group_list select _index) select 0} else {_source getVariable["gangName",""]};
			_setTag = group _source getVariable["gangTag",""];
			_gangTag = if(_gang == "" && _setTag == "") then {""} else {
				if(_setTag != "") exitWith {_setTag};
				_length = [_gang] call KRON_StrLen;
				_select = false;
				_firstLetter = _gang select [0,1];
				for "_i" from 1 to (_length-1) do {
					_character = _gang select [_i,1];
					if(_select) then {_firstLetter = _firstLetter + _character; _select = false} else {
						if(_character == " ") then {_select = true};
					};
				};
				_tagLength = [_firstLetter] call KRON_StrLen;
				if(_tagLength == 1) then {_firstLetter = _firstLetter + (_gang select[_length - 1,1])};
				if(_firstLetter == "APD") then {_firstLetter = ""};
				_firstLetter;
			};
			_message = _message + format[" by [%1] %2",_gangTag,name _source];
		};
		default {
			_message = _message + format[" by %1",name _source];
		};
	};
};
if(_source == _unit && !isNil "life_suicide") then {_message = format["%1 has taken their own life.",profileName]};
[[0,_message],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
life_deadSWAT = life_activeSWAT;
if (life_activeSWAT) exitWith
{
	life_activeSWAT = false;
	life_respawned = true;
	life_alive = true;
	[] spawn { sleep 60; life_deadSWAT = false; };
};

if (!isNull (findDisplay 39500)) then { closeDialog 0 };

if(vehicle _unit != _unit && !((vehicle _unit) isKindOf "Air")) then {_unit action ["Eject", vehicle _unit]};

//Set some vars
_unit setVariable["requesting_medic",false, true];
_unit setVariable["Revive",TRUE,TRUE]; //Set the corpse to a NON revivable state.
_unit setVariable["name",name player,TRUE]; //Set my name so they can say my name.
_unit setVariable["ToD",_time,TRUE];
_unit setVariable["restrained",nil,TRUE];
_unit setVariable["Escorting",nil,TRUE];
_unit setVariable["transporting",nil,TRUE];
_unit setVariable["steam64ID",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["can_revive", nil, true];
_unit setVariable["disarmed", nil, true];
[[_unit,false],"life_fnc_setRestrained",false,false] spawn life_fnc_MP;
life_respawned = false;
life_race = 0;
life_alcohol_level = 0;
"RadialBlur" ppEffectEnable false;
life_alive = false;

if(!isNull life_escort) then {[] call life_fnc_stopEscorting;};

if (!isNull (_unit getVariable["blindfold", objNull])) then { deleteVehicle (_unit getVariable "blindfold"); _unit setVariable["blindfold", nil, true]; };

if ((_source isKindOf "car")||(_source isKindOf "ship")||(_source isKindOf "air")) then {
	if (driver _source != _source) then {
		_source = driver _source;
	};
};

if (playerSide == west) then
{
	_spCfg = [playerSide] call life_fnc_spawnPointCfg;
	_points = [];
	{ _points pushBack (_x select 0); } forEach _spCfg;
	{
		if (player distance (getMarkerPos _x) < 100) then
		{
			[_x] spawn { life_disabled_spawns pushBack (_this select 0); sleep 120; life_disabled_spawns = life_disabled_spawns - [_this select 0]; };
		};
	} forEach _points;
};


//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc","switch"],"life_fnc_animSync",true,false] spawn life_fnc_MP;

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer","_MedicBtn","_forceDeath"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_MedicBtn = ((findDisplay 7300) displayCtrl 7303);
	_Timer = ((findDisplay 7300) displayCtrl 7301);

	//_forceDeath = false;
	//if (_this getVariable ["last_revived", -1000] > (time - 240)) then { _forceDeath = (floor (random 15) > 0); _MedicBtn ctrlEnable false; };

	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_medic=""; if(!isNull life_medic_enroute) then { _medic = format["Paramedic %1 is en-route! ", name life_medic_enroute]; }; _Timer ctrlSetText format["%2Respawn available in: %1",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString,_medic];
	round(_maxTime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText "You can now respawn";
	_maxTime = time + (life_death_timer * 60);
	// Force death if recently revived
	/*if (_forceDeath) then
	{
		closeDialog 0;
		life_respawned = true;
		[] call life_fnc_spawnMenu;
	};*/
	waitUntil {
		_medic="";
		//life_medic_enroute = player;
		if(!isNull life_medic_enroute) then {
			_medic = format["Paramedic %1 is en-route! ", name life_medic_enroute];
			if(player getVariable ["requesting_medic",false]) then {_RespawnBtn ctrlEnable false} else {_RespawnBtn ctrlEnable true};
		};
		_Timer ctrlSetText format["%2You will bleed to death in: %1",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString,_medic];
	round(_maxTime - time) <= 0 OR isNull _this OR life_respawned
	};
	if (!(isNull _this) && !(life_respawned)) then
	{
		life_respawned = true;
		[] call life_fnc_doRespawn;
	};
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

if (life_radio_chan > -1) then { [nil,nil,nil,-1] spawn life_fnc_useRadio; };

life_dead_gear = [player] call life_fnc_fetchDeadGear;
removeAllWeapons player;
_clear = nearestObjects [player,["WeaponHolderSimulated"],3];
{ deleteVehicle _x; } forEach _clear;

[] call life_fnc_sessionUpdate;

_myPoints = 0;
_extra = 0;
if (!isNil {life_statistics select 2}) then { _myPoints = life_statistics select 2 };

//Make my killer wanted!
if(side _source != west && alive _source) then
{
	if(vehicle _source isKindOf "LandVehicle" && driver (vehicle _source) == _source) then
	{
		if(alive _source) then
		{
			serv_killed = [_source,"187V"];
			publicVariableServer "serv_killed";
		};
	}
		else
	{
		if ((_source getVariable ["gang","0"]) in life_gang_wars) then
		{
			serv_killed = [_source,"187G"];
			[[187, _source, format["Gang killed %1 (%2)", profileName, getPlayerUID player]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
			_index = [getPlayerUID _source,life_kill_cache] call life_fnc_index;
			_giveStat = true;
			if (_index > -1) then
			{
				if ((life_kill_cache select _index) select 1 > (time - 600)) then { _giveStat = false; };
				life_kill_cache set [_index, [getPlayerUID _source, time]];
			}
			else
			{
				life_kill_cache pushBack [getPlayerUID _source, time];
			};
			if (_giveStat) then
			{
				_diff = _myPoints - (_source getVariable ["season",0]);
				if (_diff > 50) then { _extra = floor (_diff / 50) };
				[1,1] spawn life_fnc_addStatistic;
				[2,ceil(-1 - _extra)] spawn life_fnc_addStatistic;
				[[0,1],"life_fnc_addStatistic",_source,false] spawn life_fnc_MP;
				_gangPoints = _gangPoints + 2;
			};
		}
		else {
			if(_isCivRestrained) then {serv_killed = [_source,"187E"];}
			else {serv_killed = [_source,"187"]; };
		};
		publicVariableServer "serv_killed";
		if ((player distance (getMarkerPos "illegalArea_1_10")) <= 100 || (player distance (getMarkerPos "illegalArea_1_4")) <= 100 || (player distance (getMarkerPos "illegalArea_1_4_1_1")) <= 100 || (player distance (getMarkerPos "illegalArea_1_4_1")) <= 100) then
		{
			[[200],"life_fnc_addExperience",_source,false] spawn life_fnc_MP;
			_gangPoints = _gangPoints + 1;
		};
	};
};

if (_gangPoints > 0) then
{
	_extra = 0;
	_diff = _myPoints - (_source getVariable ["season",0]);
	if (_diff > 50) then { _extra = floor (_diff / 50) };
	_gangPoints = floor(_gangPoints + _extra);
	[[2,_gangPoints],"life_fnc_addStatistic",_source,false] spawn life_fnc_MP;
};

if(side _source == west && playerSide == civilian && life_wanted > 0) then
{
    if (life_wanted > 150000) then {_bountyAmount = 150000}
    else {_bountyAmount = life_wanted};
    [[_bountyAmount / 5,life_wanted],"life_fnc_bountyReceive",_source,false] call life_fnc_MP;
    serv_wanted_remove = [player];
    publicVariableServer "serv_wanted_remove";
	//[[player,_source,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	//[[player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
};

_escort = player getVariable ["escorted_by",[objNull,false]];
_bh = _escort select 1;
_escort = _escort select 0;
if((_source == player || isNull _source) && (!isNull _escort) && _isCivRestrained)  then
{
	if(_bh) then {
		serv_killed = [_escort,"187BH"];
		publicVariableServer "serv_killed";
	} else {
		serv_killed = [_escort,"187E"];
		publicVariableServer "serv_killed";
	};
};// else {diag_log format["DEBUG: Didn't fire ||| Source = Player? %1 |Source = %5|_unit = %6| isNull source? %2 || isNull escort? %3 || isCivRestrained? %4",(_source == player),(isNull _source),(!isNull _escort),_isCivRestrained,_source,_unit]};
//[[58, player, format["%1 was killed by %2", name _unit, name _source]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
_source addRating 999999;

// Sort out the body
//deleteVehicle _unit;
[[2, player, format["Killed by %1 (%2)",name _source,getPlayerUID _source]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

{ _unit removeAction _x; } foreach life_actions;
life_actions = [];

[] spawn life_fnc_hudUpdate;