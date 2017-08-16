#include "..\..\script_macros.hpp"
/*
    File: fn_jail.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the initial process of jailing.
*/
private ["_illegalItems","_time","_countDown"];
params [
    ["_unit",objNull,[objNull]],
    ["_bad",false,[false]]
];

_time = time + (20 * 60);

if (isNull _unit) exitWith {}; //Dafuq?
if (_unit != player) exitWith {}; //Dafuq?
//if (life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_illegalItems = LIFE_SETTINGS(getArray,"jail_seize_vItems");
player allowdamage false;
player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
Uisleep 0.5;

removeAllWeapons player;
{player removeMagazine _x} forEach (magazines player);
removeuniform player;
removeBackpack player;
removeVest player;
removeheadgear player;
removeGoggles player;    
player adduniform "U_C_Scientist";
player setPos [3229.73,12943.8,0.2];
life_combatlog = true;
life_istazed = true;
{
    _amount = ITEM_VALUE(_x);
    if (_amount > 0) then {
        [false,_x,_amount] call life_fnc_handleInv;
    };
} forEach _illegalItems;

if (_bad) then {
    waitUntil {alive player};
    uiSleep 1;
};

if (player distance (getMarkerPos "jail_combatlog") > 15) then {
player setPos [3229.73,12943.8,0.2];
};

titleText[localize "STR_Jail_combatlog","PLAIN"];
systemchat format['You have been put here cause you combatlogged, wait your extra punish time out! If you attempt to respawn or reconnect you will just end up here again!'];
[] call life_fnc_playerSkins;

for "_i" from 0 to 1 step 0 do {
    if ((round(_time - time)) > 0) then {
        _countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
        hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/>",_countDown];
    };
	
	if (uniform player isEqualTo "U_C_Scientist") then {
	} else {
	player adduniform "U_C_Scientist";
	_clear = nearestObjects [player,["weaponholder"],5];
	_clear1 = nearestObjects [player,["WeaponHolderSimulated"],5];
	_destroyed = 0;

	for "_j" from 0 to count _clear - 1 
	do
	{
		_destroyed = _destroyed + 1;
		deleteVehicle (_clear select _j);

		uiSleep 0.056;
	};

	for "_i" from 0 to count _clear1 - 1 
	do
	{
		_destroyed = _destroyed + 1;
		deleteVehicle (_clear1 select _i);

		uiSleep 0.056;
	};
	
	[] call life_fnc_playerSkins;
	};
	
	if (player distance (getMarkerPos "jail_combatlog") > 15) then {
        player setPos [3229.73,12943.8,0.2];
    };

    if ((round(_time - time)) < 1) exitWith {hint ""};
    if (!alive player && ((round(_time - time)) > 0)) exitWith {};
    uiSleep 0.1;
};

life_combatlog = false;
life_istazed = false;
hint "Next time follow our rules and don't combatlog!";

_SpawnLocation = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250]; 
_SpawnLocation = _SpawnLocation call BIS_fnc_selectRandom;
_SpawnLocation = _SpawnLocation buildingPos 0;
_position = _SpawnLocation;
Uisleep 0.1;
player setPos (_position);
player allowdamage true;

[19] call SOCK_fnc_updatePartial;
