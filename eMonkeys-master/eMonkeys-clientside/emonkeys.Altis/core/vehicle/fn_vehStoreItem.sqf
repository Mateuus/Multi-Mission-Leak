#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff","_JetTrucks","_JetStuff","_DefaultMass"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst keine werte unter 1 eingeben!";};

_totalWeight = [eM_trunk_vehicle] call EMonkeys_fnc_vehicleWeight;
_itemWeight = ([_ctrl] call EMonkeys_fnc_itemWeight) * _num;
_veh_data = eM_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;
_Truck = TypeOf eM_trunk_vehicle;
_DefaultMass = eM_trunk_vehicle getVariable "default_mass";
_FuelStuff = ["oilu","oilp","raps","diesel_gestreckt","diesel","biodiesel","seawater","super","superplus"]; //Wich Items can be stored in?
_FuelTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Heli_Transport_04_fuel_F","I_Truck_02_fuel_F"]; //Fuel Trucks, who are allowed to carry fuel


switch (true) do
{
case ((_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {eM_TankLaster = 1}; //Fuel in FuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {eM_TankLaster = 2}; //NonFuel in NonFuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {eM_TankLaster = 3}; //NonFuel in FuelTruck -> Nope
case ((_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {eM_TankLaster = 4}; //Fuel in NonFuelTruck -> Nope!
};
if (eM_TankLaster == 3) exitWith {hint "Du kannst nur Flüssigkeiten und Raps in einen Tanklaster füllen"};
if (eM_TankLaster == 4) exitWith {hint "Du kannst Flüssigkeiten und Raps nur in Tanklaster füllen";};

_JetStuff = ["casanovil","hypromellose","viagra","sildenafil","aspirin","acetylsalicylsaeure","tablettenrohling","natriumchlorid","mischmittel","maisstaerke","cellulosepulver"]; //Wich Items can be stored in?
_JetTrucks = ["B_Plane_CAS_01_F"]; //Fuel Trucks, who are allowed to carry fuel


switch (true) do
{
case ((_ctrl in _JetStuff) && (_Truck in _JetTrucks)): {eM_Jet = 1}; //Fuel in FuelTruck -> Allowed
case (!(_ctrl in _JetStuff) && !(_Truck in _JetTrucks)): {eM_Jet = 2}; //NonFuel in NonFuelTruck -> Allowed
case (!(_ctrl in _JetStuff) && (_Truck in _JetTrucks)): {eM_Jet = 3}; //NonFuel in FuelTruck -> Nope
case ((_ctrl in _JetStuff) && !(_Truck in _JetTrucks)): {eM_Jet = 4}; //Fuel in NonFuelTruck -> Nope!
};
if (eM_Jet == 3) exitWith {hint "Du kannst nur Arznei in den Jet laden."};
if (eM_Jet == 4) exitWith {hint "Du kannst Arznei nur in einen Jet laden.";};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(EMonkeys_c164 < _num) exitWith {hint "Du hast nicht so viel Geld dabei!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	EMonkeys_c164 = EMonkeys_c164 - _num;
	eM_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[eM_trunk_vehicle] call EMonkeys_fnc_vehInventory;
	[0] call SOCK_fnc_updatePartial;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist bereits voll!"};

	if(!([false,_ctrl,_num] call EMonkeys_fnc_handleInv)) exitWith {hint "Das Fahrzeug kann nicht so viel aufnehmen.";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	eM_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[eM_trunk_vehicle] call EMonkeys_fnc_vehInventory;
	eM_trunk_vehicle setMass ((((((_totalWeight select 1)+_itemWeight)/(_totalWeight select 0))*0.5)*_DefaultMass) + _DefaultMass);

};
