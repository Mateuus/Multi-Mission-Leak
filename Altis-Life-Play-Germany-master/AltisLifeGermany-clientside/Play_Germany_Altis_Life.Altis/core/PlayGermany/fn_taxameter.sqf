/*
	file: fn_taxameter.sqf
	
	Author: RafiQuak for Play Germany
	http://play-germany.de

*/
private ["_completeDistance","_price","_vehicle","_position","_newPos","_distance","_text"];
_completeDistance = 1000;
_price = 0;
_wasPaused = false;
PG_taxameterVehicle = vehicle player; 
if (PG_taxameterVehicle getVariable["taxameterOn",false]) exitWith {hint "Bei diesem Fahrzeug läuft das Taxameter bereits!"; PG_taxameterVehicle = objNull;};
_position = position PG_taxameterVehicle;
PG_taxameterVehicle setVariable["taxameter",0,true];
PG_taxameterVehicle setVariable["taxameterOn",true,true];

PG_taxameterPauseAction = player addAction ["<t color='#f0ff00'>Taxameter pausieren</t>",{PG_taxameterVehiclePaused = (PG_taxameterVehicle getVariable ["taxameterPaused",false]); PG_taxameterVehicle setVariable["taxameterPaused",!PG_taxameterVehiclePaused, true]; if(PG_taxameterVehiclePaused) then {player setUserActionText [PG_taxameterPauseAction, "<t color='#f0ff00'>Taxameter pausieren</t>"]} else {player setUserActionText [PG_taxameterPauseAction, "<t color='#f0ff00'>Taxameter fortsetzen</t>"]};}];
PG_taxameterStoppAction = player addAction ["<t color='#f0ff00'>Taxameter stoppen</t>",{PG_taxameterVehicle setVariable ["taxameterOn",false,true]}];

while {PG_taxameterVehicle getVariable["taxameterOn",false]} do {
	if(_wasPaused) then {_position = position PG_taxameterVehicle; _wasPaused = false;};
	_newPos = position PG_taxameterVehicle;
    _distance = _position distance _newPos;
	_position = _newPos;
	_completeDistance = _completeDistance + round _distance;
	_price = _completeDistance * 1;
	PG_taxameterVehicle setVariable["taxameter",_price,true];
	sleep 4;
	_wasPaused = (PG_taxameterVehicle getVariable["taxameterPaused",false]);
	waitUntil{sleep 1; (!(PG_taxameterVehicle getVariable["taxameterPaused",false])) || (!(PG_taxameterVehicle getVariable["taxameterOn",false]))};
};

player removeAction PG_taxameterPauseAction;
player removeAction PG_taxameterStoppAction;
PG_taxameterVehicle = objNull;
