private ["_vehicle","_lightPositions","_lights","_targets"];

_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _vehicle)exitwith{};
if(_vehicle getVariable ["sirens",false])exitwith{_vehicle setVariable ["sirens",false,true]};
if(!(typeOf _vehicle in ["B_T_LSV_01_unarmed_F","O_T_LSV_02_unarmed_F","C_Offroad_01_F","O_G_Offroad_01_armed_F","B_MRAP_01_F","I_MRAP_03_F","O_MRAP_02_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Offroad_02_unarmed_F","I_APC_Wheeled_03_cannon_F","O_Truck_03_covered_F","O_Truck_03_ammo_F","O_Truck_03_repair_F","O_Truck_03_medical_F","O_Truck_03_fuel_F"]))exitwith{};

_lightPositions = [
	// Vehicle Class || Left Light Pos || Right Light Pos
	["B_T_LSV_01_unarmed_F",[-0.668,-0.081,-0.152],[0.747,-0.081,-0.152]],
	["O_T_LSV_02_unarmed_F",[-0.8,-0.535,0.33],[0.474,-0.535,0.33]],
	["C_Offroad_01_F",[-0.37,0.0,0.56],[0.37,0.0,0.56]],
	["C_Offroad_02_unarmed_F",[-0.5,-0.5,0.5],[0.5,-0.5,0.5]],
	["O_G_Offroad_01_armed_F",[-0.37,0.0,0.06],[0.37,0.0,0.06]],
	["B_MRAP_01_F",[-0.37,-1.9,0.68],[0.37,-1.9,0.68]],
	["I_MRAP_03_F",[-0.37,-0.8,0.45],[0.37,-0.8,0.45]],
	["O_MRAP_02_F",[-0.567,-1.97,0.405],[0.566,-1.97,0.405]],
	["C_SUV_01_F",[-0.37,-1.2,0.42],[0.37,-1.2,0.42]],
	["C_Hatchback_01_sport_F",[-0.386,-0.0,0.2],[0.322,-0.0,0.2]],
	["C_Offroad_02_unarmed_F",[-0.35,1.316,-0.121],[0.26,1.316,-0.121]],
	["I_APC_Wheeled_03_cannon_F",[-0.04,-2.227,-0.253],[1.04,-2.227,-0.253]],
	["O_Truck_03_covered_F",[-0.5,2.753,0.85],[0.625,2.753,0.85]],
	["O_Truck_03_ammo_F",[-0.55,2.54,1.12],[0.55,2.54,1.12]],
	["O_Truck_03_repair_F",[-0.55,2.54,1.12],[0.55,2.54,1.12]],
	["O_Truck_03_medical_F",[-0.5,2.753,0.85],[0.625,2.753,0.85]],
	["O_Truck_03_fuel_F",[-0.55,2.54,1.12],[0.55,2.54,1.12]]
];

//Toggle the police lights
_vehicle setVariable ["sirens",true,true];

_lights = _lightPositions select {(_x select 0) isEqualTo (typeOf _vehicle)} select 0;
_targets = allPlayers select {(_x distance player) < 1000};
[_vehicle,_lights] remoteExec ["DS_fnc_globalLights",_targets];

DS_usedPoliceLights = true;

[] spawn
	{
	sleep 0.5;
	DS_usedPoliceLights = false;
	};