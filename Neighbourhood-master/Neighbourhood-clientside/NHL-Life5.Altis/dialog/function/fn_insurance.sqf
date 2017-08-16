#include <macro.h>
/*
Filename: fn_insurance.sqf
Author: Kevin Webb
Edit: Don Richter & Erbse
Description: Simple way of insuring the vehicle. Will be modified in the future.
Edit: Add entry to DB
*/
private["_nearVehicles","_vehicle","_price","_action","_displayName"];
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos player,["Car","Air","Ship"],50];
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
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
};

if(isNil "_vehicle") exitWith {hint "Stell sicher, dass das Fahrzeug in der Nähe ist.";};
if(isNull _vehicle) exitWith {};
if(_vehicle getVariable["isInsured",false]) exitWith { hint "Dieses Fahrzeug ist bereits versichert."; };
if(!(_vehicle in life_vehicles)) exitWith {hint "Das Fahrzeug gehört dir nicht."; };
_price = switch(typeOf _vehicle) do
{
//autos
case "B_Quadbike_01_F": { "2000" };
case "C_Van_01_fuel_F": { "75000" };
case "C_Hatchback_01_F": { "5000" };
case "C_Offroad_02_unarmed_F": { "18750" };
case "C_Offroad_01_F": { "25000" };
case "C_SUV_01_F": { "37500" };
case "C_Van_01_transport_F": { "50000" };
case "C_Hatchback_01_sport_F": { "175000" };
//helis
case "B_Heli_Light_01_F": { "300000" };
case "C_Heli_light_01_blue_F": { "300000" };
case "C_Heli_light_01_elliptical_F": { "300000" };
case "C_Heli_light_01_furious_F": { "300000" };
case "C_Heli_light_01_jeans_F": { "300000" };
case "C_Heli_light_01_speedy_F": { "300000" };
case "C_Heli_light_01_vrana_F": { "300000" };
case "C_Heli_light_01_wasp_F": { "300000" };
case "C_Heli_light_01_wave_F": { "300000" };
case "C_Heli_light_01_stripped_F": { "300000" };
case "O_Heli_Light_02_unarmed_F": { "600000" };
case "I_Heli_Transport_02_F": { "900000" };
case "O_Heli_Transport_04_F": { "1200000" };
case "O_Heli_Transport_04_box_F": { "1400000" };
//lkw
case "C_Van_01_box_F": { "75000" };
case "I_Truck_02_transport_F": { "100000" };
case "I_Truck_02_covered_F": { "200000" };
case "B_Truck_01_transport_F": { "750000" };
case "B_Truck_01_covered_F": { "1250000" };
case "B_Truck_01_ammo_F": { "1700000" };
case "B_Truck_01_box_F": { "2250000" };
case "B_Truck_01_fuel_F": { "1000000" };
case "O_Truck_03_device_F": { "3000000" };
case "O_Truck_03_transport_F": { "850000" };
case "O_Truck_03_covered_F": { "1350000" };
case "O_Truck_03_fuel_F": { "1250000" };
case "O_Truck_03_ammo_F": { "2500000" };
//boote
case "C_Rubberboat": { "12500" };
case "B_SDV_01_F": { "250000" };
case "C_Boat_Civil_01_F": { "25000" };
case "O_G_Offroad_01_F": { "30000" };
case "B_Heli_Transport_03_unarmed_F": { "3750000" };
case "O_Truck_02_covered_F": {"1000000"};







default { "-1"};
};

if(_price == "-1") exitWith { hint "Du kannst diese Art von Fahrzeug nicht versichern"; };
_displayName = getText(configFile >> "CfgVehicles" >> typeof _vehicle >> "displayName");
_action = [
	parseText format["Möchtest du <t size='1.1'>%1</t> für <t size='1.1'>$%2</t> versichern?",_displayName,_price],
	"Versicherung",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(_action) then {
_price = parseNumber _price;
if(playerSide == independent) then { _price = _price / 4; };
if(life_atmcash < _price) exitWith { hint format["Du hast nicht genug Geld auf der Bank. Du brauchst $%1",_price]; };
hint format["Du hast dein Fahrzeug versichert. Wenn dein Fahrzeug nun explodiert, dann wird es dir nach dem Restart erstattet!",_price];
life_atmcash = life_atmcash - _price;
["1"] call SOCK_fnc_syncData;
closeDialog 0;
_vehicle setVariable["isInsured",true,true];
[[_vehicle],"TON_fnc_vehicleInsurance",false,false] spawn life_fnc_MP; 
sendlogfile = [format ["###### %1 hat %2 für $%3 vesichert",name player,_displayName,_price],"versicherung"];
publicVariableServer "sendlogfile";
};