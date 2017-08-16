#include <macro.h>
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer","_RespawnBtn","_Timer","_handle","_hours","_maxTime","_mins","_start"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
//_time = "0:00";
_this call PG_fnc_gearLog;

//Calc death time
/*
_start = (floor((missionStart select 3)/4))*4;
_hours = floor(serverTime/3600) + _start;
_mins = floor((serverTime/60) mod 60);
_time =  if (_mins > 9) then {format["%1:%2",_hours,_mins];} else {format["%1:0%2",_hours,_mins];};
*/
//if(missionStart select 3 > 2) then {_start = missionStart select 3} else {_start = 18};
//_time = format["%1:%2",(floor (serverTime/3600)+((floor((((missionStart select 3)-2 mod 24))/8))*8)+3)mod 24,floor((serverTime/60) mod 60)];


//Set some vars
_unit setVariable["DeathTime",round time,TRUE]; //Set the death time.
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["Requested",FALSE,TRUE]; //To make the medic markers reliable.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,1,2];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);

	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {
		_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		round(_maxTime - time) <= 0 OR isNull _this OR (life_request_cooldown > time)
	};
	if(life_request_cooldown <= time) then {
		_RespawnBtn ctrlEnable true;
		_Timer ctrlSetText localize "STR_Medic_Respawn_2";
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

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer == civilian} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"9"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[[2],"life_fnc_removeLicenses",_killer,FALSE] call life_fnc_MP;
		};
	} else {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"9"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;

		if(!local _killer) then {
			[[3],"life_fnc_removeLicenses",_killer,FALSE] call life_fnc_MP;
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {CASH > 0}) then {
		[format[localize "STR_Cop_RobberDead",[CASH] call life_fnc_numberText],"life_fnc_broadcast",true,false] call life_fnc_MP;
		CASH = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
CASH = 0;
[] call life_fnc_hudUpdate;
_unit SVAR["old_mobile_provider", player GVAR["mobile_provider", ""], true];
player SVAR["mobile_provider", "", true];

[] call life_fnc_hudUpdate; //Get our HUD updated.
//[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] call life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;

//send monitoring request
[[getPlayerUID player, _unit],"PGSERV_fnc_monitorCorpse",false,false] call life_fnc_MP;

//remove Weapons
private["_containers"];
_containers = nearestObjects[getPosATL _unit,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
{deleteVehicle _x;} foreach _containers; //Delete the containers.
_unit removeWeaponGlobal primaryWeapon _unit;