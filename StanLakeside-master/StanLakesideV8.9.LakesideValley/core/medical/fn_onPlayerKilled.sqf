/*
	fn_onPlayerKilled.sqf
*/

disableSerialization;

[] spawn {
	_curWep = currentWeapon player;
	if(_curWep != "" && vehicle player == player) then {
		_chance = round (random 5);
		while{_chance > 0} do {
			player forceWeaponFire [_curWep, "Single"];
			_chance = _chance - 1;
		};
	};
};

if(deadplayer) exitwith {};
deadPlayer = true;

if(vehicle player == player) then {
	[player,"DeadState"] remoteExecCall ["life_fnc_animsync"];
};

if(vehicle player != player) then {
	[player,"KIA_commander_MRAP_03"] remoteExecCall ["life_fnc_animsync"];	
};

player allowdamage false;
player setVariable ["tf_unable_to_use_radio", true];
im_dead = true;
params [["_unit", objNull, [objNull]], ["_killer", objNull, [objNull]], ["_length", 0, [0]]];

player setVariable ["tf_voiceVolume", 0, true];
life_gear = [];
player setVariable["gear",life_gear,true];

_length = 15 - _length;
_length = round(_length);
if(_length > 15) then { _length = 15; };
if(_length < 8) then { _length = 8; };
life_respawn_timer = _length;
player setVariable["severity", _length, true];

[player,"restrained",nil] call life_fnc_broadcastCheck;
[player,"restrained2",nil] call life_fnc_broadcastCheck;
[player,"tied",nil] call life_fnc_broadcastCheck;

[_unit,"Revive",nil] call life_fnc_broadcastCheck;
[_unit,"Escorting",nil] call life_fnc_broadcastCheck;
[_unit,"transporting",nil] call life_fnc_broadcastCheck;

_unit setVariable["dead",true,true];
_unit setVariable["name",profileName, true]; //Set my name so they can say my name.
_unit setVariable["steam64id",(getPlayerUID player), true]; //Set the UID.
_unit setVariable ["EMSON", 1, true];

_playerkill = false;
_killdistance = round ((_unit distance _killer) * 10) / 10;
_killweapon = (configfile >> "CfgWeapons" >> currentWeapon _killer >> "displayName") call BIS_fnc_getCfgData;
_fuck = name _killer;
_you = name _unit;

if(_fuck != _you) then {
	if(_fuck find "Error: " != -1) then {
		[format["%1 jest ciezko ranny!", _you], false] spawn domsg; 
		[player,"pain2"] spawn life_fnc_nearestSound;
		shooting_death = false;
	} else {
		[format["%1 downed %2 at a distance of %3 with weapon: %4.", _fuck, _you, _killdistance, _killweapon], false] spawn domsg; 
		life_kcCamera  = "CAMERA" camCreate (getPosATL _killer); 
		showCinemaBorder true;    
		life_kcCamera cameraEffect ["EXTERNAL", "BACK"];  
		life_kcCamera camSetTarget _killer;    
		life_kcCamera camSetRelPos [0,5,1];    
		life_kcCamera camSetFOV .85;    
		life_kcCamera camSetFocus [50,1];    
		life_kcCamera camCommit 0;
		[player,"pain1"] spawn life_fnc_nearestSound;
		_playerkill = true;
		shooting_death = true;
	};
} else {
	shooting_death = false;
	[format["%1 wykrwawia sie!", _fuck], false] spawn domsg; 
	[player,"pain2"] spawn life_fnc_nearestSound;
};

if(_playerkill) then { 
	sleep 7;

	life_kcCamera cameraEffect ["TERMINATE","BACK"];

	camDestroy life_kcCamera;
};

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder FALSE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,22,22];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;
(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == (_this select 1)) then {true}"]; //Block the ESC menu
//Create a thread for something?

_unit spawn
{
	private["_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; round(maxTime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
	if(shooting_death && round(maxTime - time) <= 0) exitwith { closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu; };			
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	params ["_unit"];
	while { deadPlayer } do { life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,22,22]; life_deathCamera camCommit 0; uisleep 0.05; };
	sleep 1;
	life_deathCamera cameraEffect ["TERMINATE","BACK"];
	camDestroy life_deathCamera;
};

if(!isNull _killer && {_killer != _unit}) then {
	if(side _killer != west) then {
		_reason = "187";
		[_killer,_unit,_reason] spawn life_fnc_createEvidence;
	};
};

["Add","Food",100] spawn fnc_sustain;
["Add","Drink",100] spawn fnc_sustain;
player setdamage 0; 
[player,life_sidechat,playerSide] remoteExecCall ["TON_fnc_managesc",2];


[] spawn {
	while{true} do {
		sleep 1;
		if( vehicle player == player && animationstate player != "deadstate" ) then {  [player,"DeadState"] remoteExecCall ["life_fnc_animsync"]; };
		player setOxygenRemaining 1;
		if(!deadPlayer) exitwith {};
	};
};