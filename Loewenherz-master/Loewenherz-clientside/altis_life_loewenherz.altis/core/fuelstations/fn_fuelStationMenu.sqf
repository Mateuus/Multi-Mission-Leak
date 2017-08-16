/*
	File: fn_fuelStationMenu.sqf
	Author: MarioF

	Description:
	Fuelstation Menu handling / also for Fueltrucks
*/


private ["_station","_mode","_pricemod","_types","_dis","_fuelInUse","_truckFuel","_display","_veh","_txtTitle","_txtVeh","_txtFit","_txtCash","_listVeh","_sliFit","_btnRefill","_indFuel","_sellers","_seller","_type","_info","_owner","_kap","_diff","_TRAILER"];
disableSerialization;

_station = param [0,objNull];
_mode = (param [3,""]) select 0;
_pricemod = (param [3,""]) select 1;

switch(_mode) do {
	case ("CAR"): {_types = ["Car"]; _dis = 8; };
	case ("FUELTRUCK"): {_types = ["Car","Air"]; _dis = 9; };
	case ("AIR"): {_types = ["Air"]; _dis = 15; };
};

lhm_action_inUse = true;

[] spawn {
	waitUntil{!lhm_action_inUse};
	lhm_fuelstation_lockVeh = [];
	if(!isNull lhm_fuelstation_fueltruck) then {
		lhm_fuelstation_fueltruck setVariable["fueltruck_in_use",false,true];
		lhm_fuelstation_fueltruck = objNull;
	};
	lhm_fuelstation_amount = 0;
	lhm_fuelstation_fitamount = 0;
	if(!isNull findDisplay 29000) then { closeDialog 29000 };
};

_fuelInUse = false;
if(_mode == "FUELTRUCK") then {
	if(_station getVariable["fueltruck_in_use",false]) exitWith { _fuelInUse = true };
	_station setVariable["fueltruck_in_use",true,true];
	_truckFuel = _station getVariable["fueltruck_fuel",0];
	lhm_fuelstation_fueltruck = _station;
};
if(_fuelInUse) exitWith { hint format["Tanklaster bereits in benutzung!"]; lhm_action_inUse = false; };

if(isNil "_types" || isNull _station) exitWith{};

if(isNull findDisplay 29000) then { createDialog "fuelstation_dialog" };
waitUntil {!isNull findDisplay 29000};
_display = findDisplay 29000;

_veh = nearestObjects[(getPos _station),_types,_dis];

if((count _veh) < 1) exitWith { hint format["Kein Fahrzeug vom Typ %1 in %2m Umkreis", _types, _dis]; lhm_action_inUse = false; };

_txtTitle = _display displayCtrl 29001;
_txtVeh = _display displayCtrl 29002;
_txtFit = _display displayCtrl 29003;
_txtCash = _display displayCtrl 29004;
_listVeh = _display displayCtrl 29011;
_sliFit = _display displayCtrl 29012;
_btnRefill = _display displayCtrl 29021;

if(_mode == "FUELTRUCK") then {
	_txtTitle ctrlSetText format["Gas Truck (%1 Liter)",_truckFuel];
} else {
	_txtTitle ctrlSetText format["Fuel Station"];
};

// Price per Litre
//_indFuel = ([(call sell_array),"oilp"] call BIS_fnc_findNestedElement) select 0;
//lhm_fuelstation_price = ([((((call sell_array) select _indFuel) select 1) / 200) * _pricemod, 2] call BIS_fnc_cutDecimals) max 3;


_sellers = nearestObjects[player,["MAN","Land_InfoStand_V1_F"],50];

{
	if((!isplayer _x) && (_x getvariable["realname",""] == "Tankwart")) then {
		_seller = _x;
	};
	if(!isnil "_seller") exitWith {};

} foreach _sellers;

if(!isnil "_seller") then {

	lhm_fuel_seller = _seller;

	lhm_fuelstation_price = _seller getvariable["Price",8];
} else {
	lhm_fuelstation_price = 8;
};

_txtVeh ctrlShow false;
_txtFit ctrlShow false;
_txtCash ctrlShow false;
_sliFit ctrlShow false;
_btnRefill ctrlShow false;

{
	_type = typeOf _x;
	_info = [_type] call lhm_fnc_fetchVehInfo;
	_owner = "";
	if(_x in lhm_vehicles) then { _owner = " (Besitzer)"; };
	_kap = [_type] call lhm_fnc_vehFuelCap;
	_diff = _kap - (_kap * (fuel _x));
	if(_diff > 1) then {
		_listVeh lbAdd format["%1%2", _info select 3, _owner];
		_listVeh lbSetPicture [(lbSize _listVeh)-1,(_info select 2)];
		_listVeh lbSetData [(lbSize _listVeh)-1,str(_x)];
		_listVeh lbSetValue [(lbSize _listVeh)-1,0];
	};

	if((_x != lhm_fuelstation_fueltruck) && _type in lhm_fuelstation_cfgTrucks) then {
		_kap = [_type + "_TRAILER"] call lhm_fnc_vehFuelCap;
		_diff = _kap - (_x getVariable["fueltruck_fuel",0]);
		if(_diff > 1) then {
			_listVeh lbAdd format["%1 - Auflieger%2", _info select 3, _owner];
			_listVeh lbSetPicture [(lbSize _listVeh)-1,(_info select 2)];
			_listVeh lbSetData [(lbSize _listVeh)-1,str(_x)];
			_listVeh lbSetValue [(lbSize _listVeh)-1,1];
		};
	};
} foreach _veh;