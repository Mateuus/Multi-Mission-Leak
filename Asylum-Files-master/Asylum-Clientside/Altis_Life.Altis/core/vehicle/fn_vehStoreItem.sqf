#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_goldWeight"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call life_fnc_isnumber)) exitWith {hint "Invalid Number format";};
if(!(_ctrl in ["scotch_0","scotch_1","scotch_2","whiskeyc_0","whiskeyc_1","whiskeyc_2","whiskeyr_0","whiskeyr_1","whiskeyr_2","gingerale_0","gingerale_1","gingerale_2","rum_0","rum_1","rum_2"]) && (typeOf life_trunk_vehicle) == "Land_WaterBarrel_F") exitWith {hint "You can't place this into an aging barrel!";};
if(_ctrl in ["goldbar","dirty_money"] && (typeOf life_trunk_vehicle) in ["Box_East_Support_F","Box_East_WpsSpecial_F","Land_WaterBarrel_F"]) exitWith {hint "You can't fit this into a house crate!";};
if(_ctrl in ["goldbar","dirty_money"] && life_trunk_vehicle isKindOf "Air") exitWith {hint "This is too heavy for safe air transport!";};
if(_ctrl in ["dirty_money"] && life_trunk_vehicle isKindOf "Car") exitWith {hint "You can't fit this into your trunk!";};

_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

//if ((time - life_last_transfer) < 3) exitWith{hint "You can only store once per 3 seconds. Try storing more at a time.";};
//life_last_transfer = time;

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call life_fnc_index;
	if(life_money < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		_inv set[count _inv,[_ctrl,_num]];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	["cash","take",_num] call life_fnc_uC;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
	if (life_trunk_vehicle getVariable["containerId", -1] > -1) then { life_trunk_vehicle setVariable["lootModified", true, true]; };
	//[] call life_fnc_sessionUpdate;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {
		_possible = ((_totalWeight select 0) - (_totalWeight select 1)) / ([_ctrl] call life_fnc_itemWeight);
		if(_possible >= 1) exitWith {ctrlSetText[3506,str (floor _possible)]; [] call life_fnc_vehStoreitem};
		hint "The vehicle is either full or cannot hold that much."
	};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle.";};
	_index = [_ctrl,_inv] call life_fnc_index;

	if(_ctrl == "goldbar") then
	{
		_goldWeight = life_trunk_vehicle getVariable ["trunkWeight", 0];
		_goldWeight = _goldWeight + (_num * 400);
		life_trunk_vehicle setVariable ["trunkWeight", _goldWeight, true];
		life_trunk_vehicle setMass ((getMass life_trunk_vehicle) + (_num * 400));
	};

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
	[life_trunk_vehicle] call life_fnc_vehInventory;
	if (life_trunk_vehicle getVariable["containerId", -1] > -1) then { life_trunk_vehicle setVariable["lootModified", true, true]; };
};

//[[70, player, format["Put %1 %2 in trunk of %3", _num, _ctrl, typeOf life_trunk_vehicle]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
