/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Starts the initialization of the server
*/

if(!(_this select 0))exitWith{}; //Not server

[] call compile preprocessFileLineNumbers "\DS_serverTanoa\init.sqf";

onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";

// Variables
DS_copLevel = 11;

DS_overflow = false;
publicVariable "DS_overflow";

DS_lastPostPlaying = false;
publicVariable "DS_lastPostPlaying";

DS_gotGift = [];
publicVariable "DS_gotGift";

DS_eventStr = "No Current Event";
publicVariable "DS_eventStr";

DS_realModeArray = [];
publicVariable "DS_realModeArray";

DS_markerArray = [];
publicVariable "DS_markerArray";

DS_baseRepairTimes = [0,0,0,0,0,0,0,0,0,0,0,0];
publicVariable "DS_baseRepairTimes";

relics4_3_2 setVectorUp [0,5,0];

DS_civGroup = createGroup sideLogic;
publicVariable "DS_civGroup";

//Remove terrain objects
_terrainObjects = nearestTerrainObjects [[13808.728,18953.682,0],[],75];
{if((typeOf _x) != "Land_Cargo_Tower_V1_F")then{hideObjectGlobal _x;};} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[25441.008,20343.666,0],[],27];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[25447.078,20303.7,0],[],7];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[25372.951,20305.984,0],[],9];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[8887.586,12617.623,0],[],40];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[17440.916,13127.395,0],[],30];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[21268.773,16513.65,0],[],30];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[14328.117,12972.745,0],[],30];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[14295.186,12963.9,0],[],35];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[8611.226,15785.433,0],[],20];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[8666.615,15784.073,0],[],25];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[8701.178,15784.412,0],[],20];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[8734.703,15785.364,0],[],23];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[12904.646,9833.835,0],[],23];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[9001.863,15521.56,0],[],51];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[18263.469,13583.056,0],[],25];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[23155.41,19951.53,0],[],25];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[8165.726,15886.51,0],[],27];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[16712.1,13570.2,1.18514],[],80];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[3690.94,10401.6,-2.61368],[],80];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[16797.5,12719.3,0.000219345],[],20];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[16085,16998,0],[],28];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[3266.27,12968.531,0],[],21];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[3223.951,12947.964,0],[],20];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[3247.876,12943.922,0],[],10];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[8572.71,15773.1,0],[],20];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[17136.254,22131.256,0],[],40];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[17144.639,22167.965,0],[],40];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[17171.311,22118.31,0],[],25];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[3650.13,13157.132,0],[],26];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[3667.642,13177.285,0],[],5];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[11578.2,11908.02,0],[],5];
{hideObjectGlobal _x} forEach _terrainObjects;

_terrainObjects = nearestTerrainObjects [[21961.102,21002.545,0],[],5];
{hideObjectGlobal _x} forEach _terrainObjects;

{
    hideObjectGlobal _x;
    _obj = createSimpleObject [(getModelInfo _x) select 1,getPosWorld _x];
    _obj setDir (getDir _x);
    _obj allowDamage false;
    _obj enableSimulation false;
} forEach nearestTerrainObjects [safe_research,["Wall"],150];

sleep 20;

gangFlag1 setVariable ["id",1,true];
gangFlag2 setVariable ["id",2,true];
gangFlag3 setVariable ["id",3,true];
gangFlag4 setVariable ["id",4,true];

_hideout1 = (nearestObjects [gangFlag1,["Land_i_Barracks_V2_F"],50]) select 0;
_hideout2 = (nearestObjects [gangFlag2,["Land_i_Barracks_V2_F"],50]) select 0;
_hideout3 = (nearestObjects [gangFlag3,["Land_i_Barracks_V2_F"],50]) select 0;
_hideout4 = (nearestObjects [gangFlag4,["Land_i_Barracks_V2_F"],50]) select 0;

_hideout1 allowDamage false;
_hideout2 allowDamage false;
_hideout3 allowDamage false;
_hideout4 allowDamage false;

_researchDome = (nearestObjects [safe_research,["Land_Dome_Big_F"],100]) select 0;
_researchDome allowDamage false;