#include "..\..\script_macros.hpp"
/*
    File: fn_onPlayerKilled.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    When the player dies collect various information about that player
    and pull up the death dialog / camera functionality.
*/
private["_killerWeapon","_groupName","_groupNameKiller"];
params [
    ["_unit",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];
disableSerialization;

if(playerside isEqualTo west) then
{
	life_repentz_cop_gear = [uniform player,[uniformItems player],vest player,[vestItems player],backpack player,[backpackItems player],headgear player, goggles player, secondaryWeapon player,[secondaryWeaponItems player]];
};


if  !((vehicle _unit) isEqualTo _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

//Set some vars
_unit setVariable ["Revive",true,true];
_unit setVariable ["name",profileName,true]; //Set my name so they can say my name.
_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["steam64id",(getPlayerUID player),true]; //Set the UID.
//_unit setVariable ["taskStart",false,true];
//_unit setVariable ["taskStartCiv",false,true];
_unit setVariable ["tied",false,true];


if((_killer isKindOf "landVehicle") || (_killer isKindOf "Ship") || (_killer isKindOf "Air")) then {
	_killerWeapon = format["%1 (Vehicle)", getText(configFile >> "CfgVehicles" >> typeOf (vehicle _killer) >> "displayName")];
} else {
	if(isPlayer _killer) then {
		_weapon = [currentWeapon _killer] call life_fnc_fetchCfgDetails;
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
if(isNull _killer || _killer == player) then {
	switch (playerSide) do {
		case civilian:
		{
			if(((group _unit) getVariable["gang_name",""]) == "") then {
				_groupName = "No Gang";
			} else {
				_groupName = ((group _unit) getVariable["gang_name",""]);
			};
		};
		case west:
		{
			_groupName = "Police";
		};
		case independent:
		{
			_groupName = "EMS";
		};

	};
} else {
	switch (playerSide) do {
		case civilian:
		{
			if(((group _unit) getVariable["gang_name",""]) == "") then {
				_groupName = "No Gang";
			} else {
				_groupName = ((group _unit) getVariable["gang_name",""]);
			};
		};
		case west:
		{
			_groupName = "Police";
		};
		case independent:
		{
			_groupName = "EMS";
		};
	};
	switch (side _killer) do {
		case civilian:
		{
			if(((group _killer) getVariable["gang_name",""]) == "") then {
				_groupNameKiller = "No Gang";
			} else {
				_groupNameKiller = "Gang: " + ((group _killer) getVariable["gang_name",""]);
			};
		};
		case west:
		{
			_groupNameKiller = "Police";
		};
		case independent:
		{
			_groupNameKiller = "EMS";
		};
	};
};
private _BountyPeeps = [];

{
	if (license_civ_bountyH) then {_BountyPeeps pushBack _x};
} forEach playableUnits;

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

if(!(FETCH_CONST(life_adminlevel) > 2)) then {(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; } else {};//Block the ESC menu

_Killedby = ((findDisplay 7300) displayCtrl 7310);
_KilledWeapon = ((findDisplay 7300) displayCtrl 7311);
_KilledDistance = ((findDisplay 7300) displayCtrl 7312);
if(isNull _killer || _killer == player) then {
	_Killedby ctrlSetText format ["Killed by: %1 (%2)",_unit getVariable["realname",""],_groupName];
} else {
	_Killedby ctrlSetText format ["Killed by: %1 (%2)",_killer getVariable["realname",""],_groupNameKiller];
};
[format["%1 was killed by %2 (%3)", profileName, _killer getVariable["realname",""],_groupName], "PlayerLogging"] remoteExecCall ["A3Log", 2];
_KilledWeapon ctrlSetText format ["Weapon: %1",_killerWeapon];
_KilledDistance ctrlSetText format ["Distance: %1m",[floor( _killer distance _unit)] call life_fnc_numberText];
//Create a thread for something?
_unit spawn {
    private ["_maxTime","_RespawnBtn","_Timer"];
    disableSerialization;
    _RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
    _Timer = ((findDisplay 7300) displayCtrl 7301);
    if (LIFE_SETTINGS(getNumber,"respawn_timer") < 5) then {
        _maxTime = time + 5;
    } else {
        _maxTime = time + LIFE_SETTINGS(getNumber,"respawn_timer");
    };

    _RespawnBtn ctrlEnable false;
    
    waitUntil {_Timer ctrlSetText format [localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
    round(_maxTime - time) <= 0 || isNull _this || life_request_timer};

    if (life_request_timer) then {
        _maxTime = time + (LIFE_SETTINGS(getNumber,"respawn_timer") * 2); //multiples the respawn time set in the master config file by 5, to create the new respawn time!
        waitUntil {_Timer ctrlSetText format [localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
        round(_maxTime - time) <= 0 || isNull _this};
    };

    life_request_timer = false; //resets increased respawn timer
    
    _RespawnBtn ctrlEnable true;
    _Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

_unit spawn {
    private ["_requestBtn","_requestTime"];
    disableSerialization;
    _requestBtn = ((findDisplay 7300) displayCtrl 7303);
    _requestBtn ctrlEnable false;
    _requestTime = time + 5;
    waitUntil {round(_requestTime - time) <= 0 || isNull _this};
    _requestBtn ctrlEnable true;
};

[] spawn life_fnc_deathScreen;

//Credits to Ciaran for original creation of the script
if(life_nlrtimer_running) then
{
life_nlrtimer_stop = true;
waitUntil {!life_nlrtimer_running};
};
[] spawn life_fnc_newLifeRule;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn {
    private ["_unit"];
    _unit = _this select 0;
    waitUntil {if (speed _unit isEqualTo 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if (!isNull _killer && {!(_killer isEqualTo _unit)} && {!(side _killer isEqualTo west)} && {alive _killer}) then {
    if (vehicle _killer isKindOf "LandVehicle") then {
        if (life_HC_isActive) then {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };

        //Get rid of this if you don't want automatic vehicle license removal.
        if (!local _killer) then {
            //[2] remoteExecCall ["life_fnc_removeLicenses",_killer];
        };
    } else {
        if (life_HC_isActive) then {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };

        if (!local _killer) then {
            //[3] remoteExecCall ["life_fnc_removeLicenses",_killer];
        };
    };
};

life_save_gear = [player] call life_fnc_fetchDeadGear;

if (LIFE_SETTINGS(getNumber,"drop_weapons_onDeath") isEqualTo 0) then {
    _unit removeWeapon (primaryWeapon _unit);
    _unit removeWeapon (handgunWeapon _unit);
    _unit removeWeapon (secondaryWeapon _unit);
};

//Killed by cop stuff...
if (side _killer isEqualTo west && !(playerSide isEqualTo west)) then {
    life_copRecieve = _killer;
    //Did I rob the federal reserve?
    if (!life_use_atm && {civRDM > 0}) then {
        [format [localize "STR_Cop_RobberDead",[civRDM] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        civRDM = 0;
    };
};

if (side _killer isEqualTo civilian && {_killer != _unit}) then {
	if (_killer in _BountyPeeps) then {
		life_bountyHunter = _killer;
	};
};	

if (!isNull _killer) then {
    life_removeBounty = true;
};

if (!isNull _killer && {!(_killer isEqualTo _unit)}) then {
    life_removeWanted = true;
};

[_unit] call life_fnc_dropItems;

life_action_inUse = false;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
civRDM = 0;
life_is_alive = false;
life_firstCombatActive = false;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC",RSERV];


if (!(isNull life_dog)) then {
	deleteVehicle life_dog;
};
life_dog = objNull;
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
if (playerSide isEqualTo civilian) then {
    [4] call SOCK_fnc_updatePartial;
};
