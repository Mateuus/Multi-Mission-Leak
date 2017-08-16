/*
	File: fn_slotPlay.sqf
	Author: stuffz - CheapSuit Inc
	
	Desc:
	Starts up the slot
*/

private["_display","_slots","_play","_rowaIndex","_rowbIndex","_rowcIndex","_handle","_price"];

// Check the current play price
_price = switch((life_casino_slotmachine select 3)) do
{
	case "highroller": { 10000; };
	case "averageroller": { 1000; };
	case "hoboroller": { 100; };
	default { 100; };
};

// Check if we have enough money to play on this machine
if(GTA_money_cash < _price) exitWith { hint format["You do not have enough money to use this slot machine, you need at least (£%1)",[_price] call life_fnc_numberText]; };
GTA_money_cash = GTA_money_cash - _price;

// Error checking
if(!dialog) exitWith {};
if(life_action_gather) exitWith {};

// Local varibles - using life_action_gather because I'm lazy
life_action_gather = true;
life_casino_rowa = true;
life_casino_rowb = true;
life_casino_rowc = true;
life_casino_done = false;

disableSerialization;
waitUntil {!isNull findDisplay 41000};

// Setup the UI
_display = findDisplay 41000;
_slots = [(_display displayCtrl 41003),(_display displayCtrl 41004),(_display displayCtrl 41005)];

// Disable the play button while rolling
_play = _display displayCtrl 41006;
_play ctrlEnable false;

// Start the sound of pulling down the arm
[[(life_casino_slotmachine select 0), "slot_pull", 5],"life_fnc_playSound",true,false] call GTA_fnc_remoteExec;

// Start "rolling" the first row
[_slots] spawn 
{
	private["_slots","_countIcons"];
	_slots = (_this select 0);
	_countIcons = (count life_casino_slotIcons) + 1;
	
	while {life_casino_rowa} do
	{
		(_slots select 0) ctrlSetText (life_casino_slotIcons select (floor(random _countIcons)));
		sleep 0.07;
	};
	
	[[(life_casino_slotmachine select 0), "slot_roll_stop", 5],"life_fnc_playSound",true,false] call GTA_fnc_remoteExec;
};

// Start "rolling" the second row
[_slots] spawn 
{
	private["_slots","_countIcons"];
	_slots = (_this select 0);
	_countIcons = (count life_casino_slotIcons) + 1;
	
	while {life_casino_rowb} do
	{
		(_slots select 1) ctrlSetText (life_casino_slotIcons select (floor(random _countIcons)));
		sleep 0.07;
	};
	
	[[(life_casino_slotmachine select 0), "slot_roll_stop", 5],"life_fnc_playSound",true,false] call GTA_fnc_remoteExec;
};

// Start "rolling" the third row
[_slots] spawn 
{
	private["_slots","_countIcons"];
	_slots = (_this select 0);
	_countIcons = (count life_casino_slotIcons) + 1;
	
	while {life_casino_rowc} do
	{
		(_slots select 2) ctrlSetText (life_casino_slotIcons select (floor(random _countIcons)));
		sleep 0.07;
	};
	
	[[(life_casino_slotmachine select 0), "slot_roll_stop", 5],"life_fnc_playSound",true,false] call GTA_fnc_remoteExec;
};

// Gradually stop our "rolling" rows
_handle = [] spawn
{
	sleep 3;
	life_casino_rowa = false;
	
	sleep 1.5;
	life_casino_rowb = false;
	
	sleep 1.5;
	life_casino_rowc = false;
	
	sleep 0.3;
};

// Wait until rolling is done
waitUntil {scriptDone _handle};
sleep 0.3;

// Get what the rows stopped on
_rowaIndex = life_casino_slotIcons find (ctrlText (_slots select 0));
_rowbIndex = life_casino_slotIcons find (ctrlText (_slots select 1));
_rowcIndex = life_casino_slotIcons find (ctrlText (_slots select 2));

// Check if we won anything
[_rowaIndex,_rowbIndex,_rowcIndex] call life_fnc_slotReward;
sleep 0.1;

// Casino script now done
life_casino_done = true;
waitUntil { life_casino_done };

// Extra things against spamming
sleep 0.1;
life_action_gather = false;
waitUntil { sleep 0.1; not life_action_gather };

// Make sure we wait before enabling the play button so it doesn't go too fast
sleep 0.1;
_play ctrlEnable true;