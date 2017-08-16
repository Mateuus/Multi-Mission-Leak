#include "..\..\macros.hpp"
/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2","_price3","_info"];
_control = ((findDisplay 39400) displayCtrl 39402);
_data = _control lbData (lbCurSel _control);
_price = _control lbValue (lbCurSel _control);

_cops = ({side _x == west} count playableUnits);
if(_cops == 0) exitWith { hint "Es können keine Fahrezge verkauft werden solange keine Polizisten sich im Dienst befinden!"; };

{
	if (str(_x) == _data) exitWith
	{
		_vehicle = _x;
	};
	false
} count vehicles;

if (isNil "_vehicle") exitWith {hint "Es ist ein Fehler beim Verkauf aufgetreten!"};
if(isNull _vehicle) exitWith {hint "Es ist ein Fehler beim Verkauf aufgetreten!"};
if !(_vehicle IN vehicles) exitWith {hint "Es ist ein Fehler beim Verkauf aufgetreten!"};

if ((_vehicle distance player) > 25) exitWith {hint "Das Fahtzeug ist zu weit weg!";};
if (_vehicle getVariable["DWEV_chopshop_seller","NOTSET"] != "NOTSET") exitWith {hint "Jemand anderes verkauft dieses Fahrzeug schon"};

closeDialog 0;

//Setup our progress bar.
disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNameSpace getVariable "DWEV_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Verkaufe Fahrzeug..."];
_progress progressSetPosition 0.00;
_cP = 0.00;

_time = switch(true) do //Gesamtzeit
{
	case (_cops >  15): { 6; };
	case (_cops <= 15): { 9; };
	case (_cops <= 10): { 12; };
	case (_cops <= 5): { 16; };
	case (_cops <= 3): { 18; };
	case (_cops == 1): { 20; };
	default { 10; };
};
_sleeptimer = _time / _cops; //Pro cop in S



DWEV_is_processing = true;
_counter = 0;
_progress_percent = 100 / _cops;
while{true} do
{
	sleep (_sleeptimer / 10);
	_counter = _counter + 0.1;
	_progress progressSetPosition _progress_percent*_counter/100;
	_pgText ctrlSetText format["Verkaufe Fahrzeug (noch %1 Sekunden)...",round(_progress_percent*(_cops-_counter)*_sleeptimer/10)];
	if(_counter >= _cops) exitWith {};
	if((player distance DWEV_chopShop) > 10) exitWith {}; 
	if(_vehicle distance DWEV_chopShop > 10) exitWith {};
	if(!alive player) exitWith {};
	if(DWEV_istazed) exitWith {};
	if(DWEV_isdowned) exitWith {};
	if(DWEV_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
};

if(((player distance DWEV_chopShop) > 10) OR (_vehicle distance DWEV_chopShop > 10)) exitWith { hint "Du musst innerhalb von 10m bleiben."; 5 cutText ["","PLAIN"]; DWEV_is_processing = false; };
if(DWEV_istazed OR DWEV_isdowned OR DWEV_interrupted OR (player getVariable["restrained",false]) OR (!alive player)) exitWith { hint "Fehler beim verkaufen!."; 5 cutText ["","PLAIN"]; DWEV_is_processing = false; };

DWEV_is_processing = false;
5 cutText ["","PLAIN"];



hint "Verkaufe Fahrzeug, bitte warten...";
_vehicle setVariable["DWEV_chopshop_seller",getMyName,true];
sleep 1;
if (_vehicle getVariable["DWEV_chopshop_seller",""] != getMyName) exitWith {hint "Jemand anderes verkauft dieses Fahrzeug schon"};
DWEV_action_inUse = true;

_price2 = dwf_cash + _price;
_price3 = dwf_atmcash;

[player,_vehicle,_price,_price2,_price3] remoteExec ["DWF_fnc_chopShopSell",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];



