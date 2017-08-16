IL_Variables = true;

//Check new vehicles time
IL_Check_Veh_Min = 30;
IL_Check_Veh_Max = 60;
	
//Dealing with cargo damage
//-1 - do nothing
//0 - set to 0
//1 - keep such as before loading/unloading
IL_CDamage = 1;

//AddAction menu position
IL_Action_LU_Priority = 30; //Load and (para)unload
IL_Action_O_Priority = 0;	//Open and close
IL_Action_S_Priority = 0; //Setup

//Maximum capacity for vehicles
IL_Num_Slots_OFFROAD = -2;
IL_Num_Slots_VAN = -3;
IL_Num_Slots_MOHAWK = -7;
IL_num_Slots_CHINOOK = -8;
IL_Num_Slots_KAMAZ = -4;
IL_Num_Slots_TEMPEST = -5;
IL_Num_Slots_HEMTT = -6;


//The minimum altitude for the drop with parachute
IL_Para_Drop_ATL = 50;
IL_Para_Jump_ATL = 30;
//The minimum altitude for parachute opening
IL_Para_Drop_Open_ATL = 150;
IL_Para_Jump_Open_ATL = 150;
//Parachute get velocity from player or cargo
IL_Para_Drop_Velocity = true;
IL_Para_Jump_Velocity = true;

//Set smoke and light for parachute drop.
IL_Para_Smoke = true;
IL_Para_Light = true;
//Additional smoke after landing
IL_Para_Smoke_Add = true;
//Additional light after landing
IL_Para_Light_Add = true;
//Smoke and light color
IL_Para_Smoke_Default = "SmokeshellGreen";
IL_Para_Light_Default = "Chemlight_green";
IL_Para_Smoke_Veh = "SmokeshellBlue";
IL_Para_Light_Veh = "Chemlight_blue";

//This allows for loading or unloading, if a player is in the area of loading or copilot
IL_Can_Inside = true;
IL_Can_CoPilot = true;
IL_Can_Outside = true;

//
//IL_SDistU = 20;//No longer needed
IL_SDistL = 2.5;
IL_SDistL_Heli_offset = 1;

//Load and unload (not para) max speed in km/h
IL_LU_Speed = 10;
//Load and unload (not para) max height in m
IL_LU_Alt = 3;
//Enable or disable usable cargo ramp in CH-49
IL_Ramp = true;

//Enable change of vehicle mass
IL_Mass = true;

// Supported vehicles
IL_Supported_Vehicles_OFFROAD = ["C_Offroad_01_F", "B_G_Offroad_01_F"];

IL_Supported_Vehicles_HEMTT = ["B_Truck_01_covered_F", "B_Truck_01_transport_F"];
IL_Supported_Vehicles_KAMAZ = ["I_Truck_02_transport_F","I_Truck_02_covered_F"];
IL_Supported_Vehicles_TEMPEST = ["O_Truck_03_transport_F", "O_Truck_03_covered_F"];
IL_Supported_Vehicles_MOHAWK = ["I_Heli_Transport_02_F"];


IL_Supported_Vehicles_All =  IL_Supported_Vehicles_MOHAWK + IL_Supported_Vehicles_KAMAZ + IL_Supported_Vehicles_TEMPEST + IL_Supported_Vehicles_HEMTT + IL_Supported_Vehicles_OFFROAD;

// Vehicles with the ability to dropping the load on the parachute
IL_Para_Drop_Vehicles =  IL_Supported_Vehicles_MOHAWK;

//Supported cargo
IL_Supported_HEMTT = ["B_Truck_01_covered_F", "B_Truck_01_transport_F"];
IL_Supported_KAMAZ = ["I_Truck_02_transport_F","I_Truck_02_covered_F"];
IL_Supported_TEMPEST = ["O_Truck_03_transport_F", "O_Truck_03_covered_F"];
IL_Supported_OFFROAD = ["C_Offroad_01_F", "B_G_Offroad_01_F"];
IL_Supported_SUV = ["C_SUV_01_F"];
IL_Supported_Hatchback = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F"];
IL_Supported_Quadbike = ["C_Quadbike_01_F", "B_Quadbike_01_F"];
IL_Supported_Veh_Ammo = ["Box_IND_AmmoVeh_F"];
IL_Supported_Cargo20 = ["Land_Cargo20_blue_F"];



IL_Supported_Cargo_Veh_Offroad = IL_Supported_Quadbike;
IL_Supported_Cargo_NonVeh_Offroad = (IL_Supported_Veh_Ammo);
IL_Supported_Cargo_Offroad = IL_Supported_Cargo_Veh_Offroad + IL_Supported_Cargo_NonVeh_Offroad;

IL_Supported_Cargo_Veh_Kamaz = IL_Supported_Quadbike + IL_Supported_Hatchback;
IL_Supported_Cargo_NonVeh_Kamaz = IL_Supported_Veh_Ammo;
IL_Supported_Cargo_Kamaz = IL_Supported_Cargo_Veh_Kamaz + IL_Supported_Cargo_NonVeh_Kamaz;

IL_Supported_Cargo_Veh_HEMTT = IL_Supported_Cargo_Veh_Kamaz + IL_Supported_OFFROAD + IL_Supported_SUV;
IL_Supported_Cargo_NonVeh_HEMTT = IL_Supported_Cargo_NonVeh_Kamaz + IL_Supported_Cargo20;
IL_Supported_Cargo_HEMTT = IL_Supported_Cargo_Veh_HEMTT + IL_Supported_Cargo_NonVeh_HEMTT;

IL_Supported_Cargo_Veh_TEMPEST = IL_Supported_Cargo_Veh_HEMTT;
IL_Supported_Cargo_NonVeh_TEMPEST = IL_Supported_Veh_Ammo;
IL_Supported_Cargo_TEMPEST = IL_Supported_Cargo_Veh_TEMPEST + IL_Supported_Cargo_NonVeh_TEMPEST;

IL_Supported_Cargo_Veh_Mohawk = IL_Supported_Quadbike + IL_Supported_Hatchback;
IL_Supported_Cargo_NonVeh_Mohawk = IL_Supported_Veh_Ammo;
IL_Supported_Cargo_Mohawk = IL_Supported_Cargo_Veh_Mohawk + IL_Supported_Cargo_NonVeh_Mohawk;