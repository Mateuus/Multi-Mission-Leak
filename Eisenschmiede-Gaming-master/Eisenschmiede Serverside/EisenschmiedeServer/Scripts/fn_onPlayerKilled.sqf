#include "..\script_macros.hpp"
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer","_killerWeapon","_cashBeforeDeath","_toLog"];

params [
	["_unit",objNull,[objNull]],
	["_killer",objNull,[objNull]]
];

disableSerialization;

ES_medicRequest = true;
ES_corpse = _unit;
_gear = [ES_gear] call ES_fnc_mresArrayKillLog;


ES_deathWeapons = [];
{
	ES_deathWeapons pushBack (weaponsItems _x);
	deleteVehicle _x;
} forEach nearestObjects [ES_corpse, ["WeaponHolderSimulated", "WeaponHolder","GroundWeaponHolder"], 15];

//Set some vars
_unit setVariable ["Revive",FALSE,TRUE];
_unit setVariable ["name",profileName,TRUE];
_unit setVariable ["SteamName",profileNameSteam,TRUE];
_unit setVariable ["restrained",FALSE,TRUE];
_unit setVariable ["Revivable",FALSE,TRUE];
_unit setVariable ["Escorting",FALSE,TRUE];
_unit setVariable ["transporting",FALSE,TRUE];
_unit setVariable ["steam64id",(getPlayerUID player),true];
_unit setVariable ["missingOrgan",FALSE,TRUE];
_unit setVariable ["hasOrgan",FALSE,TRUE]; 
_unit setVariable ["medideadtime",serverTime,true];

_cashBeforeDeath = ES_cash;

if(!isNull _killer && _killer != _unit) then
{
	if([vehicle _killer, ["Car", "Air", "Ship", "Tank"]] call ES_fnc_isKindOf) then
	{
		_killerWeapon = format["%1 (Fahrzeug)", getText(configFile >> "CfgVehicles" >> typeOf (vehicle _killer) >> "displayName")];
	}
	else
	{
		if(isPlayer _killer) then
		{
			_config = [currentWeapon _killer] call ES_fnc_fetchCfgDetails;
			if(count _config > 1) then
			{
				_killerWeapon = _config select 1;
				ES_cash = 0;
			}
			else
			{
				_killerWeapon = "(?)";
			};
		}
	};
	
	if(isNil {_killerWeapon}) then
	{
		_killerWeapon = "(?)";
	};	
	
	_toLog = format ["%1 (%2) wurde von %3 (%4) aus %5m mit einer %6 getötet. Bargeld: %7 $ Gear: %8",
					_unit getVariable["realname","Unknown"], 
					getPlayerUID player, 
					_killer getVariable["realname",""], 
					getPlayerUID _killer, 
					[floor( _killer distance _unit)] call ES_fnc_numberText, 
					_killerWeapon, 
					[_cashBeforeDeath] call ES_fnc_numberText, 
					_gear];
}
else
{
	_toLog = format ["%1 (%2) wurde getötet. Bargeld: %3 $ Gear: %4",
					_unit getVariable["realname","Unknown"], 
					getPlayerUID player,	
					[_cashBeforeDeath] call ES_fnc_numberText, 
					_gear];
};	

["KILL_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

_text = "";
if(!isNull _killer) then {
	if(isPlayer _killer) then {
		if(_killer == player) then {
			_text = "Unbewusste durch Selbst induzierten Schäden.";
		} else {
			_text = format["Gestorben wegen %1",name _killer];
		};
	} else {
		_text = "Gestorben Aufgrund unbekannter Ursache.";
	};
} else {
	_text = "Unbewusste durch Selbst induzierten Schäden.";
};
[_unit,_text] call ES_fnc_medilogSubmit;

//Setup our camera view
ES_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
ES_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
[] spawn ES_fnc_deathScreen;
ES_deathCamera camSetTarget _unit;
ES_deathCamera camSetRelPos [0,3.5,4.5];
ES_deathCamera camSetFOV .5;
ES_deathCamera camSetFocus [50,0];
ES_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

((findDisplay 7300) displayCtrl 7303) ctrlSetEventHandler ["ButtonDown",
"
    [] spawn
    {
        _bool = [
            ""Möchtest du wirklich einen Feuerwehrman/frau rufen? Deine Respawnzeit erhöht sich dadurch um 10 Minuten."",
            ""Feuerwehr rufen"",
            ""Ja"",
            ""Nein""
        ] call BIS_fnc_guiMessage;
        if(!_bool) exitWith {};
        [] call ES_fnc_requestMedic;
    };
"
];

//Create a thread for something?
_unit spawn {
	private["_RespawnBtn","_RequestBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_RequestBtn = ((findDisplay 7300) displayCtrl 7303);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
	ES_maxTime = time + (ES_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(ES_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(ES_maxTime - time) <= 0 || isNull _this};

	_RespawnBtn ctrlEnable true;
	_RequestBtn ctrlEnable false;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn {
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; ES_deathCamera camSetTarget _unit; ES_deathCamera camSetRelPos [0,3.5,4.5]; ES_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExec ["ES_fnc_wantedAdd",2];
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[2] remoteExec ["ES_fnc_removeLicenses",_killer];
		};
	} else {
		[getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExec ["ES_fnc_wantedAdd",2];
		
		if(!local _killer) then {
			[3] remoteExec ["ES_fnc_removeLicenses",_killer];
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	ES_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!ES_use_atm && {ES_cash > 0}) then {
		[format[localize "STR_Cop_RobberDead",[ES_cash] call ES_fnc_numberText]] remoteExec ["ES_fnc_broadcast",-2];
		ES_cash = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	ES_removeWanted = true;
};

_handle = [_unit] spawn ES_fnc_dropItems;
waitUntil {scriptDone _handle};

ES_hunger = 100;
ES_thirst = 100;
ES_carryWeight = 0;
ES_cash = 0;

[player,ES_sidechat,playerSide] remoteExec ["ES_fnc_managesc",2];

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;