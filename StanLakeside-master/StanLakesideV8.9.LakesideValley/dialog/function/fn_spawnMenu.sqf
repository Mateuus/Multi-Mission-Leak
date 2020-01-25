/*
	File: fn_spawnMenu.sqf
	
	
	Description:
	Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;
while{true} do {
	if(dialog) then {closeDialog 0;};
	if(!dialog) exitwith {};
};

player allowdamage true;
player setpos (getMarkerPos "respawn_west_1");

if(life_is_arrested) exitWith {
	[] call life_fnc_respawned;
};

if(life_respawned) then {
	[] call life_fnc_respawned;
};
if(!(createDialog "life_spawn_selection")) exitWith {[] call life_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

_spCfg = [playerSide] call life_fnc_spawnPointCfg;

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
	_ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
	_ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
	_ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
} foreach _spCfg;

_sp = _spCfg select 0; //First option is set by default

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];

player setvariable["playerInjuries",[0,0,0,0,0,0,0,0,0,0,0],true];
player setvariable["playerInjuriesToUpdate",[0,0,0,0,0,0,0,0,0,0,0],false];
deadPlayer = false;
shooting_death = false;


[player,"Revive",nil] call life_fnc_broadcastCheck;
[player,"name",nil] call life_fnc_broadcastCheck;
[player,"Reviving",nil] call life_fnc_broadcastCheck;
[player,"restrained",nil] call life_fnc_broadcastCheck;
[player,"restrained2",nil] call life_fnc_broadcastCheck;
[player,"severeInjuries",nil] call life_fnc_broadcastCheck;
player forceWalk false;

myhealth = 0;
player setdamage 0;

[] spawn {
	sleep 1;
	[player,""] remoteExecCall ["life_fnc_animsync"];
};