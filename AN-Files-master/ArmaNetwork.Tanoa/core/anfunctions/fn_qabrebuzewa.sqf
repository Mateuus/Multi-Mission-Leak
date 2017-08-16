#include <macro.h>
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
if(life_killed) exitWith {};
life_killed = true;
if !(rb_dead_gear isEqualTo []) exitWith {};
rb_dead_gear = getunitloadout player;
removeAllWeapons player;

life_gear = [];
[3] call life_fnc_maphuwres;

private["_medicsOnline","_killerWeapon","_groupName","_groupNameKiller","_containers"];
params [
	["_unit",objNull,[objNull]],
	["_killer",objNull,[objNull]]
];

disableSerialization;
while {!isNull (findDisplay 49)} do
{
	(findDisplay 49) closeDisplay 1;
};
while {dialog} do
{
	closeDialog 0;
};
life_corpse = _unit;
player setVariable ["tf_voiceVolume", 0, true];
if (count attachedObjects player > 0) then {
	{
		if(isPlayer _x) then {
			detach _x;
		} else {
			deleteVehicle _x;
		};
	} forEach attachedObjects _unit;
};

{
	deleteVehicle _x;
} forEach nearestObjects [player, ["WeaponHolder"], 10];

profileNamespace setVariable["swuyecamar",playerSide];
saveProfileNamespace;

_unit setVariable["Revive",false,true];
_unit setVariable ["DeclaredDead",nil,true];
_unit setVariable["name",profileName,true];
_unit setVariable["restrained",false,true];
_unit setVariable["Escorting",false,true];
_unit setVariable["out",false,true];
_unit setVariable["transporting",false,true];
_unit setVariable["steam64id",(getPlayerUID player),true];
_unit setVariable["timeofdeath",serverTime,true];
_unit setDamage 0;
_unit setvariable ["bloodlevel",5500];
_unit setvariable ["bleedrate",0];
[false] spawn life_fnc_mlehleproexieb;

1 fadeSound 1;
[false,1205] call life_fnc_spunadruc;
_Killedby = false;
if((_killer isKindOf "landVehicle") || {_killer isKindOf "Ship"} || {_killer isKindOf "Air"}) then {
	_killerWeapon = format["%1 (Vehicle)", getText(configFile >> "CfgVehicles" >> typeOf (vehicle _killer) >> "displayName")];
} else {
	if(isPlayer _killer) then {
		_weapon = [currentWeapon _killer] call life_fnc_thagawrepru;
		if(count _weapon > 1) then {
			_killerWeapon = _weapon select 1;
		} else {
			_killerWeapon = "";
		};
	} else {
		_killerWeapon = _killer;
	};
};
if(isNil {_killerWeapon}) then
{
	_killerWeapon = "Unknown";
};
if(isNull _killer || _killer isEqualTo player) then {
	switch (playerSide) do {
		case civilian: {
			if(((group _unit) getVariable["gangName",""]) isEqualTo "") then {
				_groupName = "No Gang";
			} else {
				_groupName = ((group _unit) getVariable["gangName",""]);
			};
		};
		case west: {
			_groupName = "TSO";
		};
		case independent: {
			_groupName = "EMS";
		};
	};
} else {
	switch (playerSide) do {
		case civilian:
		{
			if(((group _unit) getVariable["gangName",""]) isEqualTo "") then {
				_groupName = "No Gang";
			} else {
				_groupName = ((group _unit) getVariable["gangName",""]);
			};
		};
		case west:
		{
			_groupName = "TSO";
		};
		case independent:
		{
			_groupName = "EMS";
		};
	};
	switch (side _killer) do {
		case civilian:
		{
			if(((group _killer) getVariable["gangName",""]) isEqualTo "") then {
				_groupNameKiller = "No Gang";
			} else {
				_groupNameKiller = "Gang: " + ((group _killer) getVariable["gangName",""]);
			};
		};
		case west:
		{
			_groupNameKiller = "TSO";
		};
		case independent:
		{
			_groupNameKiller = "EMS";
		};
	};
};

if(isNull _killer || _killer isEqualTo player) then {
	_Killedby = _groupName;
} else {
	_Killedby = _groupNameKiller;
};

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder false;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,22,22];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;
(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1 && ((call life_adminlevel) < 1)) then {true}"];
player setVariable ["tf_unable_to_use_radio", true];


_Killedby = ((findDisplay 7300) displayCtrl 1002);
_KilledWeapon = ((findDisplay 7300) displayCtrl 1004);
_KilledDistance = ((findDisplay 7300) displayCtrl 1005);
_KillerUID = ((findDisplay 7300) displayCtrl 1003);
_List = ((findDisplay 7300) displayCtrl 1500);

