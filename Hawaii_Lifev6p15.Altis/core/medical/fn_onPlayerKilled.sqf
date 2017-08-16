#include "..\..\script_macros.hpp"
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
params [
	["_unit",objNull,[objNull]],
	["_killer",objNull,[objNull]]
];
disableSerialization;
[10] call SOCK_fnc_updatePartial;

if((vehicle _unit) != _unit) then {
	UnAssignVehicle _unit;
	_unit action ["getOut", vehicle _unit];
	_unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

if(playerSide == civilian) then {life_is_alive = false;[8] call SOCK_fnc_updatePartial;};
//Set some vars
_unit SVAR ["Revive",true,true];
_unit SVAR ["name",profileName,true]; //Set my name so they can say my name.
_unit SVAR ["restrained",false,true];
_unit SVAR ["masked",false,true];
_unit SVAR ["Escorting",false,true];
_unit SVAR ["transporting",false,true]; //Why the fuck do I have this? Is it used?
_unit SVAR ["playerSurrender",false,true];
_unit SVAR ["steam64id",(getPlayerUID player),true]; //Set the UID.

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
closeDialog 0;
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu
_unit spawn {
	private["_maxTime","_RespawnBtn","_Timer","_requestBtn"];
	disableSerialization;

//Create a thread for something?
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_requestBtn = ((findDisplay 7300) displayCtrl 7303);
	_Timer = ((findDisplay 7300) displayCtrl 7301);

	_medicsOnline = {_x != player && side _x == independent} count playableUnits;
	if(_medicsOnline > 0)then{
		life_respawn_timer = 5;
		_requestBtn ctrlEnable true;
	}else{
		life_respawn_timer = 0.2;
		_requestBtn ctrlEnable false;
	};
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn {
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer) then {
	if(_killer != _unit) then {
		if(side _killer != west) then {
			if(alive _killer) then {
				if(vehicle _killer isKindOf "LandVehicle") then {
					[getPlayerUID _killer,_killer GVAR ["realname",name _killer],"187V"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
					//Get rid of this if you don't want automatic vehicle license removal.
					if(!local _killer) then {
						[2] remoteExecCall ["life_fnc_removeLicenses",_killer];
					};
				} else {
					[getPlayerUID _killer,_killer GVAR ["realname",name _killer],"187"] remoteExecCall ["life_fnc_wantedAdd",RSERV];

					if(!local _killer) then {
						[3] remoteExecCall ["life_fnc_removeLicenses",_killer];
					};
				};
			};
		};
	};
};

//Killed by cop stuff...
if(side _killer == west) then {
	if(playerSide != west) then {
		life_copRecieve = _killer;
		//Did I rob the federal reserve?
		if(!life_use_atm) then {
			if(CASH > 0) then {
				[format[localize "STR_Cop_RobberDead",[CASH] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
				CASH = 0;
			};
		};
	};
};

if(!isNull _killer) then {
	if(_killer != _unit) then {
		life_removeWanted = true;
	};
};
if(side _killer == civilian) then {
	life_civGetKill = _killer;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
CASH = 0;

[player,life_sidechat,playerSide] remoteExecCall ["TON_fnc_managesc",RSERV];

[0] call SOCK_fnc_updatePartial;
