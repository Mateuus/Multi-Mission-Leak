private["_vehicle","_wall","_owners","_test_prog","_passed","_counter","_proof"];
player setpos (getmarkerpos "license_car_positioning");
_vehicle = "C_Offroad_luxe_F" createVehicle (getMarkerPos "car_license_spawn");
_owners = getPlayerUID player;
_vehicle setVariable["vehicle_info_owners",_owners,true];
_wall = "Land_HBarrierWall6_F" createVehicle (getMarkerPos "car_license_spawn_wall");
_wall setdir 90;
_vehicle setdir 90;

sleep 1;
player moveindriver _vehicle;

_test_prog = true;
_passed = false;
_proof = false;
_counter = 30;

while {_test_prog} do{
	if ((vehicle player distance (getMarkerPos "car_proofer")) <= 8) then {
		_proof = true;
		 deletevehicle _wall;
	};
	if (((vehicle player distance (getMarkerPos "car_license_spawn_wall")) <= 8) && _proof) then {
		_passed = true;
		_test_prog = false;
		
	};
	if ((getdammage vehicle player) >=0.05 || vehicle player == player) then {
		_test_prog = false;
		deletevehicle _wall;
	};
	hint format [(localize "STR_Licensing_car_making"),_counter];
	_counter = _counter - 1;
	sleep 1;
};
sleep 1;
titleText [(localize "STR_Licensing_car_EndStopp"),"PLAIN"];
if (_passed) then {
	hint format [(localize "STR_Licensing_car_EndMadeIte"), localize "STR_License_Driver"];
	license_civ_driver = true;	
	sleep 6;	
} else {
	hint (localize "STR_Licensing_car_EndFail");
	sleep 6;
};
deletevehicle _vehicle; deletevehicle _wall; player setPos LICENSER_POS_BACK;
licenser_obj setvariable ["car", false, true];
