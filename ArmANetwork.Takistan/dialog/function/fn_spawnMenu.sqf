/*
	Arma.Network
	Exclusively made for ArmA.Network
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;

if(life_is_arrested) exitWith {
	[] call life_fnc_respawned;
};

if(life_respawned) then {
	[] call life_fnc_respawned;
};
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
if(!(createDialog "life_spawn_selection")) exitWith {[] call life_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

[] spawn life_fnc_loadOptions;

[((findDisplay 38500) displayCtrl 38502),1,0.1,getPos player] call life_fnc_setMapPosition;
