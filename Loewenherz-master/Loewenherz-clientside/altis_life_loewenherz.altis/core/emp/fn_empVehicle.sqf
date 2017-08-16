/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith { hint "Das EMP ist in Benutzung oder lädt nach!"; };

	_index = lbCurSel (2902);
	if (_index == -1) exitWith {Hint "Nichts ausgewaehlt!"};

	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitwith {hint "iwas komisch (1)"};
	nn_empInUse = true;
	playSound "acceptbutton";
	Hint "Starte Impuls...";

//	[[_vehicle],"lhm_fnc_vehicleEmpd",crew _vehicle,false] call lhm_fnc_mp;
	[[_vehicle],"lhm_fnc_vehicleEmpd",nil,false] call lhm_fnc_mp; // Activate EMP on selected Vehicle

	if(_vehicle isKindOf "Car") then {
	sleep 3.35;

	[[(vehicle player),"empfire"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;

	// Creates EMP Flash
	_empflash = "#lightpoint" createVehicle getpos (vehicle player);
	_empflash setLightAmbient[0, 750, 1500];
	_empflash setLightColor[0, 750, 1500];
	_empflash setLightBrightness 1000;
	//_empflash setLightFlareMaxDistance 300;
	sleep 0.001;
	deletevehicle _empflash;
	};

	if(_vehicle isKindOf "Air") then {
	sleep 3.35;
	sleep 3.35;
	sleep 3.35;
	[[player,"empfire"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;

	// Creates EMP Flash
	_empflash = "#lightpoint" createVehicle getpos (vehicle player);
	_empflash setLightAmbient[0, 750, 1500];
	_empflash setLightColor[0, 750, 1500];
	_empflash setLightBrightness 1000;
	//_empflash setLightFlareMaxDistance 300;
	sleep 0.001;
	deletevehicle _empflash;
	};

	if(_vehicle isKindOf "Ship") then {
	sleep 3.35;
	[[player,"empfire"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;
	// Creates EMP Flash
	_empflash = "#lightpoint" createVehicle getpos (vehicle player);
	_empflash setLightAmbient[0, 750, 1500];
	_empflash setLightColor[0, 750, 1500];
	_empflash setLightBrightness 1000;
	//_empflash setLightFlareMaxDistance 300;
	sleep 0.001;
	deletevehicle _empflash;
	};

	sleep (5 * 60);
	nn_empInUse = false;
	playSound "isready";
	Hint "EMP ist bereit";
};
