/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Reports a bug to the error log
*/
disableSerialization;
private ["_action","_title","_bug","_bug2"];
_dialog = findDisplay 666687;
_title = _dialog displayCtrl 1400;
_bug = _dialog displayCtrl 1401;
_bug2 = _dialog displayCtrl 1402;

_title = ctrlText _title;
_bug = ctrlText _bug;
_bug2 = ctrlText _bug2;

if((_title isEqualTo "")||(_bug isEqualTo "")||(_bug2 isEqualTo ""))exitwith{hint "Enter all fields or else!"};

_action = [
	"Using this feature for anything other than its intended purpose will be met with a 1 week ban. This features only purpose is to report bugs found in the mission file (Not Arma bugs). Make sure you provide as much information as possible",
	"Warning!",
	"Continue",
	"Nevermind"
] call BIS_fnc_guiMessage;
if(!_action)exitwith {};

[[_title,_bug,_bug2,player],"HUNT_fnc_reportBug",false,false] spawn BIS_fnc_MP;
closeDialog 0;
hint "Bug report sent";
{
	if(_x getVariable ["DSAdmin",false])then
		{
		[[(name player),"Reported a bug"],"DS_fnc_DarkSide_ShowAll",_x,false] spawn DS_fnc_MP;
		};
}forEach playableUnits;







