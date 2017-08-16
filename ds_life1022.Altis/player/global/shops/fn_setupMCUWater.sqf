/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Starts the process of obtaining the police MCU
*/

private ["_spawn","_action"];

_spawn = DS_spawnPoint select 0;

if(DS_copLevel < 4)exitWith{hint "Your police level is not high enough to retrieve this"};
if(police_command_unitActive)exitWith{hint "This is already activated"};

_action = [
    "The Mobile Command Unit costs $100,000 from the police bank to get out, would you like more information?",
    "Mobile Command Unit",
    "Yes",
    "No"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

_action = [
    "You will have to protect the M.C.U and return it when it's no longer in use. This version is unarmed",
    "Sea Mobile Command Unit",
    "Retrieve",
    "Exit"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

//Fail checks
if(DS_policebank < 100000)exitWith{hint "There is not enough funds in the police bank Account to retrieve this vehicle";};
if(count(nearestObjects[(getMarkerPos _spawn),["Car","Ship","Air"],15]) != 0)exitWith{hint "There is a vehicle blocking the spawn point";};

//Remove payment from police bank
[100000,false] remoteExec ["HUNT_fnc_policeBank",2];

police_command_unitActive = true;
publicVariable "police_command_unitActive";

//Spawn in convoy vehicle
[_spawn] remoteExec ["HUNT_fnc_spawnMCUWater",2];