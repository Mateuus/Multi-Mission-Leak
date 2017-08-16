/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright © 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/
private["_shipObjects","_configMaxChance","_configSpawnPositions","_configSpawnTimeInterval","_configLootAmount","_configLoot","_configSpawnTimeMin",
"_configSpawnTimeMax","_chance", "_toWait","_poses","_dest","_marker","_markerText","_type","_xPOS","_yPOS","_wreckShipObj","_pos","_lootAmount",
"_lootTempToAdd","_lootArrayFinal","_randomLootAmount","_randomLootAmountMin","_randomLootAmountMax","_lootTempConfigPosition"];

//########################## CONFIGURATION ##########################

_shipObjects = ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F"];

_configMaxChance = 100;
_configSpawnPositions = [[4462.89,6515.78,-2.19486],[5391.75,25136.2,-1.98308],[25323.2,27886.6,-2.15125]];
_configSpawnTimeInterval = [0.5,4]; //Time given in hours, this is the interval in which the shipwreck should take spawn
_configLootAmount = 6; // HOW MANY GIVEN ITEMS SHOULD BE ADDED PER SHIPWRECK?

 // POSSIBLE LOOT AND AMOUT (LOOTARRAY)
_configLoot = [
	["goldbar",2,40],
	["pickaxe",1,3],
	["fuel_full",3,7],
	["cement",3,300],
	["ornament",1,50],
	["diamond_cut",5,220],
	["redgull",2,30],
	["ornate_grilled",2,5],
	["mackerel_grilled",2,5],
	["tuna_grilled",2,5],
	["catshark_fried",1,3],
	["handcuffkey",1,10],
	["tracker",1,12],
	["blastingcharge",1,3],
	["spikeStrip",1,13],
	["marijuana",4,100]
];

//######################## CONFIGURATION END ########################

// Do not modify the following code

_configSpawnTimeMin = _configSpawnTimeInterval select 0;
_configSpawnTimeMax = _configSpawnTimeInterval select 1;
_configSpawnTimeMin = _configSpawnTimeMin*3600;
_configSpawnTimeMax = _configSpawnTimeMax*3600;

_chance = floor(random 100);
if (_chance>_configMaxChance) exitWith {};
_toWait = (random (_configSpawnTimeMax - _configSpawnTimeMin)) + _configSpawnTimeMin;
sleep _toWait;

// schiffsw STARTEN
[[5,"<t size='1.4'><t color='#A5DF00'>SCHIFFSWRACK</t></t><br/><br/><t size='1'>Ein gesunkenes Schiff wurde gesichtet!<br/>Möglicherweise war wertvolle Fracht geladen. Die letzte bekannte Position wurde auf deiner Karte markiert!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
_poses = count _configSpawnPositions;
_inArr = floor(random _poses);
_dest = _configSpawnPositions select _inArr;

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

"schiffswmarker" setMarkerAlpha 0.3;

// DAS WRACK SPAWNEN

_type = "";
_chance = floor(random 2);
if (_chance==1) then {_type = "Land_Wreck_Traw_F"} else {_type = "Land_Wreck_Traw2_F"};

_xPOS = floor(random 400);
_yPOS = floor(random 400);

_pos = [(_dest select 0) - 500 + random(500*2),(_dest select 1) - 500 + random(500*2),0];
_wreckShipObj = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
_wreckShipObj setPosATL _pos;
_wreckShipObj allowDamage false;
_wreckShipObj enableSimulation false;
_wreckShipObj setVariable ["trunk_in_use","",true];
_wreckShipObj setVariable ["opened",false,true];
schiffsWrack = _wreckShipObj;
publicVariable "schiffsWrack";
schiffwoffen = false;

waitUntil {schiffwoffen}; // Warten, bis es geöffnet wird

_wreckShipObj setVariable ["opened",true,true];

// RANDOM LOOT EINFÜHREN

_lootAmount = _configLootAmount;
_lootTempToAdd = [];
_lootArrayFinal = [];
__lootTempConfigPositionsDone = [];

while {_lootAmount > 0} do {
	_lootAmount = _lootAmount - 1;
    _lootTempConfigPosition = floor random count _configLoot;
	while {_lootTempConfigPosition in __lootTempConfigPositionsDone} do {
		_lootTempConfigPosition = floor random count _configLoot;
	};
	__lootTempConfigPositionsDone pushBack _lootTempConfigPosition;
    _randomLootAmountMin = (_configLoot select _lootTempConfigPosition) select 1;
    _randomLootAmountMax = (_configLoot select _lootTempConfigPosition) select 2;
    _randomLootAmount = (floor random _randomLootAmountMax) + _randomLootAmountMin;
    _lootTempToAdd = [(_configLoot select _lootTempConfigPosition) select 0, _randomLootAmount];
	_lootArrayFinal = _lootArrayFinal + [_lootTempToAdd];
};

_wreckShipObj setVariable ["Trunk",[_lootArrayFinal,500],true];

sleep 1800;

"schiffswmarker" setMarkerAlpha 0;
"schiffswmarkertext" setMarkerAlpha 0;

deleteMarker "schiffswmarker";
deleteMarker "schiffswmarkertext";
deleteVehicle _wreckShipObj;

[[5,"<t size='1.4'><t color='#A5DF00'>SCHIFFSWRACK</t></t><br/><br/><t size='1'>Der Schatz auf dem Schiffswrack wurde gehoben und das Wrack dabei zerstört!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;