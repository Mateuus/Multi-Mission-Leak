/*
	Author: Dopefish (http://steamcommunity.com/id/PiscesSwimeatus)
	
	This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

private ["_vehicle","_direction","_attach","_attachfront","_attachback","_brightness","_lightfront","_lightback"];

// Variables
_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_direction = [_this, 1, "left", [""]] call BIS_fnc_param;

// Check
if (isNull _vehicle) exitWith {diag_log "ERROR fn_vehTurnsignal.sqf: isNull"};

// Get offsets
switch (typeOf _vehicle) do {
	
	case "B_Quadbike_01_F":			{_attach = [[-0.35,0.90,-0.65],[-0.45,-1.20,-0.55],[0.35,0.90,-0.65],[0.45,-1.20,-0.55]];};
	case "C_Hatchback_01_F":		{_attach = [[-0.90,1.60,-0.50],[-0.80,-2.30,-0.30],[0.80,1.60,-0.50],[0.70,-2.30,-0.30]];};
	case "C_Hatchback_01_sport_F":	{_attach = [[-0.90,1.60,-0.50],[-0.80,-2.30,-0.30],[0.80,1.60,-0.50],[0.70,-2.30,-0.30]];};
	case "C_SUV_01_F":				{_attach = [[-0.90,1.90,-0.40],[-0.90,-2.80,-0.20],[0.90,1.90,-0.40],[0.90,-2.80,-0.20]];};
	case "C_Offroad_01_F":			{_attach = [[-1.00,2.00,-0.35],[-0.95,-2.95,-0.35],[0.90,2.00,-0.35],[0.85,-2.95,-0.35]];};
	case "B_G_Offroad_01_armed_F":	{_attach = [[-1.00,2.30,-0.90],[-1.00,-2.70,-0.90],[0.90,2.20,-0.90],[0.90,-2.70,-0.90]];};
	
	case "B_MRAP_01_F":				{_attach = [[-1.10,1.40,-0.65],[-1.11,-4.20,-0.80],[1.10,1.40,-0.65],[1.10,-4.20,-0.80]];};
	case "O_MRAP_02_F":				{_attach = [[-0.75,1.50,-1.05],[-0.65,-4.50,-1.30],[0.75,1.50,-1.05],[0.60,-4.50,-1.30]];};
	case "I_MRAP_03_F":				{_attach = [];};
	
	case "C_Van_01_transport_F":	{_attach = [[-0.70,2.15,-0.75],[-0.85,-3.38,-0.68],[0.65,2.15,-0.75],[0.80,-3.38,-0.65]];};
	case "C_Van_01_box_F":			{_attach = [[-0.70,2.15,-0.75],[-0.85,-3.38,-0.68],[0.66,2.15,-0.75],[0.80,-3.38,-0.65]];};
	case "C_Van_01_fuel_F":			{_attach = [];};
	
	case "B_Truck_01_transport_F":	{_attach = [[-1.20,4.85,-0.45],[-1.10,-5.08,-0.65],[1.25,4.85,-0.45],[1.18,-5.08,-0.65]];};
	case "B_Truck_01_covered_F":	{_attach = [[-1.20,4.85,-0.45],[-1.10,-5.08,-0.65],[1.25,4.85,-0.45],[1.18,-5.08,-0.65]];};
	case "B_Truck_01_box_F":		{_attach = [[-1.25,5.00,-0.55],[-1.10,-4.45,-1.25],[1.25,5.00,-0.50],[1.10,-4.45,-1.25]];};
	case "B_Truck_01_ammo_F":		{_attach = [];};
	case "B_Truck_01_fuel_F":		{_attach = [];};
	case "B_Truck_01_medical_F":	{_attach = [];};
	case "B_Truck_01_Repair_F":		{_attach = [];};
	case "B_Truck_01_mover_F":		{_attach = [[-1.20,4.45,-0.15],[-1.20,4.45,-0.15],[1.25,4.45,-0.15],[1.25,4.45,-0.15]];};
	
	case "I_Truck_02_transport_F":	{_attach = [[-0.75,4.05,-1.25],[-0.75,-3.40,-1.20],[0.90,4.05,-1.25],[0.90,-3.35,-1.20]];};
	case "I_Truck_02_covered_F":	{_attach = [[-0.75,4.05,-1.25],[-0.75,-3.40,-1.20],[0.90,4.05,-1.25],[0.90,-3.35,-1.20]];};
	case "I_Truck_02_ammo_F":		{_attach = [];};
	case "I_Truck_02_fuel_F":		{_attach = [];};
	case "I_Truck_02_box_F":		{_attach = [];};
	
	case "O_Truck_03_transport_F":	{_attach = [[-0.75,3.32,-1.05],[-1.05,-4.70,-1.18],[0.90,3.32,-1.05],[1.05,-4.70,-1.18]];};
	case "O_Truck_03_covered_F":	{_attach = [[-0.75,3.32,-1.05],[-1.05,-4.70,-1.18],[0.90,3.32,-1.05],[1.05,-4.70,-1.18]];};
	case "O_Truck_03_repair_F":		{_attach = [];};
	case "O_Truck_03_ammo_F":		{_attach = [];};
	case "O_Truck_03_fuel_F":		{_attach = [];};
	case "O_Truck_03_medical_F":	{_attach = [];};
	case "O_Truck_03_device_F":		{_attach = [[-0.80,3.10,-0.75],[-1.05,-4.95,-0.90],[0.90,3.10,-0.75],[1.15,-4.96,-0.90]];};
	
	default { _attach = []; };
};

// Check
if (count _attach == 0) exitWith {diag_log "ERROR fn_vehTurnsignal.sqf: vehicle has no offset"};

// Set direction
if (_direction == "left") then {
	_vehicle setVariable ["turnsignal", "left", true];
	_attachfront = (_attach select 0);
	_attachback = (_attach select 1);
} else {
	_vehicle setVariable ["turnsignal", "right", true];
	_attachfront = (_attach select 2);
	_attachback = (_attach select 3);
};

// Set brightness based on day/night time
_brightness = (sunOrMoon * 8) max 1;

// Create lights
_lightfront = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
_lightfront setLightColor [20, 10, 0.1];
_lightfront setLightAttenuation [0.5, 0, 0, 100];
_lightfront setLightDayLight true;
_lightfront lightAttachObject [_vehicle, _attachfront];

_lightback = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
_lightback setLightColor [20, 10, 0.1];
_lightback setLightAttenuation [0.5, 0, 0, 100];
_lightback setLightDayLight true;
_lightback lightAttachObject [_vehicle, _attachback];

// Blink
while {(alive _vehicle)} do {
	if (_vehicle getVariable ["turnsignal",""] != _direction) exitWith {};
	
	_lightfront setLightBrightness _brightness;
	_lightback setLightBrightness _brightness;
	sleep 0.25;
	_lightfront setLightBrightness 0;
	_lightback setLightBrightness 0;
	sleep 0.25;
};

// Delete lights
deleteVehicle _lightfront;
deleteVehicle _lightback;