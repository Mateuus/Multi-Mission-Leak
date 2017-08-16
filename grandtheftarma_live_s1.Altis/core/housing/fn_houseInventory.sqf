
/*
File: fn_houseInventory.sqf
Author: Mario2002

Description:
handles the house inventory
*/
private["_house","_tInv","_pInv","_house_data","_radius","_houseData"];
_house = [_this,0,ObjNull,[ObjNull]] call GTA_fnc_param;
if(isNull _house OR !alive _house) exitWith {closeDialog 0;}; //If null / dead exit menu
disableSerialization;

_tInv = (findDisplay 8500) displayCtrl 8502;
_pInv = (findDisplay 8500) displayCtrl 8503;

(findDisplay 8500) displayAddEventHandler ["KeyDown", {
	private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked", "_dialog"];
	_ctrl = _this select 0;
	_code = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;
	switch (_code) do
	{
	case 1 : {
		[] call life_fnc_preCloseHouseStorage;
	};
};
false
}];
lbClear _tInv;
lbClear _pInv;
_weight = 0;
_houseData = _house getVariable["Trunk",[[],0]];
if(count _houseData == 0) then {
	_used = 0;
} else {
	_used = _houseData select 1;
};
_radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2));
_boxes = nearestObjects [position _house, ["Land_Box_AmmoOld_F","B_supplyCrate_F"], _radius];
{
	_box_data = [_x] call life_fnc_vehicleWeight;
	_weight = _weight + (_box_data select 0);
	_used = _used + (_box_data select 1);
}forEach _boxes;

_house_data = [_weight, _used];

if(_house_data select 0 == -1) exitWith {closeDialog 0};

ctrlSetText[8504,format["Weight: %1/%2",_house_data select 1,_house_data select 0]];
_data = _house getVariable ["Trunk",[]];
if(count _data == 0) then {_house setVariable["Trunk",[[],0],true]; _data = [];} else {_data = _data select 0;};
//Player Inventory Items
{
	//Money Handle
	if(_x != "GTA_money_cash") then
	{
		_str = [_x] call life_fnc_varToStr;
		_shrt = [_x,1] call life_fnc_varHandle;
		_val = missionNameSpace getVariable _x;
		if(_val > 0) then
		{
			_pInv lbAdd format["[%1] - %2",_val,_str];
			_pInv lbSetData [(lbSize _pInv)-1,_shrt];
		};
	}
	else
	{
		if(GTA_money_cash > 0) then
		{
			_pInv lbAdd format["£%1",[GTA_money_cash] call life_fnc_numberText];
			_pInv lbSetData [(lbSize _pInv)-1,"money"];
		};
	};
} foreach life_inv_items;

//Trunk Inventory Items
{
	if((_x select 0) != "money") then
	{
		_var = [_x select 0,0] call life_fnc_varHandle;
		_name = [_var] call life_fnc_varToStr;
		_val = _x select 1;
		if(_val > 0) then
		{
			_tInv lbAdd format["[%1] - %2",_val,_name];
			_tInv lbSetData [(lbSize _tInv)-1,_x select 0];
		};
	}
	else
	{
		_val = _x select 1;
		if(_val > 0) then
		{
			_tInv lbAdd format["£%1",[_val] call life_fnc_numberText];
			_tInv lbSetData [(lbSize _pInv)-1,"money"];
		};
	};
} foreach _data;