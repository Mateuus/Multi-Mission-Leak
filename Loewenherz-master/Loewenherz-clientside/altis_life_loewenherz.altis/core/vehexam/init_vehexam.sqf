// Driving Exam
[
	"license_civ_driver",  // type of exam and also prefix for checkpoints, ie. car_license_exam1, car_license_exam2, etc
	5, // checkpoint radius
	"!isOnRoad position _veh || (damage _veh) > 0.1", // bad driving check
	false, // success callback in form of [function, arguments]
	false // failure callback in form of [function, arguments]
] spawn vehexam_fnc_setup;