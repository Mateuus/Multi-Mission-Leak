/*
	READ THE FILE NAME!
*/
private["_uiDisp","_time","_timer"];
disableSerialization;

_layer = "life_timer" call BIS_fnc_rscLayer;
_layer cutRsc [ "life_timer", "PLAIN" ];

_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (1 * 30);

while {true} do {
	if(isNull _uiDisp) then {
		_layer cutRsc ["life_timer","PLAIN"];
		_uiDisp = uiNamespace getVariable "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	if(!(gold_safe getVariable["wchargeplaced",false])) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};

_layer cutText["","PLAIN"];