lbClear _List;
_near_units = [];
{ if(_unit distance _x < 20) then {_near_units pushBack _x};} forEach (allPlayers - entities "HeadlessClient_F");
if(isNull _killer || _killer isEqualTo player) then {
	if!(hittime == 0) then {
	_Killedby ctrlSetText format ["Last hit by: %1 (%2 second(s) ago)",name (_unit getvariable "lastHit"), ceil(diag_tickTime - hittime)];
	_KillerUID ctrlSetText format ["Last hit UID: %1", uidshooter];
	diag_log format["Shot by %1 with UID %2",name (_unit getvariable "lastHit"),uidshooter];
	_KilledWeapon ctrlSetText format ["Weapon: %1",_killerWeapon];
	_KilledDistance ctrlSetText format ["Distance: %1m",[floor( _killer distance _unit)] call life_fnc_rupadudejat];

 } else {
		_Killedby ctrlSetText format ["You killed yourself"];
		_KillerUID ctrlSetText format ["Your UID: %1", getPlayerUID player];
		_KilledWeapon ctrlSetText format ["Weapon: Stupidity"];
		_KilledDistance ctrlSetText format ["Distance: How far is suicide?"];
	};
 } else {

	_Killedby ctrlSetText format ["Killed by: %1 (%2)",_killer getVariable["realname",""],_groupNameKiller];
	_KillerUID ctrlSetText format ["Killer UID: %1",getPlayerUID _killer];
	_KilledWeapon ctrlSetText format ["Weapon: %1",_killerWeapon];
	_KilledDistance ctrlSetText format ["Distance: %1m",[floor( _killer distance _unit)] call life_fnc_rupadudejat];
};
//_KillerUID ctrlSetText format ["Killer UID: %1",getPlayerUID _killer];
//_KilledWeapon ctrlSetText format ["Weapon: %1",_killerWeapon];
//_KilledDistance ctrlSetText format ["Distance: %1m",[floor( _killer distance _unit)] call life_fnc_rupadudejat];

{
	if(!isNull _x && {alive _x} && {_x != player}) then {
		_List lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
	};
} forEach _near_units;

_unit spawn
{
	scopeName "DeathLoop";
	private["_maxTime","_RespawnBtn","_Timer","_respawnTimer"];
	disableSerialization;
	_medicsOnline = {_x != player && {side _x isEqualTo independent} && {alive _x}} count playableUnits > 0;
	if(_medicsOnline) then {
		_respawnTimer = 7;
		if("death" in AN_Skills) then {
			_respawnTimer = 5;
		};
	} else {
		_respawnTimer = 3;
	};
	if(getNumber(missionConfigFile >> "DebugMode") isEqualTo 1) then {
		_maxTime = time + 10;
	} else {
		_maxTime = time + (_respawnTimer * 60);
	};
	_Timer = ((findDisplay 7300) displayCtrl 1009);
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 || isNull _this};
	if(round(_maxTime - time) <= 0 || isNull _this && life_killed) exitWith {
		_Timer ctrlSetText "You are Dead";
		life_deathCamera camSetFov 9;
		life_deathCamera camSetRelPos [0,-5,1050.85];
		life_deathCamera camCommit 2;
		sleep 1;
		//life_corpse = nil;
		deleteVehicle life_corpse;
		//closeDialog 0;
		life_respawned = true;
		rb_dead_gear = [];
		player setVariable ["tf_voiceVolume", 1, true];
		//life_killed = false;
		call life_fnc_memedead;
	};
};

[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit isEqualTo 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,22,22]; life_deathCamera camCommit 0;};
};

[_unit] call life_fnc_racucezaw;

life_hunger = 5000;
life_thirst = 5000;
life_carryWeight = 0;
[an_cash,0,1] call life_fnc_sewawruk;
alcohol_level = 0;
drug_level = 0;
life_fadeSound = false;
"RadialBlur" ppEffectEnable false;
[false,1205] call life_fnc_spunadruc;
[1] call life_fnc_cruswutaq;

if!(UpdateThread isEqualTo -1) then {
	[UpdateThread] call life_fnc_vunurepru;
	UpdateThread = -1;
};
if!(MedicThread isEqualTo -1) then {
	[MedicThread] call life_fnc_vunurepru;
	MedicThread = -1;
};
if!(FullThread isEqualTo -1) then {
	[FullThread] call life_fnc_vunurepru;
	FullThread = -1;
};
if!(PayCheckThread isEqualTo -1) then {
	[PayCheckThread] call life_fnc_vunurepru;
	PayCheckThread = -1;
};
if!(AlcoholThread isEqualTo -1) then {
	[AlcoholThread] call life_fnc_vunurepru;
	AlcoholThread = -1;
};

showChat false;
player setVariable ["tf_unable_to_use_radio", true];
[0] call life_fnc_maphuwres;
