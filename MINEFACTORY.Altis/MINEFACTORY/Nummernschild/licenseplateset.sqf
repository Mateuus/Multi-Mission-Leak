/*
	IF U WANT TO USE THE LICENSE PLATE SCRIPT, ASK FOR PERMISSION!
	File: licenseplateset.sqf
	Author: Dino
	
	Description:
	Refreshes the License Plates.
*/

for [{_i=0},{true},{_i=_i+1}] do {

waitUntil {((typeOf (vehicle player)) in [
"C_Offroad_01_F","C_Hatchback_01_F","C_SUV_01_F","I_MRAP_03_F",
"C_Van_01_box_F","C_Van_01_transport_F","B_Truck_01_transport_F",
"B_Truck_01_covered_F","B_Truck_01_box_F","B_Quadbike_01_F",
"O_Truck_03_device_F","O_Truck_03_covered_F","O_Truck_03_transport_F",
"I_Truck_02_transport_F","I_Truck_02_covered_F","C_Hatchback_01_sport_F",
"C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"
]) && ((count attachedObjects (vehicle player)) < 2)};
_vehicle = vehicle player;


sleep 1;

if (count attachedObjects _vehicle < 2) then {[_vehicle] call life_fnc_licensePlate;};


sleep 4;
vehicleplate1 setObjectTextureGlobal [0, licenseplatenumber];
vehicleplate2 setObjectTextureGlobal [0, licenseplatenumber];
	
};