#include "..\..\macros.hpp"
/*
	File: fn_painballLobby.sqf
	Author: MarkusSR1984
	
	Description:
	Platziert den Spieler im Paintball Lobby Dome
*/
if (dwf_cash < 15000) exitWith {hint "Du hast nicht genug Geld dabei!";};

dwf_cash = dwf_cash - 15000;


// Speichern des Gears
//[] call DWEV_fnc_saveGear; ist eine doppelspeicherung, da updaterequest das savegear inklusive hat.
[] call SOCK_fnc_updateRequest;
DWEV_paintball_leafLobby = false;

// Das Gear vom Spieler Löschen

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
player forceAddUniform "U_I_Protagonist_VR"; // Mashall Kleidung (Weises Shirt)

{   // Inventar leeren
    missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
DWEV_carryWeight = 0;

player setVariable["DWEV_paintball_dome",true];
player setPos getMarkerPos "paintball_dome";
hint "Willkommen in der\n\nDivision Wolf\nPaintball Arena\n\nGehe zum Ausstatter um dein Team zu wählen, deine Waffen zu bekommen und um in die Arena zu gelangen";
DWEV_paintball_death = 0;
DWEV_paintball_kills = 0;
DWEV_paintball = true;