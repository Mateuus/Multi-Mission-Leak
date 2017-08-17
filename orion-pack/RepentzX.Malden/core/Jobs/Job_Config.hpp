class ADT_Jobs {
	class TowTruck{
		JobTitle = "Tow Truck Driver";
		JobVar = "TowTruck";
		MaxWorkers = 5;
		Wage = 1000;
		HowFar = 50;
		PaycheckPer = 5;
		Type = "Roaming";
		HowLong = 30;
		JobVehicle = "C_Offroad_01_Repair_F";
		ExtraPerJob = 100;
		TimeBetween = 5;
	};

	/*class Mcdonalds{
		JobTitle = "Mcdonalds Worker";
		JobVar = "McDonalds";
		MaxWorkers = 5;
		Wage = 1000;
		HowFar = 50;
		PaycheckPer = 5;
		Type = "Static";
		HowLong = 30;
		Markers[] = {
			"Job_McDonalds_One",
			"Job_McDonalds_Two",
			"Job_McDonalds_Three"
		};
	};*/
	class Repair {
		JobTitle = "Repair Man";
		JobVar = "Repair";
		MaxWorkers = 5;
		Wage = 1000;
		HowFar = 10;
		PaycheckPer = 5;
		Type = "Roaming";
		HowLong = 30;
		JobVehicle = "C_Offroad_01_Repair_F";
		ExtraPerJob = 100;
		TimeBetween = 10;
		MaxRepairDistance = 3;
	};
};