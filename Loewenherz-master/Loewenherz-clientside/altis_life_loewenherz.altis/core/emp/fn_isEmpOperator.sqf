/*
 © 2014 nano2K - written for we-are-friendly.de
*/
private["_player"];
_player = _this select 0;
_slot = assignedVehicleRole _player;
_vehicle = vehicle _player;
_result = false;

if((_vehicle != _player) && (playerSide == west)) then {


	if((typeof _vehicle == "B_Heli_Transport_01_F")) then {
		if(_slot select 0 == "Turret") then {
			if(_slot select 1 select 0 == 0) then {
				_result = true;
			};
		}
	};
	
	/*
	if((typeof _vehicle == "O_Truck_03_device_F")) then {
		if(_slot select 0 == "Cargo") then {
				_result = true;
		}
	};
	*/
};
_result

//	if((typeof _vehicle == "B_Heli_Light_01_F") && (_vehicle getVariable ["nano_emp_enabled", false])) then {