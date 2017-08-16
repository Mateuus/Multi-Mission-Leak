/*
	File: fn_fuelStationSliderChange.sqf
	Author: MarioF

	Description:
	Changes the FuelFit
*/


private ["_veh","_isTrailer","_txtStation","_txtVehicle","_upp","_ui","_progress","_pgText","_cP","_duration","_away","_succAmount","_txtTmp","_temp","_fillTrailer","_TRAILER","_fillValue"];
disableSerialization;

if(!isNull findDisplay 29000) then { closeDialog 29000; };

lhm_interrupted = false;

_veh = lhm_fuelstation_lockVeh select 0;
_isTrailer = lhm_fuelstation_lockVeh select 1;

_txtStation = "Gas Pump";
if(!isNull lhm_fuelstation_fueltruck) then {
	_txtStation = getText(configFile >> "CfgVehicles" >> (typeOf lhm_fuelstation_fueltruck) >> "displayName");
};
_txtVehicle = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
if(_isTrailer == 1) then { _txtVehicle = _txtVehicle + " - Auflieger"; };

_upp = format["%2 -> %1",_txtVehicle,_txtStation];
//Setup our progress bar.
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%1 (0 / %2 Litres)...",_upp,lhm_fuelstation_amount];
_progress progressSetPosition 0.01;
_cP = 0.01;
_duration = (((lhm_fuelstation_amount / 2000) max 0.1) min 0.7);
_away = true;

while{alive player && !lhm_interrupted && _cP < 1 && _away} do
{
	sleep _duration;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%1 (%2 / %3 Litres)...",_upp, round(_cP * lhm_fuelstation_amount), lhm_fuelstation_amount];
	if((_veh distance player) > 20) then { _away = false; };
	if(!isNull lhm_fuelstation_fueltruck) then {
		if((lhm_fuelstation_fueltruck distance player) > 20) then {  _away = false; };
	};
};

5 cutText ["","PLAIN"];
_succAmount = round (lhm_fuelstation_amount * _cP);

if(lhm_interrupted || !alive player || !_away) then {
	_txtTmp = format ["Betankungsvorgang abgebrochen, du hast %1 Liter eingefuellt", _succAmount];
	[_txtTmp, -1, 0.5, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

} else {
	_txtTmp = format ["Betankungsvorgang erfolgreich, du hast %1 Liter eingefuellt", _succAmount];
	[_txtTmp, -1, 0.5, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
};

if(!isNull lhm_fuelstation_fueltruck) then {
	lhm_fuelstation_fueltruck setVariable["fueltruck_fuel",((lhm_fuelstation_fueltruck getVariable["fueltruck_fuel",0]) - _succAmount),true];
} else {
	lhm_atmcash = round (lhm_atmcash - (_succAmount * lhm_fuelstation_price));
	_temp = lhm_fuel_seller getvariable["Geldwert",0];
	_temp = _temp + round(_succAmount * lhm_fuelstation_price);
	lhm_fuel_seller setvariable["Geldwert",_temp,true];
	if(lhm_atmcash < 0) then { lhm_atmcash = 0; };
};

if(_isTrailer == 1) then {
	_fillTrailer = ((_veh getVariable["fueltruck_fuel",0]) + _succAmount) min ([(typeOf _veh) + "_TRAILER"] call lhm_fnc_vehFuelCap);
	_veh setVariable["fueltruck_fuel",_fillTrailer,true];
} else {
	_fillValue = (fuel _veh) + (_succAmount / ([typeOf _veh] call lhm_fnc_vehFuelCap));
	if(local _veh) then {
		_veh setFuel _fillValue;
	} else {
		[[_veh,_fillValue],"lhm_fnc_setFuel",_veh,false] call lhm_fnc_mp;
	};
};

lhm_interrupted = false;
lhm_action_inUse = false;