/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Reports a bug to the server
*/

private ["_dialog","_title","_bug","_bug2","_filter","_action","_targets"];

disableSerialization;

_dialog = findDisplay 666687;
_title = _dialog displayCtrl 1400;
_bug = _dialog displayCtrl 1401;
_bug2 = _dialog displayCtrl 1402;

_filter = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,.:;(){}[]|<>/\!^&*-_=+ ";
_title = [ctrlText _title,_filter] call BIS_fnc_filterString;
_bug = [ctrlText _bug,_filter] call BIS_fnc_filterString;
_bug2 = [ctrlText _bug2,_filter] call BIS_fnc_filterString;

if((_title isEqualTo "")||(_bug isEqualTo "")||(_bug2 isEqualTo ""))exitWith{hint "Enter all fields or else!"};

_action = [
	"Using this feature for anything other than its intended purpose will be met with a 1 week ban. This features only purpose is to report bugs found in the mission file (Not Arma bugs). Make sure you provide as much information as possible",
	"Warning!",
	"Continue",
	"Nevermind"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

[_title,_bug,_bug2,player] remoteExec ["HUNT_fnc_reportBug",2];

closeDialog 0;
hint "Bug report sent";

_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
if(!(_targets isEqualTo []))then{[(name player),"Reported a bug"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];};