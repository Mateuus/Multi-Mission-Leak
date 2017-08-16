/*
	File: fn_slotOpen.sqf
	Author: stuffz - CheapSuit Inc
	
	Desc:
	Opens the slot display
	
	this allowDamage false; this enableSimulation false; this setVariable["nametag_title","Slot Machine"]; this addAction["Slot Machine (£10,000)",life_fnc_slotOpen,"highroller",0,false,true,"",''];
	this allowDamage false; this enableSimulation false; this setVariable["nametag_title","Slot Machine"]; this addAction["Slot Machine (£1,000)",life_fnc_slotOpen,"averageroller",0,false,true,"",''];
	this allowDamage false; this enableSimulation false; this setVariable["nametag_title","Slot Machine"]; this addAction["Slot Machine (£100)",life_fnc_slotOpen,"hoboroller",0,false,true,"",''];
*/

private["_display","_type","_slotType","_slot","_player","_action","_param","_price"];

// Params
_slot = [_this,0,ObjNull,[ObjNull]] call GTA_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call GTA_fnc_param;
_action = [_this,2] call GTA_fnc_param;
_param = [_this,3,"",[""]] call GTA_fnc_param;

// Error Checking
if(_param == "") exitWith {};
if !(alive _player) exitWith {};
if(((player distance _slot) > 2)) exitWith { hint "You are too far away from the slot machine. Move closer."; };

// Save inputs in a local variables for easier passing
life_casino_slotmachine = [_slot,_player,_action,_param];

// Set up the "slot machine"
disableSerialization;

createDialog "Slots";
waitUntil {!isNull findDisplay 41000};

_display = findDisplay 41000;
_type = _display displayCtrl 41002;

// Check which of slot machine we opened
_slotType = switch(_param) do
{
	case "highroller": { "High Roller Slot - £10,000 Per Spin"; };
	case "averageroller": { "Average Roller Slot - £1,000 Per Spin"; };
	case "hoboroller": { "Hobo Roller Slot - £100 Per Spin"; };
	default { "Hobo Roller Slot - £100 Per Spin"; };
};

// Set the text to show which slot machine we opened
_type ctrlSetText _slotType;

// Save the icons in a local variable
life_casino_slotIcons = 
[
	"icons\slots\seven.paa",
	"icons\slots\orange.paa",
	"icons\slots\cherries.paa",
	"icons\slots\bar.paa",
	"icons\slots\bananas.paa",
	"icons\slots\grape.paa",
	"icons\slots\melon.paa",
	"icons\slots\lemon.paa"
];