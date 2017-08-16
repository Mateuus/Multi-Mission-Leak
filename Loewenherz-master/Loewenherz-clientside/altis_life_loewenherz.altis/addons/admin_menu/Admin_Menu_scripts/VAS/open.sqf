if(isNil "VAS_init_complete") exitWith {hint "VAS never initialized.\n\nThis means CfgFunctions.hpp was never called via Description.ext";};
if(!VAS_init_complete && !vas_disableSafetyCheck) exitWith {if((time - VAS_init_timeOnStart) > 25) then {[] call VAS_fnc_mainInit;}; hint "VAS hasn't finished loading yet."};

//Set up some variables incase a 'limited' weapons/mags/items field is meant for that container (Mainly support for an upcoming feature).
VAS_box_weapons = player getVariable "bis_weapons";
VAS_box_magazines = player getVariable "bis_magazines";
VAS_box_items = player getVariable "bis_items";
VAS_box_backpacks = player getVariable "bis_backpacks";
VAS_box_goggles = player getVariable "bis_goggles";

createDialog "VAS_Diag";
["guns",false] spawn VAS_fnc_mainDisplay;
ctrlShow [2507,false];
ctrlShow [2508,false];
ctrlShow [2509,false];
ctrlShow [2850,false];
ctrlShow [2851,false];
disableSerialization;

[["admin",(format["%1 with UID %2 is using the Virtual-Ammobox",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;