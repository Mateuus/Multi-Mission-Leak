/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Starts the process of obtaining the police MCU
*/
private ["_spawn"];
_spawn = DS_spawnPoint select 0;
if(DS_copLevel < 4)exitwith{hint "Your police level is not high enough to retrieve this"};
if(police_command_unitActive)exitwith{hint "This is already activated"};

_action = [
"The Mobile Command Unit cost $50,000 from the police bank to get out, would you like more information?",
"Mobile Command Unit",
"Yes",
"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

_action = [
"You will have to protect the M.C.U and return it when it's no longer in use. Its weapons are both live and stun rounds and are permitted to be used at any time",
"Mobile Command Unit",
"Retrieve",
"Exit"
] call BIS_fnc_guiMessage;
		
//Fail checks
if(!_action)exitwith{};
if(DS_policebank < 50000)exitwith{hint "There is not enough funds in the police bank Account to retrieve this vehicle";};
if(count(nearestObjects[(getMarkerPos _spawn),["Car","Ship","Air"],15]) != 0) exitWith {hint "There is a vehicle blocking the spawn point";};
	
//Remove payment from police bank
[[50000,false],"HUNT_fnc_policeBank",false,false] spawn DS_fnc_MP;
police_command_unitActive = true;
publicVariable "police_command_unitActive";	
//Spawn in convoy vehicle
[[_spawn],"HUNT_fnc_spawnMCU"] spawn DS_fnc_MP;
















