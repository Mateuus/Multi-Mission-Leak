/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.

*/

private["_message","_action"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if(license_civ_presse) exitWith {

_message = ctrlText 9001;


[3,format ["EILMELDUNG: %2",name player,_message]] remoteExecCall ["life_fnc_broadcast",0];
closedialog 0;
 
};

if(life_level >= 4 && !license_civ_presse) then {
_action = [
	"AAN kosten 150.000€ pro Nachricht!",
	"150.000€ (Kreditkarte) in Kauf nehmen",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(!_action) exitWith {closedialog 0};
if(life_beatbankgeld < 150000) exitWith {hint "Du kannst dir die Nachricht nicht leisten!"};
life_beatbankgeld = life_beatbankgeld - 150000;

_message = ctrlText 9001;

[3,format ["EILMELDUNG: %2",name player,_message]] remoteExecCall ["life_fnc_broadcast",0];
closedialog 0;
 
} else {hint "Du musst mindestens Level 4 erreicht haben um AAN Nachrichten versenden zu können!"};