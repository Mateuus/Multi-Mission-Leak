/*
	File: fn_painballLeafLobby.sqf
	Author: MarkusSR1984
	
	Description:
	Platziert den Spieler im Paintball Lobby Dome
*/

hint "Bis bald, komm bald wieder";

// Das Paintball Gear vom Spieler Löschen
[] spawn
{
	player allowdamage false;
	uisleep (random (1));
	if (DWEV_paintball_leafLobby) exitWith {};
	DWEV_paintball_leafLobby = true;


	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;


	// Das Gear des Spielers Wiederherstellen
	[true] call DWEV_fnc_loadGear;

	// Spieler wieder auf freien Fuß setzen
	player setVariable["DWEV_paintball_dome",false];
	player setVariable["DWEV_paintball_arena",false];
	player setVariable["DWEV_paintball_sidelock",false];
	player setVariable["pballSide",""];
	player allowdamage true;
};

player setPos getMarkerPos "DWEV_spawn_paintball"; // SpawnPosition Paintball nehmen
player setVariable["DWEV_paintball_transfer",false];
DWEV_paintball = false;
