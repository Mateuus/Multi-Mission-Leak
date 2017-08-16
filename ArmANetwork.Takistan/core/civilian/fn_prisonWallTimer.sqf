/*
	READ THE FILE NAME!
*/
private["_uiDisp","_time","_timer"];
disableSerialization;
6 cutRsc ["life_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (3 * 60);
[5,"<t size='1.5'><t color='#0000ff'>SOMEONE HAS PLACED A EXPLOSIVE CHARGE ON THE JAIL ENTRANCE</t></t>"] remoteExecCall ["life_fnc_broadcast",west];
while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["life_timer","PLAIN"];
		_uiDisp = uiNamespace getVariable "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	if(!(prison_safe getVariable["pchargeplaced",false])) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
6 cutText["","PLAIN"];
