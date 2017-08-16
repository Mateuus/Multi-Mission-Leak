/*	@file Version: 1.0.0.0	@file Author: RYN_Ryan	@file edit: 20.01.2015	Copyright � 2015 Ryan Torzynski, All rights reserved	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!*/



schiffsw_obj_arr = ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F"];

//########################## CONFIGURATION ##########################
schiffsw_chance = 100;
schiffsw_positions = [[7224.656,5450.376,0],[14348.673,6334.85,0],[4367.139,10691.503,0],[9190.481,14519.640,0]];
_schiffsw_time_interval = [1,5]; //Time given in hours, this is the interval in which the shipwreck should take spawn
schiffsw_loot_array = [["apple",20],["peach",20]];
schiffsw_loot_amount = 1;
//######################## CONFIGURATION END ########################
// Do not modify the following code
schiffsw_time_min = _schiffsw_time_interval select 0;
schiffsw_time_max = _schiffsw_time_interval select 1;
schiffsw_time_min = schiffsw_time_min * 3600;
schiffsw_time_max = schiffsw_time_max * 3600;
if (schiffsw_time_min >= schiffsw_time_max OR count schiffsw_loot_array < schiffsw_loot_amount) exitWith {schiffsw_enable = false;};
schiffsw_enable = true;
sleep 1;
if (!schiffsw_enable) exitWith {};
_chance = floor(random 100);
if (_chance > schiffsw_chance) exitWith {};
_toWait = (random (schiffsw_time_max - schiffsw_time_min)) + schiffsw_time_min;
sleep _toWait;
// schiffsw STARTEN

[[5,"<t size='1.4'><t color='#A5DF00'>SCHIFFSWRACK</t></t><br/><br/><t size='1'>A sunken ship has been located! It may contain important items, it has been marked on your map!</t>"],"tanoarpg_fnc_broadcast",true,false] spawn tanoarpg_fnc_MP;

_poses = count schiffsw_positions;
_inArr = floor(random _poses);
_dest = schiffsw_positions select _inArr;

sleep 5;

_marker = createMarker ["schiffswmarker", _dest];
"schiffswmarker" setMarkerColor "ColorGreen";
"schiffswmarker" setMarkerType "Empty";
"schiffswmarker" setMarkerShape "ELLIPSE";
"schiffswmarker" setMarkerSize [500,500];
_markerText = createMarker ["schiffswmarkertext", _dest];
"schiffswmarkertext" setMarkerColor "ColorBlack";
"schiffswmarkertext" setMarkerText "Schiffswrack";
"schiffswmarkertext" setMarkerType "mil_warning";
"schiffswmarker" setMarkerAlpha 0.3;// DAS WRACK SPAWNEN
_type = "";
_chance = floor(random 2);
if (_chance == 1) then {_type = "Land_Wreck_Traw_F"} else {_type = "Land_Wreck_Traw2_F"};
_xPOS = floor(random 400);
_yPOS = floor(random 400);
_pos = [(_dest select 0) - 500 + random(500 * 2),(_dest select 1) - 500 + random(500 * 2),0];
_dasWrack = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
_dasWrack setPosATL _pos;
_dasWrack allowDamage false;
_dasWrack enableSimulation false;
_dasWrack setVariable ["trunk_in_use",false,true];
_dasWrack setVariable ["opened",false,true];
schiffwoffen = false;waitUntil {schiffwoffen};
// Warten, bis es ge�ffnet wird
_dasWrack setVariable ["opened",true,true];
// RANDOM LOOT EINF�HREN
_lootAmount = schiffsw_loot_amount;
_lootArray = schiffsw_loot_array;
_lootTempToAdd = [];
_lootArrayFinal = [];
while {_lootAmount>0} do {	_lootAmount = _lootAmount - 1;
_loot_inArr = count _lootArray;	_inArr = floor(random _loot_inArr);	_lootTempToAdd = _lootArray select _inArr;	_lootArrayFinal = _lootArrayFinal + [_lootTempToAdd];};
_dasWrack setVariable ["Trunk",[_lootArrayFinal,500],true];
sleep 1800;
"schiffswmarker" setMarkerAlpha 0;
"schiffswmarkertext" setMarkerAlpha 0;
deleteMarker "schiffswmarker";
deleteMarker "schiffswmarkertext";

deleteVehicle _dasWrack;
[[5,"<t size='1.4'><t color='#A5DF00'>SCHIFFSWRACK</t></t><br/><br/><t size='1'>The ship has been successfully looted and has despawned!</t>"],"tanoarpg_fnc_broadcast",true,false] spawn tanoarpg_fnc_MP;










