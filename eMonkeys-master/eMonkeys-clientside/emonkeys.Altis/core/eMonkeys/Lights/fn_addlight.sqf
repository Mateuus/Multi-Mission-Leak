
private ["_vehicle","_lightleft","_attach","_typ"];
_vehicle = _this select 0; 
_typ = _this select 1; 

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};
if (!((_typ == "med") or (_typ == "cop"))) exitWith {};


_lightleft = "#lightpoint" createVehicle getPosATL _vehicle;
_lightright = "#lightpoint" createVehicle getPosATL _vehicle;

if (_typ == "cop") then {

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F": {_attach =  [[-0.37, 0.0, 0.56],[0.37, 0.0, 0.56]]; _lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "B_MRAP_01_F": {_attach = [[-0.8, -0.90, 0.6],[0.8, -0.90, 0.6]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "C_SUV_01_F": {_attach = [[1.1,0.4,-0.05],[-1.1,0.4,-0.05]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "I_MRAP_03_F": {_attach = [[-1.3, 1.85, -0.08],[1.3, 1.85, -0.08]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "I_Heli_light_03_unarmed_F": {_attach = [[1.23, 4.7, -1.42],[-1.23, 4.7, -1.42]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "I_Heli_light_03_F": {	_attach =  [[1.25, 4.6, -1.35],[-1.25, 4.6, -1.35]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "O_Heli_Light_02_unarmed_F": {	_attach =  [[1, 3.2, -2],[-1, 3.2, -2]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};	
	case "B_Heli_Light_01_F": {	_attach =  [[-0.75, 1.7, -0.95],[0.75, 1.7, -0.95]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};	
	case "I_Heli_Transport_02_F": {	_attach = [[1.3, 6.3, -2.65],[-1.3, 6.3, -2.65]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "C_Hatchback_01_sport_F": {_attach = [[0.62, 1.87, -0.52],[-0.62, 1.87, -0.52]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "O_Truck_03_transport_F": {_attach = [[-0.6, 3.4, -0.8],[0.6, 3.4, -0.8]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "O_Truck_03_covered_F": {_attach =  [[-0.6, 3.4, -0.8],[0.6, 3.4, -0.8]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "B_MRAP_01_hmg_F":	{_attach =  [[0.85, -1, 0.05],[-0.85, -1, 0.05]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "B_MRAP_01_F":	{_attach =  [[0.85, -1, 0.6],[-0.85, -1, 0.6]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "B_Quadbike_01_F":	{_attach =  [[-0.20, 1, 0.8],[0.40, 1, 0.8]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "O_Heli_Transport_04_bench_F": {_attach =  [[-0.9, 5.3, 1.7],[0.7, 5.3, 1.7]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "B_Heli_Transport_03_unarmed_F": {_attach =  [[-1.8, 5.0, 1.9],[1.8, 5.0, 1.9]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "I_MRAP_03_hmg_F": {_attach = [[-1.3, 1.85, -0.08],[1.3, 1.85, -0.08]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	
};
}else{
switch (typeOf _vehicle) do {
	case "C_Offroad_01_F":{_attach = [[-0.37, 0.0, 0.56],[0.37, 0.0, 0.56]];_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "C_SUV_01_F": {_attach = [[1.1,0.4,-0.05],[-1.1,0.4,-0.05]];	_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "O_Truck_03_medical_F":{_attach = [[-1.2, 3.28, -0.9],[1.35, 3.28, -0.9]];_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "I_Truck_02_medical_F":{_attach = [[-1.2, 3.73, -0.6],[0.98, 3.73, -0.6]];_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "B_Truck_01_medical_F":{_attach = [[-1.35, 4.9, -0.45],[1.06, 4.9, -0.45]];_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "C_Hatchback_01_sport_F":{_attach = [[-0.62, 1.87, -0.52],[0.62, 1.87, -0.52]];_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "O_Heli_Light_02_unarmed_F":{_attach = [[-1, 3.2, -2],[1, 3.2, -2]];_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "B_Heli_Light_01_F":{_attach = [[-0.75, 1.7, -0.95],[0.75, 1.7, -0.95]];_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
	case "C_Van_01_box_F":{_attach =  [[-0.7, -0.25, 1.5],[0.7, -0.25, 1.5]];_lightleft lightAttachObject [_vehicle,_attach select 0]; _lightright lightAttachObject [_vehicle,_attach select 1];};
};
};



