/*
	READ THE FILE NAME!
*/
private["_uiDisp","_time","_timer","_countdown","_mode","_object"];
_countdown = param [0,8,[8]];
_mode = param [1,false,[false]];
_object = param [2,ObjNull,[ObjNull]];

disableSerialization;
6 cutRsc ["lhm_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "lhm_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (_countdown * 60);

if(_mode) then {
	while {true} do {
		if(isNull _uiDisp) then {
			6 cutRsc ["lhm_timer","PLAIN"];
			_uiDisp = uiNamespace getVariable "lhm_timer";
			_timer = _uiDisp displayCtrl 38301;
		};
		if(round(_time - time) < 1) exitWith {};
		if(!(_object getVariable["chargeplaced",false])) exitWith {};
		_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		sleep 0.08;
	};
} else {
	while {true} do {
		if(isNull _uiDisp) then {
			6 cutRsc ["lhm_timer","PLAIN"];
			_uiDisp = uiNamespace getVariable "lhm_timer";
			_timer = _uiDisp displayCtrl 38301;
		};
		if(round(_time - time) < 1) exitWith {};
		if(!(fed_bank getVariable["chargeplaced",false])) exitWith {};
		_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		sleep 0.08;
	};
};

6 cutText["","PLAIN"];