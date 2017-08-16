_clearObjects = _this select 0;
if(isNil "_clearObjects")then{_clearObjects = false;};

if(_clearObjects)exitWith {
	hint "Terrain objects deleted";

	_terrainObjects = nearestTerrainObjects [[13808.728,18953.682,0],[],75];
	{if((typeOf _x) != "Land_Cargo_Tower_V1_F")then{hideObject _x;};} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[25441.008,20343.666,0],[],27];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[25447.078,20303.7,0],[],7];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[25372.951,20305.984,0],[],9];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[8887.586,12617.623,0],[],40];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[17440.916,13127.395,0],[],30];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[21268.773,16513.65,0],[],30];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[14328.117,12972.745,0],[],30];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[14295.186,12963.9,0],[],35];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[8611.226,15785.433,0],[],20];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[8666.615,15784.073,0],[],25];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[8701.178,15784.412,0],[],20];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[8734.703,15785.364,0],[],23];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[12904.646,9833.835,0],[],23];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[9001.863,15521.56,0],[],51];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[18263.469,13583.056,0],[],25];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[23155.41,19951.53,0],[],25];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[8165.726,15886.51,0],[],27];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[16712.1,13570.2,1.18514],[],80];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[3690.94,10401.6,-2.61368],[],80];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[16797.5,12719.3,0.000219345],[],20];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[3266.27,12968.531,0],[],21];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[3223.951,12947.964,0],[],20];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[3247.876,12943.922,0],[],10];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[8572.71,15773.1,0],[],20];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[3650.13,13157.132,0],[],26];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[3667.642,13177.285,0],[],5];
	{hideObject _x} forEach _terrainObjects;

	_terrainObjects = nearestTerrainObjects [[11578.2,11908.02,0],[],5];
	{hideObject _x} forEach _terrainObjects;
};

{
	detach _x;
} forEach attachedObjects player;

if(isNil "DS_gearfix")then {
	DS_gearfix = false;
};

if(!DS_gearfix)then {
	DS_gearfix = true;

	// Re-add update task actions
	if(playerSide isEqualTo west)then {
		DS_setTask = false;
		[true] call DS_cop_addTaskActions;
	};

	//Fix clothes till arma does
	_uniform = (uniform player);
	_vest = (vest player);
	_uniformMags = (uniformItems player);
	_vestMags = (vestItems player);
	player forceAddUniform _uniform;
	player addVest _vest;

	{
		[_x,false,true] call DS_fnc_equipItem;
	} forEach _vestMags;

	{
		[_x,false,false,false,true] call DS_fnc_equipItem;
	} forEach _uniformMags;

	if(!(playerSide isEqualTo civilian))then {
		[] call DS_fnc_copUniform;
	};
};

forceWeatherChange;

{
	detach _x;
} forEach attachedObjects player;

sleep 60;
DS_gearfix = false;