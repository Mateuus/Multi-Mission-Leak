/*
	File: fn_paintballLeafArena.sqf
	Author: MarkusSR1984
	
	Description:
	Die Arena Verlassen
*/


_msg = param [0,"",[""]];

hint _msg;
player removeAction DWEV_paintballExitAction;

uisleep (random(0.5));
if (DWEV_paintballLeafArena) exitWith {};
DWEV_paintballLeafArena = true;


	player setVariable["DWEV_paintball_dome",true];
	player setVariable["DWEV_paintball_transfer",true];
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
//	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
//	player forceAddUniform "U_I_Protagonist_VR";

	player setPos getMarkerPos "paintball_dome";
	player setVariable["DWEV_paintball_arena",false];
	player setVariable["DWEV_paintball_outofarena",false];
	DWEV_paintball_death = DWEV_paintball_death + 1;
	
[] spawn
{	
	sleep 2;
	player setVariable["DWEV_paintball_transfer",false];
	DWEV_paintballLeafArena = false;
};						