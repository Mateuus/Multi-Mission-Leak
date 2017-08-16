/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Warns/kicks pub cops who are out of bounds
*/

if(DS_copLevel < 5)exitwith{hint "Your rank is too low to use this"};
_action = [
	"This feature is only to be used when the wanted list is bugged and pressing 4 returns an empty list",
	"IMPORTANT READ",
	"Continue",
	"Nevermind"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
_action = [
	"After clicking continue the wanted list will remain empty until people are re-added to it through logging in or receiving more charges, no one will lose any of their current charges however",
	"WHAT HAPPENS",
	"Continue",
	"Nevermind"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
DS_wantedList = [];
publicVariable "DS_wantedList";
hint "The server side list of wanted players has been cleared, they will slowly get re-added to the global list - Do not try using this again thinking that it didn't work";
systemchat "The server side list of wanted players has been cleared, they will slowly get re-added to the global list - Do not try using this again thinking that it didn't work";