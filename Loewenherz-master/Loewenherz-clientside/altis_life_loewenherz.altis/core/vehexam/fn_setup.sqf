

if (!isServer) exitWith {};

_exam_type = _this select 0;
_checkpoint_radius = _this select 1;
_bad_driving_check = _this select 2;
_success_callback = _this select 3;
_failure_callback = _this select 4;

[_exam_type, "examinee", objNull] call vehexam_fnc_set;
[_exam_type, "checkpoints", []] call vehexam_fnc_set;
[_exam_type, "triggers", []] call vehexam_fnc_set;
[_exam_type, "veh", objNull] call vehexam_fnc_set;
[_exam_type, "current_checkpoint", 0] call vehexam_fnc_set;
[_exam_type, "success_callback", _success_callback] call vehexam_fnc_set;
[_exam_type, "failure_callback", _failure_callback] call vehexam_fnc_set;
[_exam_type, "bad_driving_check", _bad_driving_check] call vehexam_fnc_set;
[_exam_type, "checkpoint_radius", _checkpoint_radius] call vehexam_fnc_set;

_add_checkpoint = { 
    private ["_checkpoints", "_tr", "_marker", "_examinee"];
    _marker = _this;    

    _tr = createTrigger ["EmptyDetector", _marker];
    _tr setTriggerActivation["ANY", "PRESENT", true];
    _tr setTriggerArea [_checkpoint_radius, _checkpoint_radius, 0, true];
    _tr setTriggerStatements [
        "this",
        format ["
                _examinee = [""%1"", ""examinee""] call vehexam_fnc_get;         
                if( (vehicle _examinee) in thislist ) then {
                    _checkpoints = [""%1"", ""checkpoints""] call vehexam_fnc_get;
                    _current_idx = [""%1"", ""current_checkpoint""] call vehexam_fnc_get;
                    if((count _checkpoints) > _current_idx) then {
                        _current = _checkpoints select _current_idx;                                  
                        if( str _current == str thistrigger) then {                             
                            _next_idx = _current_idx +1;
                            [""%1"", ""current_checkpoint"", _next_idx] call vehexam_fnc_set;
                            _timeout = ['%1', 'timeout_trigger'] call vehexam_fnc_get;
                            _time_left = round (triggerTimeoutCurrent _timeout);
                            [_examinee, ('Checkpoint '+ str _next_idx + '/' +  str (count _checkpoints) + '.  ' + str _time_left + ' Restzeit!')] call vehexam_fnc_hint;                    
                        };        
                    };            
                };
            ",
            _exam_type
        ],
        format ["
         _examinee = [""%1"", ""examinee""] call vehexam_fnc_get;         
         _checkpoints = [""%1"", ""checkpoints""] call vehexam_fnc_get;
         _current_idx = [""%1"", ""current_checkpoint""] call vehexam_fnc_get;
         if ((count _checkpoints) <= _current_idx) then {
            _callback = ['%1', 'success_callback'] call vehexam_fnc_get;
            _examiner_pos = _examinee getVariable 'vehexam_examiner_pos';
            [""%1"", 'You have passed!', _callback] call vehexam_fnc_finish;
			
			[[""%1"",""Driver""], ""vehexam_fnc_licenseExamSuccess"", _examinee, false] call lhm_fnc_mp;
			
         } else {
            (group _examinee) setCurrentWaypoint [(group _examinee), _current_idx];
         };
         ", _exam_type]
    ];
    _tr setTriggerText "checkpoint";
    _checkpoints = [_exam_type, "checkpoints"] call vehexam_fnc_get;
    _checkpoints = _checkpoints + [_tr];
    [_exam_type, "checkpoints", _checkpoints] call vehexam_fnc_set;  
};

_add_more_checkpoints = true;
for [{_i=1}, {_add_more_checkpoints}, {_i=_i+1}] do {
    _next = getMarkerPos format ["%1%2", _exam_type, _i];
    _add_more_checkpoints = str (_next) != str [0,0,0];
    if(_add_more_checkpoints) then {
        _next call _add_checkpoint;         
    };
};  

vehicle_exam_begin_flag = [];
"vehicle_exam_begin_flag" addPublicVariableEventHandler {
    (_this select 1) call vehexam_fnc_begin;
};


vehicle_exam_finish_flag = [];
"vehicle_exam_finish_flag" addPublicVariableEventHandler {
    (_this select 1) call vehexam_fnc_finish;
};