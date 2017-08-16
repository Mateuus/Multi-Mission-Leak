#include <macro.h>

private["_blacklist"];

disableSerialization;
_dialog = findDisplay 15000;
_myListbox = _dialog displayCtrl 15001;
_myAmount = _dialog displayCtrl 15002;
_myMenge = _dialog displayCtrl 15003;
_check = false;
_vehicle = ObjNull;
_min = 50000;

_tochangePriceText = ctrlText _myAmount;
_tochangePriceNumber = parseNumber _tochangePriceText;
_tochangeMenge = ctrlText _myMenge;
_tochangeMengeNumber = parseNumber _tochangeMenge;

if(_tochangePriceText=="") exitWith {hint "Keinen Wert eingegeben."};
if(!([_tochangePriceText] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_tochangeMenge=="") exitWith {hint "Keine Menge eingegeben."};
if(!([_tochangeMenge] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(lbCurSel _myListbox < 0) exitWith {hint "Bitte wählen Sie einen Gegenstand!"};
_classname = _myListbox lbData (lbCurSel _myListbox);
_price = floor(_tochangePriceNumber);
_menge = floor(_tochangeMengeNumber);
if(_price > 50000000) exitWith {hint "Der eingegebene Preis ist zu hoch!"};
if(_price <= 0) exitWith {hint "Der eingegebene Preis ist zu niedrig!"};
if(_menge > 50) exitWith {hint "Die eingegebene Menge ist zu hoch!"};
if(_menge <= 0) exitWith {hint "Die eingegebene Menge ist zu niedrig!"};

_blacklist = ["C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Quadbike_01_black_F","C_Van_01_fuel_F","B_Truck_01_ammo_F","B_T_VTOL_01_vehicle_F","B_T_VTOL_01_infantry_F"];

_donatorlist = [
	["C_Hatchback_01_sport_F",12],
	["C_Offroad_01_F",10],
	["C_SUV_01_F",12],
	["C_Van_01_box_F",3],
	["C_Heli_Light_01_civil_F",20],
	["O_MRAP_02_F",1]
];

_nearVehicles = nearestObjects[getPos player,["Car","Air"],50];
if(count _nearVehicles > 0) then
{
	{
		_vehData = _x getVariable["vehicle_info_owners",[]];
		if(count _vehData  > 0) then
		{
			_vehOwner = (_vehData select 0) select 0;
			if((getPlayerUID player) == _vehOwner) exitWith
			{
				_vehicle = _x;
			};
		};
	} foreach _nearVehicles;
};
if((_classname isKindOf "Car" && isNull _vehicle) OR (_classname isKindOf "Air" && isNull _vehicle)) exitWith {hint "Dieses Fahrzeug ist zu weit entfernt oder es gehört dir nicht!"};

switch(typeOf _vehicle) do
{
	case "C_Quadbike_01_F": {_min = 5000};
	case "C_Offroad_01_F": {_min = 25000};
	case "C_Hatchback_01_F": {_min = 20000};
	case "C_Hatchback_01_sport_F": {_min = 50000};
	case "C_SUV_01_F": {_min = 30000};
	case "C_Van_01_box_F": {_min = 35000};
	case "C_Van_01_transport_F": {_min = 35000};
	case "C_Van_01_fuel_F": {_min = 150000};
	case "I_Truck_02_transport_F": {_min = 250000};
	case "I_Truck_02_covered_F": {_min = 500000};
	case "B_Truck_01_transport_F": {_min = 500000};
	case "B_Truck_01_ammo_F": {_min = 500000};
	case "B_Truck_01_covered_F": {_min = 500000};
	case "B_Truck_01_fuel_F": {_min = 500000};
	case "B_Truck_01_box_F": {_min = 500000};
	case "O_Truck_02_fuel_F": {_min = 500000};
	default {_min = 50000};
};
if(_vehicle isKindOf "Air") then {_min = 400000};

_shortname = [_classname,1] call life_fnc_varHandle;

if(_classname in life_inv_items) then {
	if(!([false,_shortname,_menge] call life_fnc_handleInv)) exitWith {hint "Du besitzt die angegebene Menge nicht!"; _check = true};
};
if(_classname isKindOf "Car" OR _classname isKindOf "Air") then {
	if(_price < _min) exitWith {hint format ["Der Mindestpreis bei diesem Fahrzeug beträgt %1€!",[_min] call life_fnc_numberText]; _check = true};
	_menge = 1;
};
if(!(_classname in life_inv_items) && !(_classname isKindOf "Car" OR _classname isKindOf "Air")) then {
	if(({_classname == _x} count (items player) < _menge) && _classname != backpack player && _classname != uniform player) exitWith {hint "Du besitzt die angegebene Menge nicht!"; _check = true};
};
if(_classname == backpack player OR _classname == uniform player) then {
	_menge = 1;
};

if(_check) exitWith {};


if(_classname in life_inv_items) then
{
	[2,[getPlayerUID player,_classname,_price,_menge,0,profileName]] remoteExecCall ["HClient_fnc_SAH_reciever",life_HC];
	
	hint parseText format ["<t color='#316dff'><t size='1.5'><t align='center'>Auktion erstellt<br/><br/><t color='#33CC33'><t align='center'><t size='1'>%3x <t color='#ff1000'>%1 <t color='#ffffff'>für <t color='#c0c000'>%2€<br/>",[_classname] call life_fnc_varToStr,([_price] call life_fnc_numberText),_menge];
	
};
if(_classname isKindOf "Car" OR _classname isKindOf "Air") then 
{
	_donatorveh = false;

	if(typeOf _vehicle != _classname) exitWith {hint "Ein weiteres, deiner Fahrzeuge steht näher am Auktionshaus. Parke dies erst ein oder fahre es weg."};
	if((typeOf _vehicle in _blacklist) OR (_vehicle getvariable ["life_veh_color",-1]) == -1) exitWith {hint "Dieses Fahrzeug besitzt keine offizielle Lackierung und kann daher nicht gehandelt werden!"};
	{
		if(_vehicle isKindOf (_x select 0) && (_vehicle getvariable "life_veh_color") == (_x select 1)) exitWith {_donatorveh = true;};
	} foreach _donatorlist;

	if(_donatorveh) exitWith {hint "Dieses Fahrzeug von Don Ator ist nicht handelbar."};

	_vehicleInfo = [_classname] call life_fnc_fetchVehInfo;
	_color = [_classname,(_vehicle getvariable "life_veh_color")] call life_fnc_vehicleColorStr;
	
	[2,[getPlayerUID player,_classname,_price,_menge,_vehicle getvariable ["life_veh_color",0],profileName]] remoteExecCall ["HClient_fnc_SAH_reciever",life_HC];
	
	hint parseText format ["<t color='#316dff'><t size='1.5'><t align='center'>Auktion erstellt<br/><br/><t color='#ff1000'><t align='center'><t size='1'>%1 <t color='#ffffff'>mit der Lackierung <t color='#33CC33'>%3 <t color='#ffffff'>für <t color='#c0c000'>%2€<br/>",_vehicleInfo select 3,([_price] call life_fnc_numberText),_color];
	
	[_vehicle] call life_fnc_VehicleDeAnimate;
	[player,_vehicle] remoteExecCall ["SOA_fnc_SAH_carSell",2];
};
if(!(_classname in life_inv_items) && !(_classname isKindOf "Car" OR _classname isKindOF "Air")) then
{
	[2,[getPlayerUID player,_classname,_price,_menge,0,profileName]] remoteExecCall ["HClient_fnc_SAH_reciever",life_HC];
	
	hint parseText format ["<t color='#316dff'><t size='1.5'><t align='center'>Auktion erstellt<br/><br/><t color='#33CC33'><t align='center'><t size='1'>%3x <t color='#ff1000'>%1 <t color='#ffffff'>für <t color='#c0c000'>%2€<br/>",([_classname] call VAS_fnc_fetchCfgDetails select 1),([_price] call life_fnc_numberText),_menge];
	
	for "_i" from 1 to _menge do {[_classname,false] spawn life_fnc_handleItem};
};

closeDialog 0;
[] spawn life_fnc_CAH_loadOffers;