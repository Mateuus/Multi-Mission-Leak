/*
		fn_werkstattrepair.sqf
		Author: G00golplexian
		
		Description: Repairs the car, yeah :D
*/

private["_vehicle", "_vehicleArray", "_ui", "_progress", "_pgText", "_cP", "_vehicleName"];

_vehicleArray = nearestObjects[getPos player, ["Landvehicle","Air"],20];

if(count _vehicleArray == 0) exitwith { hint "Kein Fahrzeug gefunden!"};
if(count _vehicleArray > 1) exitwith { hint "Es wurde mehr als ein Fahrzeug im Umkreis von 5 Metern gefunden! Bitte entferne alle weiteren Fahrzeuge...";};

_vehicle = (_vehicleArray select 0);
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_vehicleRate = 1;
_damageOld = damage _vehicle;

switch(typeOf _vehicle) do {
	case "C_Quadbike_01_F": {_vehicleRate = 4500};
	case "B_Quadbike_01_F": {_vehicleRate = 4500};
	case "C_Offroad_01_F": {_vehicleRate = 15000};
	case "B_G_Offroad_01_F": {_vehicleRate = 15000};
	case "C_Hatchback_01_F": {_vehicleRate = 12000};
	case "C_Hatchback_01_sport_F": {_vehicleRate = 15000};
	case "C_SUV_01_F": {_vehicleRate = 19000};
	case "C_Van_01_box_F": {_vehicleRate = 25500};
	case "C_Van_01_transport_F": {_vehicleRate = 25000};
	case "C_Van_01_fuel_F": {_vehicleRate = 26000};
	//Trucks
	case "I_Truck_02_fuel_F": {_vehicleRate = 50000};
	case "I_Truck_02_transport_F": {_vehicleRate = 55000};
	case "I_Truck_02_covered_F": {_vehicleRate = 60000};
	case "B_Truck_01_fuel_F": {_vehicleRate = 70000};
	case "B_Truck_01_transport_F": {_vehicleRate = 75000};
	case "B_Truck_01_covered_F": {_vehicleRate = 80000};
	case "B_Truck_01_box_F": {_vehicleRate = 150000};
	case "O_Truck_03_device_F": {_vehicleRate = 200000};
	//Go-Kart
	case "C_Kart_01_Fuel_F": {_vehicleRate = 1000};
	case "C_Kart_01_Red_F": {_vehicleRate = 1000};
	case "C_Kart_01_Vrana_F": {_vehicleRate = 1000};
	case "C_Kart_01_Blu_F": {_vehicleRate = 1000};
};

if(_vehicle isKindOf "Air") then {_vehicleRate = 15000};

_cost = round(_damageOld * _vehicleRate);

//Erstelle Dialog
if(damage _vehicle <= 0) exitWith {hint "Dein Fahrzeug ist bereits in bestem Zustand!"};

_action = [
	format["Möchtest du dein Fahrzeug %1 reparieren? Dies kostet %2€ und wird von deinem Konto abgezogen. Sollte der Reparaturvorgang unterbrochen werden, wird kein Geld erstattet.",_vehicleName,[_cost] call life_fnc_numberText],
	"Fahrzeug reparieren?",
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

		if(life_beatbankgeld < _cost) exitWith {hint format["Du hast nicht genügend Geld auf der Bank! Du benötigst %1€",[(_cost * 1.3)] call life_fnc_numberText]; 5 cutFadeout 1;};
		life_beatbankgeld = life_beatbankgeld  - (_cost * 1.3);
		
		_vehicle say3D "reparatur";

		_sleep = 0.2;
		_cP = 0.02;
		_upp = format["Repariere %2",_vehicleName];

		_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
		if(life_process_bad) exitWith {life_process_bad = false;};

		_vehicle setdamage 0; 
		hint format ["Dein Fahrzeug %1 wurde für %2€ repariert. Wir wünschen eine gute Weiterfahrt" , _vehicleName,[(_cost * 1.3)] call life_fnc_numberText];
		
	} else {
			
		if(life_beatgeld< _cost) exitWith {hint format["Du hast nicht genügend Geld auf der Bank! Du benötigst %1€",[_cost] call life_fnc_numberText]; 5 cutFadeout 1;};
		life_beatgeld = life_beatgeld - _cost;
		
		_vehicle say3D "reparatur";
		
		_sleep = 0.2;
		_cP = 0.02;
		_upp = format["Repariere %2",_vehicleName];

		_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
		if(life_process_bad) exitWith {life_process_bad = false;};

		_vehicle setdamage 0; 
		hint format ["Dein Fahrzeug %1 wurde für %2€ repariert. Wir wünschen eine gute Weiterfahrt" , _vehicleName,[(_cost * 1.3)] call life_fnc_numberText];
	};
};