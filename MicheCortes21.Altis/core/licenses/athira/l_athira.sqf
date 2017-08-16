/*
	File: l_athira.sqf
	Author: Shriver

	Description:
	Vergibt Lizenzen # Script für michecortes.de - Twitch & Gaming Community # Keiner Verwendung ohne Erlaubnis # http://steamcommunity.com/profiles/76561198107872048/
*/

	if (playerSide != civilian) exitWith { hint "Du bist kein Zivilist."; };
	if (vehicle player != player) exitWith { hint "Nicht ausm Fahrzeug raus."; };
	if (!alive player) exitWith {};
	
sleep 1;
	
	"Gespraech mit dem Bürgermeister" hintC [
	"Du: Guten Tag, Herr Bürgermeister ?",
	"Bürgermeister: Sie brauchen garnicht erst anfangen zu reden !",
	"Bürgermeister: Sie wollen wohl wie alle anderen auch in meiner Stadt aufwachen ? ( Spawnen )",
	"Du: Ja genau !",
	"Bürgermeister: Naja und was genau bekomme ich von dir ?"
];

sleep 10;
closeDialog 0;
sleep 1;

_action = [
    localize "STR_Global_Auftrag",
    localize "STR_Global_Schrift",
    localize "STR_Global_Geld",
    localize "STR_Global_happymeal"
] call BIS_fnc_guiMessage;
	
if (_action) then {

sleep 1;

	"Gespraech mit dem Bürgermeister" hintC [
	"Bürgermeister: Naja Geld habe ich genug...",
	"Bürgermeister: Wie wäre es mit einem Happy Meal ?"
];

sleep 10;
closeDialog 0;
sleep 1;

	"Auftrag" hintC [
	"1. Kaufe einen Burger & ein Softdrink.",
	"2. Bringe alles zu dem Bürgermeister von Athira."
];



 } else { 
 
closeDialog 0;
sleep 1;
 
 	"Auftrag" hintC [
	"1. Kaufe einen Burger & ein Softdrink.",
	"2. Bringe alles zu dem Bürgermeister von Athira."
];

};

	_kek = _this select 2;
	_unit = _this select 0;
	
_unit removeAction _kek;
	

	
	_kek = a1 addAction["Gegenstände abgeben ","core\licenses\athira\burgercola.sqf"];


 
	
