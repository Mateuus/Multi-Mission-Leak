/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Runs police patrol script
*/

private ["_payment","_ranks"];

_action = [
	"Make sure you have the permission of the highest ranking officer before beginning a police mission",
	"Police Missions",
	"Continue",
	"Exit"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(DS_copLevel < 4)exitwith{hint "Your rank is not high enough to begin this mission"};

if(DS_copMissionsActive)exitWith{hint "There is already a police mission active"};
if(DS_policeBank < 200000)exitwith{hint "There is not enough funds in the police bank to begin this (There must be at least $200k)"};
[] remoteExec ["HUNT_fnc_policePatrol",2];