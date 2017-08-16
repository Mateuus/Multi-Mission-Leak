
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
File: fn_houseStoreItem.sqf
Author: Mario2002

Description:
store an item in a house
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_radius","_house"];
disableSerialization;

_ctrl = ctrlSelData(8503);
_num = ctrlText 8506;
if(!([_num] call fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

_weight = 0;
_used = (cursorObject getVariable ["Trunk", [[],0]]) select 1;
_house = nearestObjects [getPosATL player,["House_F"],10] select 0;
_radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2));
_boxes = nearestObjects [position player, ["Land_Box_AmmoOld_F","B_supplyCrate_F"], _radius];
{
	_box_data = [_x] call life_fnc_vehicleWeight;
	_weight = _weight + (_box_data select 0);
	_used = _used + (_box_data select 1);
}forEach _boxes;

_totalWeight = [_weight, _used];
//diag_log format ["TOTAL WEIGHT : %1", _totalWeight];
//_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if ( _ctrl in [ "goldbar", "moneybag", "oil_u", "oil_p", "naturalgas", "propane" ] ) exitWith { hint "You cannot store the selected item in houses." };

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call fnc_index;
	if(GTA_money_cash < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		_inv set[count _inv,[_ctrl,_num]];
	}
	else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	GTA_money_cash = GTA_money_cash - _num;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_houseInventory;
}
else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "The vehicle is either full or cannot hold that much."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle.";};
	_index = [_ctrl,_inv] call fnc_index;
	if(_index == -1) then
	{
		_inv set[count _inv,[_ctrl,_num]];
	}
	else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_houseInventory;
};
