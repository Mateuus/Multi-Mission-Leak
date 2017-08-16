private ["_distance","_pay","_txt","_search"];

if (playerSide == west) exitWith {hint "Cops cant use this."; }; //shouldn't be needed

_distance = player distance life_explorer_wrecks ;
_pay = round(_distance * (6 + random 2));

waitUntil {player distance life_explorer_wreck <= 15 || !alive player};

// Check if player is still alive.
if (!alive player) exitWith {
	["TaskFailed", ["Treasure Hunting", "You failed the mission because you died."]] call BIS_fnc_showNotification;
	life_explorer_task setTaskState "Failed";
	player removeSimpleTask life_explorer_task;
	deleteVehicle life_wrecks;
};

// Remove task.
["TaskSucceeded", ["Treasure Hunting", "You've found the wreck, search it for items!"]] call bis_fnc_showNotification;
life_explorer_task setTaskState "Succeeded";
player removeSimpleTask life_explorer_task;

if (player distance life_explorer_wreck <= 15 ) then {
_search = player addAction ["Search Wreck", "core\jobs\fn_SearchWreck.sqf"];
};
waitUntil {life_wreck_searched}; //set in fn_SearchWreck.sqf
player removeAction _search;

// Create new task.
[] spawn  {
	sleep 2;
	life_explorer_task = player createSimpleTask ["treasure_hunting"];
	life_explorer_task setSimpleTaskDescription ["Go to the Appraiser to get your item valued..", "Treasure Hunting",""];
	life_explorer_task setTaskState "Assigned";
	player setCurrentTask life_explorer_task;
	["TaskAssigned", ["Treasure Hunting", "Go to the Appraiser to get your item valued."]] call bis_fnc_showNotification;
};


