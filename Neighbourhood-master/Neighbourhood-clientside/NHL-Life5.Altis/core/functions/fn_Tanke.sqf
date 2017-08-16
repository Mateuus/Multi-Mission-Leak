/*
	File: fn_D41_Tanke.sqf
	Author: Distrikt41 - Dscha
	
	Description:
	Jo ähm, befüllen der Karre halt.
	HALLO PHIL UND LARGO. WIE IHR SEHEN KÖNNT IST DAS HIER VON DISTRIKT 41 UND NICHT VON SYNCED41!
*/
private["_Karre","_Tankstand","_action", "_target", "_FuelSize", "_vehicle", "_name","_ui","_progress","_pgText","_fuelMod"];

_Karre = nearestObjects[getPos player,["Car","Air"],10];
if(count (_Karre) > 0) then
{
	if(D41_Tankt) exitWith {hint "Du kannst nur ein Fahrzeug zur Zeit betanken"};
	_vehicle = _Karre select 0;
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	_action = [
	format["%1 betanken?<br/>Benzinpreis: %2€/Durchlauf", _name, 50],"Tanken","Ja","Nein"
	] call BIS_fnc_guiMessage;

	D41_Tankt = true;
	D41_TankeVebraucht = 0;
	_fuel = 0;
	_fuelMod = 0;
	_fuel = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "fuelCapacity");
	if(_vehicle isKindOf "Car") then {_fuelMod = ((1/(_fuel / 100))/100);};
	if(_vehicle isKindOf "Air") then {_fuelMod = ((1/(_fuel / 100))/5);};
	if(_fuelmod < 0.015) then
	{
	_fuelmod = 0.015;
	};
	
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_progress progressSetPosition (Fuel _vehicle);
	
	if(_action) then
	{
		while{true}do
		{
			if((life_atmcash - 125) < 0) exitWith {D41_Tankt = false; titleText[format["Nicht genügend Geld auf der Bank. Kontostand: %1",life_atmcash],"PLAIN"]; 5 cutText ["","PLAIN"];};
			life_atmcash = life_atmcash - 50;
			_Tankstand = Fuel _vehicle;
			_vehicle setFuel (_Tankstand + _fuelMod);
			_progress progressSetPosition _Tankstand;
			_pgText ctrlSetText format["%3 %4 (%1%2)...",round(_Tankstand * 100),"%","Betanke", _name];
			D41_TankeVebraucht = D41_TankeVebraucht + 1;
			if(_Tankstand > 0.9999) exitWith {D41_Tankt = false; titleText[format["Du hast deinen %1 vollständig betankt",_name],"PLAIN"]; 5 cutText ["","PLAIN"];};
			if((vehicle player) distance _vehicle > 8) exitWith {D41_Tankt = false; titleText["Halt doch bitte den Zapfhahn fest...","PLAIN"]; 5 cutText ["","PLAIN"];};
			if(!alive player) exitWith {D41_Tankt = false; hint "RIP"; 5 cutText ["","PLAIN"];};
			if(vehicle player != player) exitWith {D41_Tankt = false;hint "Du musst schon selber tanken..."; 5 cutText ["","PLAIN"];};
			sleep 1
		};
	};
	5 cutText ["","PLAIN"];
	
	D41_Tankt = false;
};