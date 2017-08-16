/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

2 cutFadeout 1;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["missingOrgan",FALSE,TRUE];
_unit setVariable["hasOrgan",FALSE,TRUE];

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

//Create a thread for something?
_unit spawn
{
	private["_maxtime","_RespawnBtn","_Timer","_medicsOnline"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	

	if((independent countSide playableUnits) > 0) then
	{
		if(playerside == independent) then {
			life_respawn_timer = 2;
		} else {
			life_respawn_timer = 8;
		};
	} else {
		life_respawn_timer = .1;
	};


	_maxtime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxtime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxtime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

_medicdisplay = ((findDisplay 7300) displayCtrl 7306);
_medicdistance = ((findDisplay 7300) displayCtrl 7307);

_medicdisplay ctrlEnable false;
_medicdistance ctrlEnable false;

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"] remoteExecCall ["SOA_fnc_wantedAdd",2];
		if(vehicle _killer == _killer) then {[2000,1] remoteExecCall ["life_fnc_exptoall",_killer]};
		[name _killer, name player,0,8] remoteExecCall ["life_fnc_logdat",2];
		
		if(!local _killer) then {
			[2] remoteExecCall ["life_fnc_removeLicenses",_killer];
		};
	} else {
		[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"] remoteExecCall ["SOA_fnc_wantedAdd",2];
		if(vehicle _killer == _killer) then {[2000,1] remoteExecCall ["life_fnc_exptoall",_killer]};
		[name _killer, name player,1,8] remoteExecCall ["life_fnc_logdat",2];
		
		if(!local _killer) then {
			[3] remoteExecCall ["life_fnc_removeLicenses",_killer];
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	[round(random(40000)),"Gott",3,false] remoteExecCall ["life_fnc_moneytransfer",_killer];
	[name _killer, name player,1,8] remoteExecCall ["life_fnc_logdat",2];
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_toilet = 0;
life_carryWeight = 0;
life_beatgeld = 0;

[player,true,playerSide] remoteExecCall ["SOA_fnc_managesc",2];
[9] call SOCK_fnc_updatePartial;