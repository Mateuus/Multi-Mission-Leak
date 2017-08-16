#include <macro.h>
/*
	File: fn_fuelStationFill.sqf
	Author: MarioF
	Modified by: Altis Life Germany

	Description:
	Changes the FuelFit
*/

private["_display","_txtStation","_txtVehicle","_upp","_ui","_progress","_pgText","_cP","_previousState","_refill","_duration","_away"];
disableSerialization;

if(!isNull findDisplay 29000) then { closeDialog 29000; };

life_interrupted = false;

_veh = SEL(life_fuelstation_lockVeh, 0);
_isTrailer = SEL(life_fuelstation_lockVeh, 1);

_txtStation = "Tankstelle";
if(!isNull life_fuelstation_fueltruck) then {
	_txtStation = FETCH_CONFIG2(getText, CONFIG_VEHICLES, (typeOf life_fuelstation_fueltruck), "displayName");
};
_txtVehicle = FETCH_CONFIG2(getText, CONFIG_VEHICLES, (typeOf _veh), "displayName");
if(_isTrailer == 1) then { ADD(_txtVehicle, " - Auflieger"); };

_upp = format["%2 -> %1",_txtVehicle,_txtStation];
//Setup our progress bar.
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%1 (0 / %2 Liter)...",_upp,life_fuelstation_amount];
_progress progressSetPosition 0.01;
_cP = 0.01;
_duration = ((life_fuelstation_amount * 0.015) min 0.7);
_away = true;

while{alive player && !life_interrupted && _cP < 1 && _away} do
{
	uiSleep _duration;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%1 (%2 / %3 Liter)...",_upp, round(_cP * life_fuelstation_amount), life_fuelstation_amount];
	if((_veh distance player) > 20) then { _away = false; };
	if(!isNull life_fuelstation_fueltruck) then {
		if((life_fuelstation_fueltruck distance player) > 20) then {  _away = false; };
	};
};

5 cutText ["","PLAIN"];
_succAmount = round (life_fuelstation_amount * _cP);

if(life_interrupted || !alive player || !_away) then {
	_txtTmp = format ["Betankungsvorgang abgebrochen, %1 Liter bereits eingefüllt", _succAmount];
	//titleText[_txtTmp,"PLAIN"];
	[_txtTmp, -1, 0.5, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

} else {
	_txtTmp = format ["Betankungsvorgang erfolgreich, du hast %1 Liter eingefüllt", _succAmount];
	//titleText[_txtTmp,"PLAIN"];
	[_txtTmp, -1, 0.5, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
};

if(!isNull life_fuelstation_fueltruck) then {
	life_fuelstation_fueltruck setVariable["fueltruck_fuel",((life_fuelstation_fueltruck GVAR["fueltruck_fuel",0]) - _succAmount),true];
} else {
	BANK = round(BANK - (_succAmount * life_fuelstation_price));
	if(BANK < 0) then { BANK = 0; };
};

if(_isTrailer == 1) then {
	_fillTrailer = ((_veh GVAR["fueltruck_fuel",0]) + _succAmount) min ([(typeOf _veh) + "_TRAILER"] call PG_fnc_vehFuelCap);
	_veh SVAR["fueltruck_fuel",_fillTrailer,true];
} else {
	_fillValue = (fuel _veh) + (_succAmount / ([typeOf _veh] call PG_fnc_vehFuelCap));
	if(local _veh) then {
		_veh setFuel _fillValue;
	} else {
		[[_veh,_fillValue],"life_fnc_setFuel",_veh,false] spawn life_fnc_MP;
	};
};

life_interrupted = false;
life_action_inUse = false;