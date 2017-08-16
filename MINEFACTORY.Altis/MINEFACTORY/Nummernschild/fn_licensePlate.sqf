/*
	DISCLAIMER: IF U WANT TO USE MY SCRIPT ASK FOR PERMISSION BEFORE!
	File: fn_licensePlate.sqf
	Author: Dino 
	
	Description:
	Creates the License Plates!
*/

private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
_classname = typeOf _vehicle;

_plate1 = ObjNull;
_plate2 = ObjNull;

_classnameList = ["C_Offroad_01_F", "C_Hatchback_01_F", "C_SUV_01_F", "I_MRAP_03_F", "C_Van_01_box_F", "C_Van_01_transport_F", "B_Truck_01_transport_F", "B_Truck_01_covered_F","B_Truck_01_box_F", "B_Quadbike_01_F", "O_Truck_03_device_F", "O_Truck_03_covered_F", "O_Truck_03_transport_F", "I_Truck_02_transport_F", "I_Truck_02_covered_F", "C_Hatchback_01_sport_F","C_Kart_01_Blu_F", "C_Kart_01_Fuel_F", "C_Kart_01_Red_F", "C_Kart_01_Vrana_F"];
if (!(_classname in _classnameList)) exitWith {};

/*
_posArr = {
	0 -> pos1
		0 -> pos
		1 -> vectorDirUp
	1 -> pos2
		0 -> pos
		1 -> vectorDirUp
}
*/

_posArr = switch (_classname) do {
	case "C_Offroad_01_F": { [[[-0.05, 2.615, -0.65], [[0,0,1],[0,1,0]]], [[-0.40, -2.935, -0.75], [[0,0,1],[0,-1,0]]]] };
	case "C_Hatchback_01_F": { [[[0.3, 2.208, -0.85], [[0,0,1],[0.5,1,0]]], [[-0.02, -2.515, -0.40], [[0,0.22,1],[0,-1,0]]]] };
	case "C_SUV_01_F": { [[[0.0, 2.396, -0.80], [[0,-0.15,1],[0,1,0]]], [[0, -3.035, -0.55], [[0,-0.35,1],[0,-1,0]]]] };
	case "I_MRAP_03_F": { [[[0.0, 2.324, -0.80], [[0,0.75,1],[0,1,0]]], [[0, -2.87, -0.55], [[0,-0.29,1],[0,-1,0]]]] };
	case "C_Van_01_box_F": { [[[-0.05, 2.08, -0.8], [[0,0.10,1],[0,1,0]]], [[-0.65, -3.48, -0.35], [[0,0,1],[0,-1,0]]]] };
	case "C_Van_01_transport_F": { [[[-0.05, 2.08, -0.8], [[0,0.10,1],[0,1,0]]], [[-0.65, -3.43, -0.55], [[0,0,1],[0,-1,0]]]] };
	case "B_Truck_01_transport_F": { [[[0, 4.76, -0.90], [[0, 0.99, 1], [0, 1, 0]]], [[-0.65, -5.02, -0.062], [[0, 0, 1], [0, -1, 0]]]] };
	case "B_Truck_01_covered_F": { [[[0, 4.76, -0.90], [[0, 0.99, 1], [0, 1, 0]]], [[-0.65, -5.02, -0.062], [[0, 0, 1], [0, -1, 0]]]] };
	case "B_Truck_01_box_F": { [[[0, 5, -0.90], [[0, 0.99, 1], [0, 1, 0]]], [[-0.65, -5.67, 0.55], [[0, 0, 1], [0, -1, 0]]]] };
	case "B_Quadbike_01_F": { [[[0, 1.03, -0.9], [[0, 0.10, 1], [0, 1, 0]]], [[-0.35, -1.15, -0.55], [[0, -0.17, 1], [0, -1, 0]]]] };
	case "O_Truck_03_device_F": { [[[0, 3.12, -0.75], [[0, 0.99, 1], [0, 1, 0]]], [[0.05, -4.937, -0.062], [[0, 0, 1], [0, -1, 0]]]] };
	case "O_Truck_03_covered_F": { [[[0, 3.40, -1], [[0, 0.99, 1], [0, 1, 0]]], [[-0.35, -5.03, -0.162], [[0, 0, 1], [0, -1, 0]]]] };
	case "O_Truck_03_transport_F": { [[[0, 3.40, -1], [[0, 0.99, 1], [0, 1, 0]]], [[-0.35, -5.03, -0.162], [[0, 0, 1], [0, -1, 0]]]] };
	case "I_Truck_02_transport_F": { [[[0.05, 4.081, -1.25], [[0, 0.05, 1], [0, 1, 0]]], [[-0.35, -3.55, -0.382], [[0, 0, 1], [0, -1, 0]]]] };
	case "I_Truck_02_covered_F": { [[[0.05, 4.081, -1.25], [[0, 0.05, 1], [0, 1, 0]]], [[-0.35, -3.55, -0.382], [[0, 0, 1], [0, -1, 0]]]] };
	case "C_Hatchback_01_sport_F": { [[[0.3, 2.208, -0.85], [[0, 0, 1], [0.5, 1, 0]]], [[-0.02, -2.515, -0.40], [[0, 0.22, 1], [0, -1, 0]]]] };
	case "C_Kart_01_Blu_F": { [[[0.05, 1.045, -0.862], [[0, -1.25, 1], [0, 1, 0]]], [[0.5, -0.89, -0.862], [[0, 0, 1], [0, -1, 0]]]] };
	case "C_Kart_01_Fuel_F": { [[[0.05, 1.045, -0.862], [[0, -1.25, 1], [0, 1, 0]]], [[0.5, -0.89, -0.862], [[0, 0, 1], [0, -1, 0]]]] };
	case "C_Kart_01_Red_F": { [[[0.05, 1.045, -0.862], [[0, -1.25, 1], [0, 1, 0]]], [[0.5, -0.89, -0.862], [[0, 0, 1], [0, -1, 0]]]] };
	case "C_Kart_01_Vrana_F": { [[[0.05, 1.045, -0.862], [[0, -1.25, 1], [0, 1, 0]]], [[0.5, -0.89, -0.862], [[0, 0, 1], [0, -1, 0]]]] };
};

vehicleplate1 = "Land_Photos_V2_F" createVehicle [1000, 1000, 1000];
vehicleplate2 = "Land_Photos_V2_F" createVehicle [1000, 1000, 1000];
vehicleplate1 setVariable ["BIS_enableRandomization", false];
vehicleplate2 setVariable ["BIS_enableRandomization", false];
vehicleplate1 attachTo [_vehicle, ((_posArr select 0) select 0)];
vehicleplate2 attachTo [_vehicle, ((_posArr select 1) select 0)];
vehicleplate1 setVectorDirAndUp ((_posArr select 0) select 1);
vehicleplate2 setVectorDirAndUp ((_posArr select 1) select 1);
vehicleplate1 setObjectTextureGlobal [0, licenseplatenumber];
vehicleplate2 setObjectTextureGlobal [0, licenseplatenumber];

_vehicle setVariable ["plates", [vehicleplate1, vehicleplate2], true];
