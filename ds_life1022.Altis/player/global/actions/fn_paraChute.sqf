/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Runs the virtual parachute script
*/

private ["_backpack","_backpackItems"];

if(DS_doingStuff)exitWith{};
if(((getPos player) select 2) < 100)exitWith{hint "You're not high enough to use this";};
if((player getVariable["restrained",false])||(player getVariable["escorted",false]))exitWith{hint "You can't do this while restrained";};

DS_skyDiving = true;
DS_doingStuff = true;

["chute",false,1] call DS_fnc_handleInventory;

_backpack = (backpack player);
_backpackItems = [];

if(!(_backpack isEqualTo ""))then {
	_backpack = backpack player;
	_backpackItems = backpackItems player;
	removeBackpack player;
};

hint "You're about to jump";
player addBackpack "B_Parachute";

//Eject them from their vehicle
player action ["Eject",vehicle player];
moveOut player;
sleep 1;

//Give them their stuff back once they're on the ground
waitUntil {isTouchingGround player};

if((typeOf (vehicle player)) isEqualTo "Steerable_Parachute_F")then {
	deleteVehicle (vehicle player);
};

sleep 1;

if(!(_backpack isEqualTo ""))then {
	removeBackpack player;
	player addBackpack _backpack;

	{
		[_x,true] call DS_fnc_equipItem;
	} forEach _backpackItems;
};

DS_doingStuff = false;
sleep 10;
DS_skyDiving = false;