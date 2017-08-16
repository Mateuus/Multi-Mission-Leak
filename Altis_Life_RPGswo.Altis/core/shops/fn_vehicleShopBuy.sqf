#include "..\..\macros.hpp"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
params [["_mode",true,[true]]];
private["_className","_vIndex","_vehicleList","_shopSide","_initalPrice","_buyMultiplier","_rentMultiplier","_purchasePrice","_conditions","_colorIndex","_spawnPoints","_spawnPoint","_vehicle"];

if((lbCurSel IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN) == -1) exitWith {hint "Du hast kein Fahrzeug ausgewählt!"};

_className = lbData[IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN,(lbCurSel IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN)];
_vIndex = lbValue[IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN,(lbCurSel IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN)];
_vehicleList = M_CONFIG(getArray,"CarShops",(DWEV_veh_shop select 0),"vehicles");
_shopSide = M_CONFIG(getText,"CarShops",(DWEV_veh_shop select 0),"side");
_initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");

switch (side player) do
{
    case civilian:
	{
        _buyMultiplier = DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
        _rentMultiplier = DWEV_SETTINGS(getNumber,"vehicle_rental_multiplier_CIVILIAN");
    };
    case west:
	{
        _buyMultiplier = DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
        _rentMultiplier = DWEV_SETTINGS(getNumber,"vehicle_rental_multiplier_COP");
    };
    case independent:
	{
        _buyMultiplier = DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
        _rentMultiplier = DWEV_SETTINGS(getNumber,"vehicle_rental_multiplier_MEDIC");
    };
    case east:
	{
        _buyMultiplier = DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
        _rentMultiplier = DWEV_SETTINGS(getNumber,"vehicle_rental_multiplier_OPFOR");
    };
};

switch (__GETC__(DWEV_donator)) do
{
	case 1: {_buyMultiplier = (_buyMultiplier*0.9); _rentMultiplier = (_rentMultiplier*0.9);};// Premium 10% rabatt
	case 2: {_buyMultiplier = (_buyMultiplier*0.8); _rentMultiplier = (_rentMultiplier*0.8);};// Premium 20% rabatt
	case 3: {_buyMultiplier = (_buyMultiplier*0.7); _rentMultiplier = (_rentMultiplier*0.7);};// Premium 30% rabatt
	case 4: {_buyMultiplier = (_buyMultiplier*0.5); _rentMultiplier = (_rentMultiplier*0.5);};// Premium 50% rabatt
};
if (actionSpendenziel1 && ((__GETC__(DWEV_donator)) isEqualTo 0)) then
{
	_buyMultiplier = (_buyMultiplier*0.9); // 10% rabatt wenn Spendenziel erreicht. Alt Donator bekommen kein extra rabatt.
};

if (_mode) then
{
    _purchasePrice = round(_initalPrice * _buyMultiplier);
} else
{
    _purchasePrice = round(_initalPrice * _rentMultiplier);
};

_conditions = M_CONFIG(getText,"LifeCfgVehicles",_className,"conditions");
if !([_conditions] call DWEV_fnc_levelCheck) exitWith {hint "Du besitzt den benötigten Führerschein / Rang nicht!";};

_colorIndex = lbValue[IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN,(lbCurSel IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN)];

