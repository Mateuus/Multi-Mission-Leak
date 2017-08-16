private ["_wreck","_randomLocation","_wreckVeh","_txt","_pos"];

if (playerSide == west) exitWith { hint "Cops cant do this job."; };
if (!isNull life_explorer_wreck) exitWith { hint format ["You were already assigned a task to search around %1.", mapGridPosition life_explorer_wreck]; };

// Define wrecks.
life_explorer_wrecks = [
	["Land_UWreck_FishingBoat_F", "Fishing Boat"],
	["Land_UWreck_MV22_F", "MV-22"],
	["Land_Wreck_Traw2_F", "Ship"],
	["Land_Wreck_Traw_F", "Ship"]
];
// Define logics (wreck locations).
life_explorer_logics = [wreck_logic_1,wreck_logic_2,wreck_logic_3,wreck_logic_4,wreck_logic_5,wreck_logic_6,wreck_logic_7,wreck_logic_8,wreck_logic_9,wreck_logic_10,wreck_logic_11,wreck_logic_12,wreck_logic_13,wreck_logic_14,wreck_logic_15];

// Create wreck.
_wreck = life_explorer_wrecks select (round(random((count life_explorer_wrecks) - 1)));
_randomLocation = getPos (life_explorer_logics select (round(random((count life_explorer_logics) - 1))));
//_wreckVeh = (_wreck select 0) createVehicle [0,0,0];
_wreckVeh = createVehicle [ (_wreck select 0), [0,0,0], [] , 0, "NONE"];
life_explorer_wreck = _wreckVeh;
life_explorer_wreck setDir (random 360);
// Set position of wreck.
_pos = [((_randomLocation select 0) + (random 1000 - random 1000)), ((_randomLocation select 1) + (random 1000 - random 1000))];
life_explorer_wreck setPosASL [_pos select 0, _pos select 1, getTerrainHeightASL _pos];
hintC format ["A wrecked %1 has been seen around grid co-ordinates %2. Find this wreckage and search it for any valuable items.", _wreck select 1, mapGridPosition life_explorer_wreck];
_txt = format ["The wrecked %1 is around map co-ordinates %2. Find this wreck and search it for any valuables.", _wreck select 1, mapGridPosition life_explorer_wreck];

// Create task.
life_explorer_task = player createSimpleTask ["treasure_hunting"];
life_explorer_task setSimpleTaskDescription [_txt, "Treasure Hunting", ""];
life_explorer_task setTaskState "Assigned";
player setCurrentTask life_explorer_task;
life_wreck_searched = false;
sleep 1;

["TaskAssigned", ["Treasure Hunting", format["Search for the wrecked %1.", _wreck select 1]]] call bis_fnc_showNotification;
[] spawn life_fnc_TreasureHunt;