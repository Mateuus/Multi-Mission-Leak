private ["_owners","_truck","_current","_ts_helpers","_ts_markers","_failed","_truck","_truck_goal","_truck_test","_wende"];
_ts_markers = [];
player setpos (getmarkerpos "license_truck_positioning");
_ts_helpers = ["ts1","ts2","ts3","ts4","ts5","ts6","ts7","ts8","ts9","ts10","ts11","ts12","ts13","ts14","ts15","ts16","ts17","ts18","ts19","ts20","ts21","ts22","ts23"];
{
	_current = _x;
	_ts_markers = _ts_markers + ["Sign_Arrow_Large_F" createVehiclelocal (getMarkerPos _current)];
}forEach _ts_helpers;
_owners = getplayerUID player;
sleep 2;
_truck = "B_Truck_01_box_F" createVehicle (getMarkerPos "truck_license_spawn");
_truck setVariable["vehicle_info_owners",_owners,true];
sleep 0.1;
player moveindriver _truck;
hint "Start!";
sleep 1;

_goal = "Sign_Arrow_Large_Green_F" createVehiclelocal ( getMarkerPos "trucking_license_goal");
_ts_markers pushBack _goal;
_wende = false;
_truck_test = true;
_truck_goal = false;
_failed = false;

_counter = 0;
_min = 0;

while{_truck_test} do {
	
	if ((_truck distance (getMarkerPos "ts21")) <= 15) then {
		_wende = true;
		titleText [(localize "STR_Licensing_truck_wende_s"),"PLAIN"];
	};	
	if ((_truck distance (getMarkerPos "trucking_license_goal")) <= 5 && _wende) then {
		_truck_goal = true;		
		_truck_test = false;
	};
	if ((_truck distance (getMarkerPos "trucking_license_goal")) <= 5 && !_wende) then {		
		_failed = true;
		_truck_test = false;
	};
	_counter = _counter + 1;
	if (_counter >= 60) then { _counter = 0; _min = _min +1;};
	if (_min >= 4 && _counter >= 50) then {
		_failed = true;
		_truck_test = false;
	}; 
	hint format [localize ("STR_Licensing_truck_making"), _counter, _min];
	sleep 1;
};
titleText [(localize "STR_Licensing_car_EndStopp"),"PLAIN"];
{	
	deleteVehicle _x;
} foreach _ts_markers;
sleep 6;
if (_truck_goal) then {
	hint format [(localize "STR_Licensing_car_EndMadeIte"), localize "STR_License_Truck"];
	license_civ_trucking = true;	
} else {
	hint localize "STR_Licensing_car_EndFail";
};

deleteVehicle _truck;

licenser_obj setvariable ["truck", false, true];
player setpos LICENSER_POS_BACK;