/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Reports to the admins that a player believes he was RDM'd
*/

private ["_action","_reportButton"];

_action = [
	"Are you sure you want to do this, false complaints and spam will be dealt with harshly",
	"Claim RDM",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

_action = [
	"The admins will receive a message claiming you were RDM'd by the last person to kill you, if an admin is free they will watch the player in question",
	"Whats next",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

_action = [
	"For serious claims talk to an admin on TS, do not complain in sidechat about RDM and remember to record as much as you can for evidence",
	"Lets do it",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(DS_killer isEqualTo "")exitwith{systemchat "The person who killed you was not identified, therefore no message will be sent to the admins. Go to TS with the details if you wish"};

{
	if(_x getVariable "DSadmin")then
		{
		[[player,DS_killer],"DS_fnc_reportRDMAdmin",_x,false] spawn BIS_fnc_MP;
		};
}forEach PlayableUnits;

DS_killer = "";

_reportButton = ((findDisplay 666670) displayCtrl 2402);
_reportButton ctrlEnable false;