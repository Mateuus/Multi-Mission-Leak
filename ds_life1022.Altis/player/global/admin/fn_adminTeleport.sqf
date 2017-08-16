/*
	Darkside Life

	Author: ColinM9991

	Description:
	Teleports the player to a selected location on the map
*/

private ["_player","_targets"];

if((DS_adminLevel < 4)||(!((getPlayerUID player) in DS_adminList4)))exitWith{closeDialog 0;};

_player = (name player);

[] spawn {
  	while {dialog} do {
   		closeDialog 0;
   		sleep 0.01;
  	};
};

DS_fnc_mapTeleport = {
	(vehicle player) setPos (_this select 0);
	onMapSingleClick "";
	openMap [false,false];
	hint "You have teleported to your selected position";
};

openMap [true,false];
onMapSingleClick "[_pos] call DS_fnc_mapTeleport;";

if(DS_adminLevel < 4)then {
    _targets = allPlayers select {_x getVariable ["DSAdmin",false]};
    [_player,"Teleport"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];
};