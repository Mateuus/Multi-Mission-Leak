/*
	File: superplus.sqf
	Author: Paradox
	
	Description: Wer braucht Super ? Siehe fn_diesel.sqf
*/
private["_vehicle", "_controll", "_liter", "_completeliter", "_costs", "_vehicleFuelold", "_vehicleArray", "_ui", "_progress", "_pgText", "_cP", "_vehicleName"];

_vehicle =_this select 0;
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_controll = 0.01;
_liter = 1;
_completeliter = 1;
_cost = 0;
_vehicleFuelold = 0;
_vehicle engineOn false;

{_x action ["getout", vehicle player]} foreach (crew _vehicle);
_vehicle lock 3;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//1.00 = voll = 100% annahme 65 Liter fasst Tank von offroad währen: 1.00 / 65L = 0.0154L 
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////

switch(true)do
{
	case (_vehicle iskindof "C_Offroad_01_F"): {_liter = 0.00900; _completeliter = 85;};
	case (_vehicle iskindof "C_SUV_01_F"): {_liter = 0.00900; _completeliter = 65;};
	case (_vehicle iskindof "C_Hatchback_01_F"): {_liter = 0.00900; _completeliter = 50;};
	case (_vehicle iskindof "C_Hatchback_01_sport_F"): {_liter = 0.00900; _completeliter = 50;};
	case (_vehicle iskindof "B_MRAP_01_F"): {_liter = 0.00900; _completeliter = 125;};
	case (_vehicle iskindof "B_MRAP_01_hmg_F"): {_liter = 0.00900; _completeliter = 125;};
	case (_vehicle iskindof "B_G_Offroad_01_armed_F"): {_liter = 0.00900; _completeliter = 85;};
	case (_vehicle iskindof "B_G_Offroad_01_F"): {_liter = 0.00900; _completeliter = 85;};
	case (_vehicle iskindof "I_MRAP_03_F"): {_liter = 0.00900; _completeliter = 125;};
	case (_vehicle iskindof "O_MRAP_02_F"): {_liter = 0.00900; _completeliter = 125;};
	case (_vehicle iskindof "O_MRAP_02_hmg_F"): {_liter = 0.00900; _completeliter = 125;};
	case (_vehicle iskindof "B_Quadbike_01_F"): {_liter = 0.00900; _completeliter = 25;};
	default {hint "Dein Fahrzeug kann nicht gefunden werden, melde das dringend einem Admin. Tanke nun Super mit einem Tank von 50 Litern.";_liter = 0.02; _completeliter = 50;}
};

_vehicleFuelold = fuel _vehicle;
_cost = round(((1 - _vehicleFuelold) * _completeliter) * fuel_super_plus);


_action = [
	format["Möchtest du dein Fahrzeug %1 volltanken? Dies kostet dich %2€. Sollte der Tankvorgang unterbrochen werden, wird kein Geld erstattet.",_vehicleName,[_cost] call life_fnc_numberText],
	"PKW mit Super-Plus betanken",
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
		
		if(fuel _vehicle > 0.99) exitWith {hint "Dein Fahrzeug ist bereits voll betankt."; 5 cutText ["","PLAIN"];};
		if(life_beatbankgeld < _cost) exitWith {hint format["Du hast nicht genügend Geld auf der Bank! Du benötigst %1€.",[(_cost * 1.3)] call life_fnc_numberText]; 5 cutText ["","PLAIN"];};
		life_beatbankgeld = life_beatbankgeld - (_cost * 1.3);
		
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
			hint format ["Dein Fahrzeug %1 wurde für %2€ vollgetankt. Wir wünschen eine gute Weiterfahrt!" , _vehicleName,[(_cost * 1.3)] call life_fnc_numberText];
		};
		
	} else {

		if(fuel _vehicle > 0.99) exitWith {hint "Dein Fahrzeug ist bereits voll betankt."; 5 cutText ["","PLAIN"];};
		if(life_beatgeld < _cost) exitWith {hint format["Du hast nicht genügend Geld dabei! Du benötigst %1€.",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"];};
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
	hint "Betanken abgebrochen";
};

_vehicle lock 0;