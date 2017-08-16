/*
	File: fn_gasVehicle.sqf
	Author: MarkusSR1984

	Description:
	Tankt das gewählte Fahrzeug auf

*/
private["_currFuelFaktor","_timePerLiter","_oneLiter","_isStateMember","_className","_vehicleInfo","_maxFuel"];	
	
if(isNull DWEV_gas_vehicle OR !alive DWEV_gas_vehicle OR isNil "DWEV_gas_vehicle") exitWith { hint format "Fahrzeug nicht gefunden!"; closeDialog 0;};
//if (DWEV_lastKlickTime > (diag_tickTime -3)) exitWith {hint "Du musst die Tanktaste drücken und halten! nicht klicken !!!"};
if (isEngineOn DWEV_gas_vehicle) exitWith {hint 'Der Motor des Fahrzeuges muss abgeschaltet werden!'};
//DWEV_lastKlickTime = diag_tickTime;
	
_className = typeof DWEV_gas_vehicle;
_vehicleInfo = [_className] call DWEV_fnc_fetchVehInfo;
_maxFuel = (_vehicleInfo select 12); // Maximaler Tankinhalt in Litern
_currFuelFaktor = (fuel DWEV_gas_vehicle); // Tankfüllungsfaktor 0 - 1
_timePerLiter = 0.75; // Zeit in Sekunden die Pro Liter benütigt werden

_oneLiter = (1 / _maxFuel);

DWEV_gas_refuel = 1;
_isStateMember = false;

	switch ((side player)) do 
	{
		case west; // Polizei
		case independent: // Feuerwehr
		{
			_isStateMember = true,
		};
		default {};
	};


if (_maxfuel >= 100) then {_timePerLiter = 0.65};
if (_maxfuel >= 300) then {_timePerLiter = 0.55};
if (_maxfuel >= 500) then {_timePerLiter = 0.4};
if (_maxfuel >= 750) then {_timePerLiter = 0.3};
if (_maxfuel >= 1000) then {_timePerLiter = 0.15};
if (_maxfuel >= 2500) then {_timePerLiter = 0.05};
		
while{!((DWEV_gas_refuel == 0) || ((fuel DWEV_gas_vehicle) == 1) || (_currFuelFaktor == 1))} do
{
	_currFuelFaktor = (_currFuelFaktor + _oneLiter);
	if((( round((DWEV_gas_liter + 1) * DWEV_gas_price)) > dwf_atmcash) && !_isStateMember) exitWith { hint "Du besitzt nicht genügend Geld um weiter zu Tanken!"; DWEV_gas_refuel = 0;};
	if (isEngineOn DWEV_gas_vehicle) exitWith {hint 'Der Motor des Fahrzeuges muss abgeschaltet bleiben!'; DWEV_gas_refuel = 0;};
	
	DWEV_gas_liter = (DWEV_gas_liter + 1);
				
	if (local DWEV_gas_vehicle) then 
	{
		[DWEV_gas_vehicle,_currFuelFaktor] spawn DWEV_fnc_setFuel;
	};
			
	[] call DWEV_fnc_gasVehicleUpdate;
	uisleep _timePerLiter;
	if(!dialog) exitwith {DWEV_gas_refuel = 0;};
};
DWEV_gas_refuel = 0;

if(DWEV_gas_liter == 0) exitWith {};
_price = ( round( DWEV_gas_liter * DWEV_gas_price));
		
switch ((side player)) do 
{
	case west; // Polizei
	case independent: // Feuerwehr
	{
		[player,_price,"Tankstelle"] remoteExec ["DWF_fnc_getGasFromStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		hint format ["Du hast %1 Liter in dein Fahrzeug getankt! \nDer Preis von %2€ wird von der Staatskasse übernommen", round(DWEV_gas_liter), _price];
	};
	default 
	{
			dwf_atmcash = (dwf_atmcash - _price);
			hint format ["Du hast %1 Liter in dein Fahrzeug getankt! \nDer Preis betraegt %2€!\n Diese wurden von deinem Bankkonto abgebucht", round(DWEV_gas_liter), _price];
	};

};
[DWEV_gas_vehicle,_currFuelFaktor] remoteExec ["DWEV_fnc_setFuel",DWEV_gas_vehicle];
["oilp",DWEV_gas_liter] remoteExec ["DWEV_fnc_addBuyProm",2];
DWEV_gas_liter = 0;
