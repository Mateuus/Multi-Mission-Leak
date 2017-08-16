if (!isServer) then {
	vehicle_exam_finish_flag = _this;
	publicVariableServer "vehicle_exam_finish_flag";

} else {	
	_exam_type = _this select 0;
	_examiner_pos = [_exam_type, "examiner_pos"] call vehexam_fnc_get;
	_msg = _this select 1;
	_callback = _this select 2;	// [function, args]
		
	_examinee = [_exam_type, "examinee"] call vehexam_fnc_get;
	_exam_veh = [_exam_type, "veh"] call vehexam_fnc_get;

    [_examinee, [_examiner_pos, _exam_veh]] call vehexam_fnc_eject;
        
	[_exam_type, "veh", objNull] call vehexam_fnc_set;	

	_triggers = [_exam_type, "triggers"] call vehexam_fnc_get;
	{
		deleteVehicle _x;
	} forEach (_triggers);
	[_exam_type, "triggers", []] call vehexam_fnc_set;

	[_exam_type, "examinee", objNull] call vehexam_fnc_set;

	[_examinee, _msg] call vehexam_fnc_hint;
	
	[_exam_type, "timeout_trigger", nil] call vehexam_fnc_set;

	if(_callback) then {
		(_callback select 1) spawn (_callback select 0);
	};
	while {(count (waypoints _examinee)) > 0} do {
		deleteWaypoint ((waypoints _examinee) select 0); 
	};
	
};