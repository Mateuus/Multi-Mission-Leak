#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff","_TankLaster"];
disableSerialization;

_ctrl = ctrlSelData(3503);
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && (life_trunk_vehicle getVariable ["trunk_in_use_by",false] != name player)) exitWith {
    closeDialog 0; 
    hint localize "STR_MISC_VehInvUse";
};
_num = ctrlText 3506;
if(!([_num] call TEX_fnc_isnumber)) exitWith {hint "Es muss eine Zahl eingegeben werden.";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du musst mindestens 1 einlagern.";};

if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call tanoarpg_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call tanoarpg_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call tanoarpg_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle")}) exitWith {hint "Du kannst Goldbarren aufgrund ihres hohen Gewichtes nur in Autos und LKWs einladen."};

//Öl nur in Tanker
_TankLaster = 1;
_Truck = TypeOf life_trunk_vehicle;
_PhyikStuff = ["inelement","stelement"];
_PhysikTrucks = ["I_Plane_Fighter_03_CAS_F","O_Plane_CAS_02_F","B_Plane_CAS_01_F"];
_FuelStuff = ["oilu","oilp","fuelF","fuelE","fuelK","oilraw","oilraw","oilheat","oildiesel"]; //Wich Items can be stored in?
_FuelTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Heli_Transport_04_fuel_F","O_Truck_03_fuel_F","C_Rubberboat","B_Lifeboat","O_Lifeboat","C_Boat_Civil_01_F","C_Boat_Civil_01_rescue_F","B_Boat_Transport_01_F","O_Boat_Transport_01_F","I_Boat_Transport_01_F","I_G_Boat_Transport_01_F","C_Boat_Transport_02_F","I_C_Boat_Transport_02_F","B_Boat_Armed_01_minigun_F","O_Boat_Armed_01_hmg_F","I_Boat_Armed_01_minigun_F"]; //Fuel Trucks, who are allowed to carry fuel
switch (true) do
{
	case ((_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {_TankLaster = 1}; //Fuel in FuelTruck -> Allowed
	case (!(_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {_TankLaster = 2}; //NonFuel in NonFuelTruck -> Allowed
	case (!(_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {_TankLaster	= 2}; //NonFuel in FuelTruck -> Nope, yea but still allowed because fuck the old system, cat24max is way cooler
	case ((_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {_TankLaster = 4}; //Fuel in NonFuelTruck -> Nope!
};

if(life_trunk_vehicle isKindOf "House_F") then {_TankLaster = 1};	//Das Man das zeug wiede rins haus tun tut
if (_TankLaster == 3) exitWith {hint "Du kannst nur Öl in einen Tanklaster füllen!";};
if (_TankLaster == 4) exitWith {hint "Du kannst Öl NUR in einen Tanklaster oder ein Boot füllen!";};

switch (true) do
{
	case ((_ctrl in _PhyikStuff) && (_Truck in _PhysikTrucks)): {_TankLaster = 5};
	case (!(_ctrl in _PhyikStuff) && !(_Truck in _PhysikTrucks)): {_TankLaster = 6};
	case (!(_ctrl in _PhyikStuff) && (_Truck in _PhysikTrucks)): {_TankLaster	= 7};
	case ((_ctrl in _PhyikStuff) && !(_Truck in _PhysikTrucks)): {_TankLaster = 8};
};

if(life_trunk_vehicle isKindOf "House_F") then {_TankLaster = 1};	//Das Man das zeug wiede rins haus tun tut
if (_TankLaster == 7) exitWith {hint "Du kannst nur Physikalische Produkte oder EnergyDrink in einem Jet lagern.";};
if (_TankLaster == 8) exitWith {hint "Du kannst nur Physikalische Produkte oder EnergyDrink in einem Jet lagern.";};
//Öl nur in Tanker

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TEX_fnc_index;
	if(life_cash < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_cash = life_cash - _num;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call tanoarpg_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug hat nicht mehr genügend Platz."};

	if(!([false,_ctrl,_num] call tanoarpg_fnc_handleInv)) exitWith {hint "Konnte die Gegenstände nicht ins Fahrzeug einlagern.";};
	_index = [_ctrl,_inv] call TEX_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call tanoarpg_fnc_vehInventory;
};
