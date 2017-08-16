/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(life_empInUse) exitWith { hint "Das EMP warnt grade schon ein Fahrzeug, warte bitte kurz bis du erneut warnen kannst !"; };
	life_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = life_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	
	if(_vehicle getVariable ["warnedfirst", false]) then
	{
		if(_vehicle getVariable ["warnedsecond", false]) then
		{
			hint "Du hast dieses Fahrzeug schon zwei mal gewarnt, du kannst es nun EMP'n!";
			life_empInUse = false;
		} else {
			hint "Du hast das Fahrzeug das zweite mal gewarnt, du kannst es in einer Minuten EMP'n !";
			[_vehicle] remoteExec ["tanoarpg_fnc_vehicleWarned", crew _vehicle, false];
			[player, driver _vehicle, 3, "[EMP]", "Hat das Fahrzeug das zweite mal gewarnt"] remoteExec ["TEX_FNC_LOGIT", 2];
			sleep 60;
			life_empInUse = false;
			_vehicle setVariable["warnedsecond",true,true];
		};
	} else {
		hint "Du hast das Fahrzeug das erste mal gewarnt, du kannst es in einer Minuten erneut warnen !";
		[_vehicle] remoteExec ["tanoarpg_fnc_vehicleWarned", crew _vehicle, false];
		[player, driver _vehicle, 3, "[EMP]", "Hat das Fahrzeug das erste mal gewarnt"] remoteExec ["TEX_FNC_LOGIT", 2];
		sleep 60;
		life_empInUse = false;
		_vehicle setVariable["warnedfirst",true,true];
	};
};