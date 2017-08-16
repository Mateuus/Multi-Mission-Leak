/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	_index = lbCurSel (2902);
	_vehicle = life_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	
	if(_vehicle getVariable ["warnedfirst", false]) then
	{
		if(_vehicle getVariable ["warnedsecond", false]) then
		{
			if(life_empInUse) exitWith { hint "Das EMP wurde vor kurzem schon abgefeuert und muss noch Aufladen !"; };
			life_empInUse = true;
			(vehicle player) say3D "empacsound";
			[_vehicle] remoteExec ["tanoarpg_fnc_vehicleEmpd", crew _vehicle];
			hint "Du hast das Ziel EMP'd und einen Motorschaden hervorgerufen, aber nicht zerstört ! EMP in fünf Minuten erneut verfügbar !";
			[player, driver _vehicle, 3, "[EMP]", "Hat das EMP auf das Fahrzeug abgefeuert"] remoteExec ["TEX_FNC_LOGIT", 2];
			sleep (5 * 60);
			life_empInUse = false;
		} else {
			hint "Du musst vor dem EMP'n das Fahrzeug das Zweite mal vorwarnen !";
			[player, driver _vehicle, 3, "[EMP]", "Hat versucht zu EMP'n aber wurde kein zweites mal gewarnt"] remoteExec ["TEX_FNC_LOGIT", 2];
		};
	} else {
		hint "Du musst vor dem EMP'n das Fahrzeug erst zwei mal vorwarnen !";
		[player, driver _vehicle, 3, "[EMP]", "Hat versucht zu EMP'n wurde aber noch garnicht vorgewarnt"] remoteExec ["TEX_FNC_LOGIT", 2];
	};
};