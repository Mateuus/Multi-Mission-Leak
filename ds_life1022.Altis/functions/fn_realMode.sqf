/*
    Darkside Life

	Authors: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Sets a player into realistic mode
*/

private ["_exit","_action"];

_exit = false;

/*
Force 1st person view
Can not fire held weapon over 6.5mm
Only visable on MCU and Security markers when within 50m
Highly nerfed flash effectiveness (all kart helmets, shimags and normal gas resistant helmets blocks most flash vision effects)
Highly nerfed tear gas effectiveness (all kart helmets, shimags and normal gas resistant helmets block tear gas effects)
Shorter respawn timer
50% more effective body armour
Can not be headshotted
25% off jail sentences
Shadows re-enabled
Scope sway always halved
Unrestrain loop 1/2 the time, meaning you will become unrestrained quicker if a police officer is not nearby you
Your vehicles become much harder to lockpick
You no longer hit animals when driving without lights on
Stay drunk for double the normal time (now 40 minutes)
You can revive and strangle without adv rebel training
50% extra payment for the followings jobs (Fuel Missions, Chopper Pilot, Crop Dusting, Truck Driving, Taxi Missions, Air Taxi, Boat Taxi, Drug Convoys, Car bombs
Very low detection rate when robbing gas station or hospitals with a helmet on

-- IED or rob id
*/

//if(DS_realModeArray isEqualType [])exitWith{hint "Some error occurred, you can not do this at this time"};
//if((getPlayerUID player) in DS_realModeArray)exitWith{hint "You have already switched between the two modes today - Come back after the next server restart"};

if(playerside != civilian)exitwith{hint "Civilians Only"};

if(isNil "DS_realModeSwitch")then {
	DS_realModeSwitch = false;
};

if(DS_realModeSwitch)exitWith{hint "You can not switch modes without relogging"};

if((DS_infoArray select 34) == 1)then {
	_action = [
		"You are currently in realistic mode, if you turn it off now you will not be able to re-enable it until after you relog",
		"Important",
		"Continue",
		"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitWith{_exit = true};
} else {
	_action = [
		"You are about to be switched into realistic mode. Make sure you read the details of this mode in the J menu first. Once enabled you will not be able to disable it until you have relogged",
		"Important",
		"Continue",
		"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitWith{_exit = true;};
};

if(_exit)exitWith{};

DS_realModeSwitch = true;

if((DS_infoArray select 13) == 18)then {
	[] spawn {
		sleep 10;
		[0] call DS_fnc_questCompleted;
	};
};

if((DS_infoArray select 34) == 1)exitWith {
	_sleep = random 2;
	sleep _sleep;
	DS_realMode = false;
	player setVariable ["realModeMan",false,true];
	DS_infoArray set [34,0];
	[] call DS_fnc_compileData;
	hint "Realistic mode disabled";
};

_sleep = random 2;
sleep _sleep;

hint "Realistic mode enabled";

DS_infoArray set [34,1];
[] call DS_fnc_compileData;
DS_realMode = true;
player setVariable ["realModeMan",true,true];

//Camera stuff
[] spawn  {
	while{true}do {
		waitUntil {(cameraView isEqualTo "EXTERNAL")};
		if(!DS_realMode)exitWith{};
		(vehicle player) switchCamera "INTERNAL";
	};
};