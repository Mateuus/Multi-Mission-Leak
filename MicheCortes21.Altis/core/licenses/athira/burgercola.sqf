/*
	File: l_athira.sqf
	Author: Shriver

	Description:
	Vergibt Lizenzen # Script für michecortes.de - Twitch & Gaming Community # Keiner Verwendung ohne Erlaubnis # http://steamcommunity.com/profiles/76561198107872048/
*/

	if (playerSide != civilian) exitWith { hint "Du bist kein Zivilist."; };
	if (vehicle player != player) exitWith { hint "Nicht ausm Fahrzeug raus."; };
	if (!alive player) exitWith {};
	
	if (life_inv_burger > 0 && life_inv_softdrink > 0) then {
	
	"Auftrag" hintC [
	"Bürgermeister: Danke (MAMPF) (MAPF) Scheckt super !",
	"Bürgermeister: Hier hast du deine Lizenz."
];

[false,"softdrink",1] call life_fnc_handleinv;
[false,"burger",1] call life_fnc_handleinv;

sleep 5;

closeDialog 0;

sleep 1;

playsound "lizenz";

license_civ_athira = true;

cutText ["Glückwunsch, du kannst nun in Athira spawnen !", "BLACK IN", 10];

} else {

	hint " Wo ist mein Burger ? Und wo mein Softdrink ? Komm erst wieder wenn du beides hast !";
	
};