if (_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
if (dwf_cash < _purchasePrice) exitWith {hint format ["Du hast nicht genug Geld, um das Fahrzeug zu kaufen.\n\nFehlender Betrag: %1 €",[_purchasePrice - dwf_cash] call DWEV_fnc_numberText];closeDialog 0;};

_spawnPoints = DWEV_veh_shop select 1;
_spawnPoint = "";

if ((DWEV_veh_shop select 0) == "med_air_hs") then {
    if (nearestObjects[(getMarkerPos _spawnPoints),["Air"],35] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
} else {
    //Check if there is multiple spawn points and find a suitable spawnpoint.
    if (_spawnPoints isEqualType []) then {
        //Find an available spawn point.
        {
            if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x};
            true
        } count _spawnPoints;
    } else {
        if (nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
    };
};

if (_spawnPoint isEqualTo "") exitWith {hint "Ein Fahrzeug blockiert gerade den Spawnpunkt."; closeDialog 0;};

if(_mode) then {
	hint format["Du hast ein %1 für %2€ gekauft.",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call DWEV_fnc_numberText];
} else {
	hint format["Du hast ein %1 für %2€ gemietet.",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call DWEV_fnc_numberText];
};

dwf_cash = dwf_cash - _purchasePrice;
[0] call SOCK_fnc_updatePartial;

//Spawn the vehicle and prep it.
if((DWEV_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	 waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
};

_vehicle lock 2;
[_vehicle,_colorIndex] remoteExec ["DWEV_fnc_colorVehicle"];
[_vehicle] call DWEV_fnc_clearVehicleAmmo;
[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["DWF_fnc_setObjVar",2];
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

//Side Specific actions.
switch (playerSide) do
{
    case west: 
	{
		_vehicle setVariable ["side","cop",true];
		_vehicle setVariable ["alarm",true,true];
		_vehicle setVariable ["sperre",true,true];
		_vehicle enableRopeAttach false;
		
		[_vehicle,"cop_offroad",true] call DWEV_fnc_vehicleAnimate; // Warum wird das nicht geprüft ob es sich um einen Offroad handelt ???

		if(_className == "B_Heli_Light_01_F") then 	
		{
			_vehicle setVariable ["nano_emp_enabled", true, true];
		};
		if(_className == "I_Heli_light_03_unarmed_F") then 
		{
			_vehicle setVariable ["nano_emp_enabled", true, true];
	    };
	};
	
    case civilian:
	{
		_vehicle setVariable ["side","civ",true];
		if((DWEV_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn DWEV_fnc_vehicleAnimate;
			
		};
		
		if ((_className == "B_MRAP_01_F" && (_colorIndex == 6 OR _colorIndex == 16)) || (_className == "C_SUV_01_F" && _colorIndex == 35) ||(_className == "O_Truck_02_box_F" && _colorIndex == 0) ) then // ADMIN/Sandmann HUNTER,Admin SUV, Farming Auto Admin für Event
		{
					_vehicle setVariable ["alarm",true,true];
					_vehicle setVariable ["sperre",true,true];
					_vehicle setVariable ["protected",true,true];
					_vehicle enableRopeAttach false;
		};
		
		if((_className in ["B_Truck_01_covered_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F"])) then
		{
			_vehicle enableRopeAttach false;
		};
		
		if (player getVariable["noobschutz",false]) then
		{
			_vehicle setVariable ["protected",true,true];
		};
	};
	
    case independent: 
	{
		_vehicle setVariable ["side","med",true];
		_vehicle setVariable ["alarm",true,true];
		_vehicle setVariable ["sperre",true,true];
		_vehicle setVariable ["protected",true,true];
		_vehicle enableRopeAttach false;
				
		if((DWEV_veh_shop select 2) == "med" && {_className == "C_Offroad_01_F"}) then 
		{
            [_vehicle,"med_offroad",true] spawn DWEV_fnc_vehicleAnimate;
        };
	};
	
	case east: 
	{
		_vehicle setVariable ["side","WSC",true];
		_vehicle setVariable ["alarm",true,true];
		_vehicle setVariable ["sperre",true,true];
		_vehicle enableRopeAttach false;
	};
};

_vehicle allowDamage true;
DWEV_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteExec ["DWF_fnc_keyManagement",2]; //Always handle key management by the server

if(_mode) then
{
	if !(_className in DWEV_SETTINGS(getArray,"vehicleShop_rentalOnly")) then
	{
		[1,player,"kauf",format ["%1 für %2 € - Bargeld. %3 € Bankkonto. %4 €",_className,[_purchasePrice] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		[(getPlayerUID player),(side player),_vehicle,_colorIndex] remoteExec ["DWF_fnc_vehicIeCreate",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
}
else
{
	[1,player,"miete",format ["%1 für %2 €. Bargeld: %3 € Bankkonto: %4 €",_className,[_purchasePrice] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
};

closeDialog 0;
true;