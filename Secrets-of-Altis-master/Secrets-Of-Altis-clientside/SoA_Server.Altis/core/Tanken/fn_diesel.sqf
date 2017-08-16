/*
	File: fn_diesel.sqf
	Author: Paradox
	
	Description: LKW's tanken Diesel?
*/
private["_vehicle", "_controll", "_liter", "_completeliter", "_costs", "_vehicleFuelold", "_ui", "_progress", "_pgText", "_cP", "_vehicleName","_tanke"];

_vehicle = _this select 0;
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_controll = 0.01;
_liter = 1;
_completeliter = 1;
_cost = 0;
_vehicleFuelold = 0;
_vehicle engineOn false;

{_x action ["getout", vehicle player];} foreach (crew _vehicle);
_vehicle lock 3;

switch(true)do
{
	//Kleine Trucks Tankgeschwindigkeit
	case (_vehicle iskindof "O_T_LSV_02_unarmed_F"): {_liter = 0.00900; _completeliter = 200;};
	case (_vehicle iskindof "B_T_LSV_01_unarmed_F"): {_liter = 0.00900; _completeliter = 200;};

	case (_vehicle iskindof "C_Van_01_transport_F"): {_liter = 0.00900; _completeliter = 125;};
	case (_vehicle iskindof "C_Van_01_box_F"): {_liter = 0.00900; _completeliter = 135;};
	case (_vehicle iskindof "C_Van_01_fuel_F"): {_liter = 0.00900; _completeliter = 160;};
	
	//Zamak
	case (_vehicle iskindof "I_Truck_02_transport_F"): {_liter = 0.00900; _completeliter = 400;};
	case (_vehicle iskindof "I_Truck_02_covered_F"): {_liter = 0.00900; _completeliter = 400;};
	case (_vehicle iskindof "I_Truck_02_fuel_F"): {_liter = 0.00900; _completeliter = 400;};	
	case (_vehicle iskindof "I_Truck_02_box_F"): {_liter = 0.00900; _completeliter = 400;};	

	//Hemett
	case (_vehicle iskindof "B_Truck_01_transport_F"): {_liter = 0.00900; _completeliter = 450;};
	case (_vehicle iskindof "B_Truck_01_covered_F"): {_liter = 0.00900; _completeliter = 450;};
	case (_vehicle iskindof "B_Truck_01_mover_F"): {_liter = 0.00900; _completeliter = 450;};
	case (_vehicle iskindof "B_Truck_01_box_F"): {_liter = 0.00900; _completeliter = 450;};
	case (_vehicle iskindof "B_Truck_01_Repair_F"): {_liter = 0.00900; _completeliter = 450;};
	case (_vehicle iskindof "B_Truck_01_ammo_F"): {_liter = 0.00900; _completeliter = 450;};	
	case (_vehicle iskindof "B_Truck_01_fuel_F"): {_liter = 0.00900; _completeliter = 450;};
	case (_vehicle iskindof "B_Truck_01_medical_F"): {_liter = 0.00900; _completeliter = 450;};

	//Tempest
	case (_vehicle iskindof "O_Truck_03_covered_F"): {_liter = 0.00900; _completeliter = 500;};
	case (_vehicle iskindof "O_Truck_03_transport_F"): {_liter = 0.00900; _completeliter = 500;};
	case (_vehicle iskindof "O_Truck_03_covered_F"): {_liter = 0.00900; _completeliter = 500;};
	case (_vehicle iskindof "O_Truck_03_device_F"): {_liter = 0.00900; _completeliter = 500;};
	case (_vehicle iskindof "O_Truck_03_fuel_F"): {_liter = 0.00900; _completeliter = 500;};
	case (_vehicle iskindof "O_Truck_03_ammo_F"): {_liter = 0.00900; _completeliter = 500;};

	default {hint "Dein Fahrzeug kann nicht gefunden werden, melde das dringend einem Admin. Tanke nun Diesel mit einem Tank von 50 Litern.";_liter = 0.02; _completeliter = 50;}
};

_vehicleFuelold = fuel _vehicle;
_cost = round(((1 - _vehicleFuelold) * _completeliter) * fuel_diesel);


_action = [
	format["Möchtest du dein Fahrzeug %1 volltanken? Dies kostet %2€ und wird von deinem Konto abgezogen. Sollte der Tankvorgang unterbrochen werden, wird kein Geld erstattet.",_vehicleName,[_cost] call life_fnc_numberText],
	"LKW mit Diesel betanken",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(_action) then {

	_bank = [
		"Wie möchtest du zahlen? (+30% Transaktionskosten bei Kreditkartenzahlung!)",
		"Zahlungsvorgang",
		"Kreditkarte",
		"Bar"
	] call BIS_fnc_guiMessage;

	if(_bank) then {
		
		if(fuel _vehicle > 0.99) exitWith {hint "Dein Fahrzeug ist bereits voll betankt"; 5 cutText ["","PLAIN"];};
		if(life_beatbankgeld < _cost) exitWith {hint format["Du hast nicht genügend Geld auf der Bank! Du benötigst %1€",[(_cost * 1.3)] call life_fnc_numberText]; 5 cutText ["","PLAIN"];};
		life_beatbankgeld = life_beatbankgeld  - (_cost * 1.3);
		
		_cP = _vehicleFuelold;
		_vehicle say3D "tanken";

		while {fuel _vehicle < 0.99} do {
			sleep  0.2;
			_cP = (_cP + _liter) min 1;
			hintSilent format["Betanke %2 (%3%1)...","%",_vehicleName,round((fuel _vehicle) * 100 ) ];
			if(_cP >= 1) exitWith {};
			if(player distance _vehicle > 10) exitWith {hint "Du musst zum Tanken im Umkreis von 10 Metern bleiben.";};
			_vehicle setFuel ((fuel _vehicle + _liter) min 1);
		};
			
		if (round (fuel _vehicle) > 0.99) then {
			_vehicle setFuel 1;
			hint format ["Dein Fahrzeug %1 wurde für %2€ vollgetankt. Wir wünschen eine gute Weiterfahrt!" , _vehicleName,[(_cost * 1.3)] call life_fnc_numberText];
		};
		
		
	} else {
			
		if(fuel _vehicle > 0.99) exitWith {hint "Dein Fahrzeug ist bereits voll betankt"; 5 cutText ["","PLAIN"];};
		if(life_beatgeld < _cost) exitWith {hint format["Du hast nicht genügend Geld dabei! Du benötigst %1€",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"];};
		life_beatgeld = life_beatgeld - _cost;
		
		_cP = _vehicleFuelold;
		_vehicle say3D "tanken";

		while {fuel _vehicle < 0.99} do {
			sleep  0.2;
			_cP = (_cP + _liter) min 1;
			hintSilent format["Betanke %2 (%3%1)...","%",_vehicleName,round((fuel _vehicle) * 100 ) ];
			if(_cP >= 1) exitWith {};
			if(player distance _vehicle > 5) exitWith {hint "Du musst zum Tanken im Umkreis von 5 Metern bleiben.";};
			_vehicle setFuel ((fuel _vehicle + _liter) min 1);
		};
			
		if (round (fuel _vehicle) > 0.99) then {
			_vehicle setFuel 1;
			hint format ["Dein Fahrzeug %1 wurde für %2€ vollgetankt. Wir wünschen eine gute Weiterfahrt!" , _vehicleName,[_cost] call life_fnc_numberText];
		};
	};

} else {
	hint "Betanken abgebrochen.";
};

_vehicle lock 0;