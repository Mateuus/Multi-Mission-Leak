#include "..\..\macros.hpp"
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
if (isNil "DWEV_lastPlayerDamage") then {DWEV_lastPlayerDamage = 0;};

DWEV_ezrequested = false;
_unit = param [0,ObjNull,[ObjNull]];
_killer = param [1,ObjNull,[ObjNull]];

if ((DWEV_lastPlayerDamage + 30) >= diag_tickTime && ((side player) != independent)) then // Spieler wurde getötet (Fallschaden / Erschossen / etc.)
{
	DWEV_playerRespawned = false;
}
else // Spieler hat den Respawn Knopf gedrückt
{
	DWEV_playerRespawned = true;
};

DWEV_playerDeathPos = (getPos player);
DWEV_playerDeathTime = serverTime;

profileNamespace setVariable ["DWEV_playerDeathPos",DWEV_playerDeathPos];
profileNamespace setVariable ["DWEV_playerDeathTime",DWEV_playerDeathTime];
profileNamespace setVariable ["DWEV_playerRespawned",DWEV_playerRespawned];

// Side player wird in dieser datei immer als Civ erkannt, playerside erkennt die richtige
[getPlayerUID player,1, playerside] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen

//[_unit, _killer] remoteExec ["DWEV_fnc_killLog",2];
[11,player,format ["%1 wurde von %2 getötet",getPlayerDName(_unit),getPlayerDName(_killer)]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

if((vehicle _unit) != _unit) then {
	UnAssignVehicle _unit;
	_unit action ["getOut", vehicle _unit];
	_unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

//Set some vars
pIayer = player;
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",getMyDName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["missingOrgan",FALSE,TRUE];
_unit setVariable["hasOrgan",FALSE,TRUE];

player removeWeapon (secondaryWeapon player);
player removeWeapon (primaryWeapon player);
player removeWeapon (handGunWeapon player);

DWEV_save_gear = [player] call DWEV_fnc_fetchDeadGear;


if(side _killer == west && vehicle _killer == _killer && (side player) == civilian && !DWEV_var_playerInPvpAreal) then
{
	[player,_killer,true] remoteExec ["DWEV_fnc_wantedBounty",2];
};


//Setup our camera view
DWEV_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
DWEV_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
DWEV_deathCamera camSetTarget _unit;
DWEV_deathCamera camSetRelPos [0,3.5,4.5];
DWEV_deathCamera camSetFOV .5;
DWEV_deathCamera camSetFocus [50,0];
DWEV_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	_requestMedicBtn = (findDisplay 7300) displayCtrl 7303;
	
	if (DWEV_SETTINGS(getNumber,"respawn_timer") < 5) then
	{
		_maxTime = time + 60;
    } else
	{
		_maxTime = time + DWEV_SETTINGS(getNumber,"respawn_timer");
    };
	_RespawnBtn ctrlEnable false;
	
	if (DWEV_var_playerInPvpAreal) then
	{
		_requestMedicBtn ctrlEnable false;
	} 
	else
	{
		_requestMedicBtn ctrlEnable true;
	};
	
	waitUntil {_Timer ctrlSetText format["Respawn verfügbar in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _this || DWEV_request_timer};
	
	if (DWEV_request_timer) then 
	{
		_maxTime = time + (DWEV_SETTINGS(getNumber,"respawn_timer") * 7);
		waitUntil {_Timer ctrlSetText format["Respawn verfügbar in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
		round(_maxTime - time) <= 0 || isNull _this};
	};
	DWEV_request_timer = false; //resets increased respawn timer
	
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText "Du kannst jetzt respawnen";
};

[] spawn DWEV_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; DWEV_deathCamera camSetTarget _unit; DWEV_deathCamera camSetRelPos [0,3.5,4.5]; DWEV_deathCamera camCommit 0;};
};

//Make the killer wanted
if (!DWEV_var_playerInPvpAreal) then
{
	if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then 
	{
		if(vehicle _killer isKindOf "LandVehicle") then 
		{
			[getPlayerUID _killer,getPlayerName(_killer),"187V"] remoteExec ["DWEV_fnc_wantedAdd",2];

			if(!local _killer) then 
			{
				[2] remoteExec ["DWEV_fnc_removeLicenses",_killer];
			};
		} 
		else 
		{
			[getPlayerUID _killer,getPlayerName(_killer),"187"] remoteExec ["DWEV_fnc_wantedAdd",2];
		};
	};

	//Killed by cop stuff...
	if(side _killer == west && (side player) != west) then 
	{
		DWEV_copRecieve = _killer;
	};
};

if(!isNull _killer && {_killer != _unit} && side _killer == west) then {
    DWEV_removeWanted = true;
};


_handle = [_unit] spawn DWEV_fnc_dropItems;
waitUntil {scriptDone _handle};

DWEV_hunger = 100;
DWEV_thirst = 100;
DWEV_carryWeight = 0;
dwf_cash = 0;
if (!isNil "DWEV_var_alcoholLevel") then {DWEV_var_alcoholLevel = 0;};
if (!isNil "DWEV_var_drugLevel") then {DWEV_var_drugLevel = 0;};

[player,DWEV_sidechat,(side player)] remoteExec ["DWF_fnc_managesc",2];

if (__GETC__(DWEV_adminlevel) > 0) then
{
	[player,true] remoteExec ["DWF_fnc_adminVonChannel",2];
};

[0] call SOCK_fnc_updatePartial;