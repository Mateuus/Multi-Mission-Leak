/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Repairs buildings nearby to a players base flag
*/

private ["_action","_buildingarray","_pos"];

_action = [
	"Warning! This will repair all nearby buildings for a fee of $500,000. Continue?",
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if([500000,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to do this"};
[500000,true,false] call DS_fnc_handleMoney;

hint "Repairing, please wait....";
sleep 5;

_pos = (position player);

[[_pos],"DS_fnc_globalRepairs",true,true] spawn BIS_fnc_MP;

sleep 5;

hint "All building repaired and $500k removed from your bank";




















