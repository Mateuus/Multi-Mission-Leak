#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {hint "The vehicle either doesn't exist or is destroyed."};
if(!alive player) exitWith {closeDialog 0;};

if((lbCurSel 3502) == -1) exitWith {hint "You need to select an item!";};
_uid = getPlayerUID player;
if(life_trunk_vehicle getVariable "trunk_in_use" != _uid) exitWith
{
    hint "This vehicle's trunk is in use, only one person can use it at a time.";
};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call life_fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

//if ((time - life_last_transfer) < 3) exitWith{hint "You can only take once per 3 seconds. Try taking more at a time.";};
//life_last_transfer = time;

_index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call life_fnc_index;
_data = (life_trunk_vehicle getVariable "Trunk") select 0;
_old = life_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {hint "The vehicle doesn't have that many of that item."};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Your inventory is full."};
_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
if(_ctrl == "money") then
{
	if(_num == _value) then
	{
		_data set[_index,-1];
		_data = _data - [-1];
	}
		else
	{
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	["cash","add",_num] call life_fnc_uC;
	life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
	//[[71, player, format["Took %1 %2 from trunk of %3", _num, _ctrl, typeOf life_trunk_vehicle]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	if (life_trunk_vehicle getVariable["containerId", -1] > -1) then { life_trunk_vehicle setVariable["lootModified", true, true]; };
	//[] call life_fnc_sessionUpdate;
}
	else
{
	if([true,_ctrl,_num] call life_fnc_handleInv) then
	{
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[life_trunk_vehicle] call life_fnc_vehInventory;
		if (life_trunk_vehicle getVariable["containerId", -1] > -1) then { life_trunk_vehicle setVariable["lootModified", true, true]; };
		//[[71, player, format["Took %1 %2 from trunk of %3", _num, _ctrl, typeOf life_trunk_vehicle]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
		
		if(_ctrl == "goldbar") then
		{
			_goldWeight = life_trunk_vehicle getVariable ["trunkWeight", 0];
			_goldWeight = _goldWeight - (_num * 400);
			life_trunk_vehicle setVariable ["trunkWeight", _goldWeight, true];
			life_trunk_vehicle setMass ((getMass life_trunk_vehicle) - (_num * 400));
		};
	}
		else
	{
		hint "Couldn't add to your inventory, are you full?";
	};
};