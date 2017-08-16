/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
	edit by Division-wolf.de
*/
private["_index","_vehicle","_empWarnCount","_tmpEmpWarnCount","_warnCooldown","_empMinimumWarn","_dist","_pos1","_pos2"];
disableSerialization;
_dist = 0;   // Initialisiere Positionsüberwachung
	
if(!isNull (findDisplay 3494)) then {
	_warnCooldown = 60;  // Cooldown Zeit fuer Warnungen
	
	if(nn_empInUse) exitWith { hint "Das EMP warnt grade schon ein Fahrzeug"; };
	
	nn_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	_empWarnCount = 0;
        if(isNull _vehicle) exitWith {};

	//player doWatch _vehicle;
	_pos1 = getPos player;
	_pos2 = getPos _vehicle;
	_dist = _pos1 distance _pos2;
	if (_dist > 300 ) exitWith { hint "Fahrzeug ist ausser Reichweite"; };

		
   _tmpEmpWarnCount = _vehicle getVariable["was_warned",0]; // Auslesen der Warnungsanzahl

	if ((_tmpEmpWarnCount >= 0) &&  (_tmpEmpWarnCount <= 10)) then {_empWarnCount = _tmpEmpWarnCount};
            
		[_vehicle] remoteExec ["DWEV_fnc_vehicleWarned",crew _vehicle];

        _empWarnCount = _empWarnCount + 1; // Warnungen fuer Fahrzeug hinzuzaehlen
        
		//hint "Warnung " + str(_empWarnCount) + " von 2";
        hint format["EMP Warnung %1 von 2 wurde gesendet. Cooldown %2 Sekunden" ,_empWarnCount, _warnCooldown];
        
        _vehicle setVariable["was_warned",_empWarnCount,true]; // Abspeichern der localen variable auf das Fahrzeug
  
closeDialog 0;	

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
		sleep  0.6;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["EMP Cooldown nach Warnung      (%1%2)...",round(_cP * 100),"%"];
		if(_cP >= 1) exitWith {};
	};
	5 cutText ["","PLAIN"];

	if (_empWarnCount == 1 ) then {hint "EMP MELDUNG: Sie können nun eine weitere Warnung an das Fahrzeug senden";};
	if (_empWarnCount >= 2 ) then {hint "EMP MELDUNG: Das Fahrzeug kann jetzt deaktiviert werden";};
	
	
	nn_empInUse = false;
	
	

	while {_dist < 4000} do
	{
	sleep 10;
	//player doWatch _vehicle;
	_pos1 = getPos player;
	_pos2 = getPos _vehicle;
	_dist = _pos1 distance _pos2;
	//hint format["Aktuelle Entfernung: %1m",_dist]; // Anzeige nur zum Testen
	};
	hint "Entfernung zu Fahrzeug überschritten... Lösche Warnungen!";
	_vehicle setVariable["was_warned",0,true];
};

