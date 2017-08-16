disableSerialization;

private _item = lbData [3503, lbCurSel 3503];
private _count = parseNumber ctrlText 3506;
if (_count <= 0) exitWith {};

//--- Trunk weight
private _trunkWeight = if (life_trunk_vehicle isKindOf "House_F") then {
  private _maxWeight = 0;
  {
    _maxWeight = _maxWeight + ([typeOf _x] call life_fnc_vehicleWeightCfg);
  } forEach (life_trunk_vehicle getVariable ["containers", []]);

  [_maxWeight, (life_trunk_vehicle getVariable ["trunk", [[], 0]]) select 1]
} else {
  [life_trunk_vehicle] call life_fnc_vehicleWeight
};

private _itemWeight = ([_item] call life_fnc_itemWeight) * _count;
_veh_data = life_trunk_vehicle getVariable ["trunk", [[], 0]];
_trunkItems = _veh_data select 0;

//--- Tanker restriction
if ([life_trunk_vehicle, ["B_Truck_01_fuel_F", "Truck_02_fuel_base_F", "O_Truck_03_fuel_F"]] call GTA_fnc_isKindOf && {!(_item in ["oil_u", "oil_p", "naturalgas", "propane"])}) exitWith {hint "Only liquids can be stored inside of this vehicle"};
if ((_item in ["oil_u", "oil_p", "naturalgas", "propane"]) && {!([life_trunk_vehicle, ["B_Truck_01_fuel_F", "Truck_02_fuel_base_F", "O_Truck_03_fuel_F"]] call GTA_fnc_isKindOf)}) exitWith {hint "Liquids cannot be stored inside this vehicle"};

//--- Restrict money bags
if (_item in ["moneybag"] && {!([life_trunk_vehicle, ["LandVehicle", "Ship", "Slingload_01_Base_F"]] call GTA_fnc_isKindOf)}) exitWith {hint "You cannot store that in anything but a land vehicle!"};

//--- Check if full
if (((_trunkWeight select 1) + _itemWeight) > (_trunkWeight select 0)) exitWith {hint "The vehicle is either full or cannot hold that much"};

//--- Remove the item(s)
if !([false, _item, _count] call life_fnc_handleInv) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle"};

//--- Find existing item
private _itemIndex = [_trunkItems, _item] call GTA_fnc_nestedIndex;

if (_itemIndex == -1) then {
  _trunkItems pushBack [_item, _count];
} else {
  private _itemData = _trunkItems select _itemIndex;
  (_trunkItems select _itemIndex) set [1, (_itemData select 1) + _count];
};

life_trunk_vehicle setVariable ["trunk", [_trunkItems, (_veh_data select 1) + _itemWeight], true];
[life_trunk_vehicle] call life_fnc_vehInventory;
