
if(!isServer) then {	
	vehicle_exam_begin_flag = _this;
	publicVariableServer "vehicle_exam_begin_flag";
} else {
	private ["_exam_type", "_exam_vehicle", "_exam_timeout", "_exam_vehicle_dir", "_examinee", "_examiner_pos"];

	_exam_type = _this select 3 select 0;
	_exam_vehicle = _this select 3 select 1;
	_exam_timeout = _this select 3 select 2; 
	_exam_vehicle_dir = _this select 3 select 3;
	_checkpoint_radius = [_exam_type, "checkpoint_radius"] call vehexam_fnc_get;
	_examiner = _this select 0;	
	_examinee = _this select 1;
	_examiner_pos = position _examinee;
		
	[_examinee, format ["Fahre durch alle Checkpoints in unter %1 Sekunden!", _exam_timeout]] call vehexam_fnc_hint;

	switch ([_exam_type, "examinee"] call vehexam_fnc_get) do {
		case objNull:
		{			
			private ["_exam_veh", "_timeout", "_bad_driving", "_add_more_checkpoints","_getVehicles"];
			
			// Check if they are other vehicles on the track
			_getVehicles = nearestObjects [getMarkerPos "Safezone_Exam", ["LandVehicle"], 66];
			{
				deleteVehicle _x;
			} forEach _getVehicles;
			
			_exam_veh = createVehicle [
                                  _exam_vehicle,
                                  getMarkerPos (format ["%1_spawn", _exam_type]),
                                  [], 0, "NONE"
                        ];
			_exam_veh lock true;
			_exam_veh setDir _exam_vehicle_dir;	
			_exam_veh setVariable["vehicle_info_owners",[["0","Driving School"]],true];
			[				
				_exam_veh, 
				[
                    "Cancel Exam",
                    (format ["_callback = ['%1', 'failure_callback'] call vehexam_fnc_get; [""%1"", 'Giving up eh?', _callback] call vehexam_fnc_finish;",
                    _exam_type, _examiner_pos]), [], 0, true, true, "GetOut"
                ],
             	_examinee
			] call vehexam_fnc_addAction;
			
			_examinee action ["GetInDriver", _exam_veh]; // this works on dedicated server
			_examinee moveInDriver _exam_veh;  // this works locally

			[_exam_type, "veh", _exam_veh] call vehexam_fnc_set;
			[_exam_type, "examinee", _examinee] call vehexam_fnc_set;			
			
			_timeout = createTrigger ["EmptyDetector", [0,0,0]];
			[_exam_type, "timeout_trigger", _timeout] call vehexam_fnc_set;
			_timeout setTriggerTimeout [_exam_timeout, _exam_timeout, _exam_timeout, false];
			_timeout setTriggerStatements [
				"true", 
				format ["
                            _callback = ['%1', 'failure_callback'] call vehexam_fnc_get;
							[
                               '%1',
                               'You have to be quicker than that!',
                               _callback
                            ] call vehexam_fnc_finish;
					", _exam_type
				],
				""
			];
			_bad_driving_check = [_exam_type, "bad_driving_check"] call vehexam_fnc_get;
			_bad_driving = createTrigger ["EmptyDetector", [0,0,0]];
			_bad_driving setTriggerStatements [
				format ["_veh = [""%1"", ""veh""] call vehexam_fnc_get; %2", _exam_type, _bad_driving_check],
				format ["
                        _callback = ['%1', 'failure_callback'] call vehexam_fnc_get;                                
     				    [
                            '%1', 
                            ""You won't pass being reckless like that!"",
                            _callback
                        ] call vehexam_fnc_finish;					
					", 
					_exam_type
				],
				""
			];
			[_exam_type, "triggers", [_timeout, _bad_driving]] call vehexam_fnc_set;								
			[_exam_type, "current_checkpoint", 0] call vehexam_fnc_set;

			// set the waypoints
			_checkpoints = [_exam_type, "checkpoints"] call vehexam_fnc_get;
			_checkpoint_radius = [_exam_type, "checkpoint_radius"] call vehexam_fnc_get;			
			while {(count (waypoints _examinee)) > 0} do {
				deleteWaypoint ((waypoints _examinee) select 0); 
			};
			for [{_i=1}, {_i <= count _checkpoints}, {_i = _i+1}] do {				
				_checkpoint_pos = getMarkerPos format ["%1%2", _exam_type, _i];
				_waypoint = (group _examinee) addWaypoint [_checkpoint_pos, 0];
				_waypoint setWaypointCompletionRadius 0;
				_waypoint setWaypointType "HOLD";
				_waypoint setWaypointDescription format ["Checkpoint %1/%2", _i, (count _checkpoints)];
			};			
			(group _examinee) setCurrentWaypoint [(group _examinee), 0];
			[_exam_type, "examiner_pos", _examiner_pos] call vehexam_fnc_set;			
		};

		default
		{
			[_examinee, "Entschuldigung - Jemand anderes macht grade eine Prüfung"] call vehexam_fnc_hint;
		};
	};
};