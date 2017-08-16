/*
	File: l_athira.sqf
	Author: Shriver

	Description:
	Vergibt Lizenzen # Script für michecortes.de - Twitch & Gaming Community # Keiner Verwendung ohne Erlaubnis # http://steamcommunity.com/profiles/76561198107872048/
*/

	if (playerSide != civilian) exitWith { hint "Du bist kein Zivilist."; };
	if (vehicle player != player) exitWith { hint "Nicht ausm Fahrzeug raus."; };
	if (!alive player) exitWith {};

	"HILFE" hintC [
	"Du hast momentan keine Berechtigung diesen Shop zu verwenden!",
	"Warum hast du keine Berechtigung ?",
	"1. Dir fehlt die Lizenz um auf den Shop zugreifen zu können.",
	"2. Du besitzt nicht genug (XP).",
	"3. Du bist an einem Shop, welcher nicht für deine Fraktion geeignet ist.",
	"TIPP : Meist fehlt die Lizenz , um den Shop benutzen zu können !"
];
 
	
