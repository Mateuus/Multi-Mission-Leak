/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Opens the ticket menu
*/

private ["_civ","_dialog","_reason","_amount","_issueBtn","_priceBtn","_closeBtn"];

_civ = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(DS_copLevel == 0)exitwith {hint "You must be whitelisted to use this feature"};

_action = [
	"This is only allowed to be used if the civilian is giving out locations (Even his own) through voice",
	"Blindfold",
	"Continue",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

[] remoteExec ["DS_fnc_blindfolded",_civ];