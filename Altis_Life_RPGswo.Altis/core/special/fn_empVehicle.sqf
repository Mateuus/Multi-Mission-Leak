/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
	edit by Division-wolf.de
*/
private["_index","_vehicle","_empWarnCount"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith { hint "Das EMP warnt grade schon ein Fahrzeug oder die Batterie muss sich erst wieder aufladen"; };
	
    _index = lbCurSel (2902);
    _vehicle = nn_last_vehicles select _index;
    if(isNull _vehicle) exitWith {};
	_vehicle = nn_last_vehicles select _index;
	_empWarnCount = _vehicle getVariable ["was_warned",0];
	if (_empWarnCount < 2) exitWith {hint "Du musst das Fahrzeug min. 2mal warnen!!!! EMP kann nicht gezündet werden"; }; // Prüfen ob 2 Warnungen abgegeben wurden
	
	player doWatch _vehicle;
	_pos1 = getPos player;
	_pos2 = getPos _vehicle;
	_dist = _pos1 distance _pos2;
	if (_dist > 150 ) exitWith { hint "Fahrzeug ist ausser Reichweite"; };

		nn_empInUse = true;
        hint "Schalte das Fahrzeug aus";
        (vehicle player) say3D "empacsound";
		[_vehicle] remoteExec ["DWEV_fnc_vehicleEmpd",(crew _vehicle)];
		closeDialog 0;
        hint "Das Fahrzeug wurde ausgeschaltet... EMP Cooldown 3 Minuten";
        
		disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNameSpace getVariable "DWEV_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;

_pgText ctrlSetText format["%2 (1%1)...","%","EMP Cooldown"];
_progress progressSetPosition 0.01;
_cP = 0.01;
	
		while{true} do
	{
		sleep  1.8;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["EMP Cooldown nach Warnung      (%1%2)...",round(_cP * 100),"%"];
		if(_cP >= 1) exitWith {};
	};
	5 cutText ["","PLAIN"];

        hint "EMP ist BEREIT";
        nn_empInUse = false;
    };