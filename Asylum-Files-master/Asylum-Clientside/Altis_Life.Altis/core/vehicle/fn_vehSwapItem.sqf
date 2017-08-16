#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
fn_vehSwapItem.sqf
Kevin Webb
Attempts to swap 1 item for another. Probably should have been a thing before now!
*/
disableSerialization;
_trunkItem = ctrlSelData(3502);
_myInvItem = ctrlSelData(3503);
if((lbCurSel 3502) == -1 || (lbCurSel 3503) == -1 || _trunkItem == "" || _myInvItem == "") exitWith {hint "You need to select an item from both inventories."};
_uid = getPlayerUID player;
if(life_trunk_vehicle getVariable "trunk_in_use" != _uid) exitWith
{
    hint "This vehicle's trunk is in use, only one person can use it at a time.";
};
if(_trunkItem == _myInvItem) exitWith {hint "It seems you've selected the same item... What would that accomplish?"};
//the usual checks...
if(!(_myInvItem in ["scotch_0","scotch_1","scotch_2","whiskeyc_0","whiskeyc_1","whiskeyc_2","whiskeyr_0","whiskeyr_1","whiskeyr_2","gingerale_0","gingerale_1","gingerale_2","rum_0","rum_1","rum_2"]) && (typeOf life_trunk_vehicle) == "Land_WaterBarrel_F") exitWith {hint "You can't place this into an aging barrel!";};
if(_myInvItem in ["goldbar","dirty_money"] && (typeOf life_trunk_vehicle) in ["Box_East_Support_F","Box_East_WpsSpecial_F","Land_WaterBarrel_F"]) exitWith {hint "You can't fit this into a house crate!";};
if(_myInvItem in ["goldbar","dirty_money"] && life_trunk_vehicle isKindOf "Air") exitWith {hint "This is too heavy for safe air transport!";};
if(_myInvItem in ["dirty_money"] && life_trunk_vehicle isKindOf "Car") exitWith {hint "You can't fit this into your trunk!";};

_totalVehWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
_invItemWeight = [_myInvItem] call life_fnc_itemWeight;
_trunkitemWeight = [_trunkItem] call life_fnc_itemWeight;
if(((_totalVehWeight select 1) + _invItemWeight - _trunkitemWeight) > (_totalVehWeight select 0)) exitWith {hint "The vehicle won't be able to accept the heavier item from your inventory."};

_index = [_trunkItem,((life_trunk_vehicle getVariable "Trunk") select 0)] call life_fnc_index;
_data = (life_trunk_vehicle getVariable "Trunk") select 0;
_old = life_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
_num = [_trunkItem,1,life_carryWeight - _invItemWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Your inventory won't be able to hold the heavier item you are trying to swap for."};

[false,_myInvitem,1] call life_fnc_handleInv;
[true,_trunkItem,1] call life_fnc_handleInv;

if(1 == _value) then
{
	_data set[_index,-1];
	_data = _data - [-1];
}
	else
{
	_data set[_index,[_trunkItem,(_value - 1)]];
};

if(_trunkItem == "goldbar") then
{
	_goldWeight = life_trunk_vehicle getVariable ["trunkWeight", 0];
	_goldWeight = _goldWeight - 400;
	life_trunk_vehicle setVariable ["trunkWeight", _goldWeight, true];
	life_trunk_vehicle setMass ((getMass life_trunk_vehicle) - 400);
};
if(_myInvItem == "goldbar") then
{
	_goldWeight = life_trunk_vehicle getVariable ["trunkWeight", 0];
	_goldWeight = _goldWeight + 400;
	life_trunk_vehicle setVariable ["trunkWeight", _goldWeight, true];
	life_trunk_vehicle setMass ((getMass life_trunk_vehicle) + 400);
};
_index = [_myInvItem,_data] call life_fnc_index;

if(_index == -1) then
{
	_data pushBack [_myInvItem,1];
}
	else
{
	_val = _data select _index select 1;
	_data set[_index,[_myInvItem,_val + 1]];
};

life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) + _invItemWeight - _trunkitemWeight],true];
[life_trunk_vehicle] call life_fnc_vehInventory;
if (life_trunk_vehicle getVariable["containerId", -1] > -1) then { life_trunk_vehicle setVariable["lootModified", true, true]; };
