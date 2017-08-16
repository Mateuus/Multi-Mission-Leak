/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Runs the virtual parachute script
*/
private ["_true"];
_true = false;
DS_skydive_backpackItems = [];
//if(driver (vehicle player) == player)exitwith{hint "Only passengers can use this"};//Shouldn't even be an option
if(((getPos player) select 2) < 100)exitwith{hint "You're not high enough to use this"};
if((player getVariable["cuffed",FALSE])||(player getVariable["Escorted",FALSE])||(player getVariable["cuffedVeh",FALSE]))exitwith{hint "Hmm how do you think you can use this while you're restrained?"};
if(DS_doingStuff)exitwith{};
DS_skyDiving = true;
["chute",false,1] call DS_fnc_handleInventory;
DS_doingStuff = true;
if(backpack player != "")then
	{
	_true = true;
	DS_skydive_backpack = backpack player;
	DS_skydive_backpackItems = backpackItems player;
	};
hint "You're about to jump";
//Take a nap
sleep 0.2;
_vehicle = (vehicle player);
player addBackpack "B_Parachute";
player action ["Eject", vehicle player];
sleep 2;
if((vehicle player) == _vehicle)then
	{
	player action ["getOut", vehicle player];
	};
sleep 2;
//Save their view distance then increase it
_currentView = viewDistance;
setViewDistance 3000;
//Give them their stuff back once they're on the ground
	while{true}do
		{
		if(isTouchingGround player)exitwith{};
		sleep 1;
		};
	if(_true)then
		{
		removeBackpack player;
		player addBackpack DS_skydive_backpack;
		clearBackpackCargo player;
		{
			[_x,true] call DS_fnc_equipItem;
		} foreach DS_skydive_backpackItems;
		};
	setViewDistance _currentView;
	DS_doingStuff = false;
	sleep 10;
	DS_skyDiving = false;
