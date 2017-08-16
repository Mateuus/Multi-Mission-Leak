/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Parachutes the player out of a virtual plane
*/

private ["_action","_backpack","_backpackItems","_pos"];

_action = [
	"Go skydiving?",
	"Warning",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(DS_doingStuff)exitWith{};
if([player,200,west] call DS_fnc_nearbyPlayers)exitWith{titleText ["You can not do this while there is a police officer nearby","PLAIN"];};

if(DS_coin < 500)exitWith{hint "You do not have $500 to skydive!";};
[500,false,false] call DS_fnc_handleMoney;

DS_skyDiving = true;
DS_doingStuff = true;

_backpack = (backpack player);
_backpackItems = [];

if(!(_backpack isEqualTo ""))then {
	_backpack = backpack player;
	_backpackItems = backpackItems player;
	removeBackpack player;
};

_pos = getPosATL player;
_pos set [2,4800];

cutText ["","BLACK OUT",5];

sleep 3;

player say3D "plane";
cutText ["You are now arriving at the drop zone. Prepare to jump!","BLACK FADED"];
0 cutFadeOut 999999;

sleep 1;

player setVelocity [0,0,0];
player setPos (getMarkerPos "respawn_civilian"); //Send them to a island to play the audio to simulate the plane
player addBackpack "B_Parachute";

sleep 5;

player setPosATL _pos;
cutText ["","PLAIN"];

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

if((DS_infoArray select 13) == 4)then {
	[0] call DS_fnc_questCompleted;
};