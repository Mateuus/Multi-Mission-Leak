/*
File: spawn job vehicle
*/

if(has_job) exitwith { ["You already have a job! Press Shift + 4 to quit!", false] spawn domsg;};
if(!license_civ_truck) exitwith { ["You need a truck license for this job!", false] spawn domsg;};

has_job = true;
switch(_this select 3) do {
	case "truck": {
			 _towtrucks = nearestObjects [player, ["Jonzie_Log_Truck","Jonzie_Superliner","Jonzie_Flatbed_Roadtrain","Jonzie_Flatbed"], 20]; 
	  		 if(count _towtrucks > 0) exitWith { ["Please wait til trucks move before spawning another..", false] spawn domsg; };
			vehspawned = createVehicle ["Jonzie_Log_Truck", position player, [], 0, "NONE"];
			trucking = true;
			[] spawn fnc_trucking;
	};
	case "food": {
		fedex_on = true;
		vehspawned = createVehicle ["critgamin_vangmcc_food", (getmarkerPos "job_spawn_1"), [], 0, "NONE"];
		jobstand setvariable ["job1",false,true];
	};
	case "general": {
		vehspawned = createVehicle ["critgamin_vangmcc_general", (getmarkerPos "job_spawn_1"), [], 0, "NONE"];
		fedex_on = true;
		jobstand setvariable ["job2",false,true];
	};
	case "clothing": {
		vehspawned = createVehicle ["critgamin_vangmcc_clothing", (getmarkerPos "job_spawn_1"), [], 0, "NONE"];
		fedex_on = true;
		jobstand setvariable ["job3",false,true];
	};
	case "fedex1": {
		vehspawned = createVehicle ["critgamin_vangmcc_fedex", (getmarkerPos "job_spawn_1"), [], 0, "NONE"];
		jobstand setvariable ["job4",false,true];
		fedex_on = true;
		[] spawn fnc_fedex;
	};
	case "fedex2": {
		vehspawned = createVehicle ["critgamin_vangmcc_fedex", (getmarkerPos "job_spawn_1"), [], 0, "NONE"];
		jobstand setvariable ["job5",false,true];
		fedex_on = true;
		[] spawn fnc_fedex;
	};
	case "fedex3": {
		vehspawned = createVehicle ["critgamin_vangmcc_fedex", (getmarkerPos "job_spawn_1"), [], 0, "NONE"];
		jobstand setvariable ["job6",false,true];
		fedex_on = true;
		[] spawn fnc_fedex;
	};
	case "fastfood1": {
		vehspawned = createVehicle ["critgamin_vangmcc_pizza", (getmarkerPos "job_spawn_1"), [], 0, "NONE"];
		jobstand setvariable ["job7",false,true];
		fedex_on = true;
		[] spawn fnc_fedex;
	};
	case "fastfood2": {
		vehspawned = createVehicle ["critgamin_vangmcc_pizza", (getmarkerPos "job_spawn_1"), [], 0, "NONE"];
		jobstand setvariable ["job8",false,true];
		fedex_on = true;
		[] spawn fnc_fedex;
	};
};
[vehspawned] spawn life_fnc_clearVehicleAmmo;
["You get paid extra for staying inside your vehicle..", false] spawn domsg;


_fkit = 20;

while{ has_job } do {
	uiSleep 300;
	if(vehicle player != player) then {
		if (typeOf (vehicle player) IN ["Jonzie_Superliner","critgamin_vangmcc_clothing","critgamin_vangmcc_fedex","critgamin_vangmcc_food","critgamin_vangmcc_general","critgamin_vangmcc_pizza","critgamin_vangmcc_fixit"]) then
		{
			["bank","add", 1200] call life_fnc_handleCash;
			["You just got paid an extra $1200", false] spawn domsg;
			["Add",8] call fnc_karma;
		};
	};
	_fkit = _fkit - 1;
	if(_fkit == 0) exitwith {};
};
vehspawned setVelocity [0, 0, 0];
sleep 1;
fedex_on = false;
trucking = false;
deleteVehicle vehspawned;
has_job = false;