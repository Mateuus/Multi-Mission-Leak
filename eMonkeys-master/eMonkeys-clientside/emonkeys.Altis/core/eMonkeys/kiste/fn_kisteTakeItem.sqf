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
if(isNull eM_trunk_vehicle OR !alive eM_trunk_vehicle) exitWith {hint "Das Fahrzeug ist entweder nicht vorhanden oder bereits zerstört."};
if(((!alive player) || (player getVariable["onkill",FALSE]))) exitwith {closeDialog 0;};

if((lbCurSel 3502) == -1) exitWith {hint "Wählen Sie einen Gegenstand";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call fnc_isnumber)) exitWith {hint "Ungültiges Nummernformat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

_index = [_ctrl,((eM_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
_data = (eM_trunk_vehicle getVariable "Trunk") select 0;
_old = eM_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {hint "Es sind nicht so viele Gegenstände vorhanden."};
_num = [_ctrl,_num,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Dein Inventar ist voll."};
_weight = ([_ctrl] call EMonkeys_fnc_itemWeight) * _num;
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
	
	EMonkeys_c164 = EMonkeys_c164 + _num;
	eM_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[eM_trunk_vehicle] call EMonkeys_fnc_kisteInventory;
}
	else
{
	if([true,_ctrl,_num] call EMonkeys_fnc_handleInv) then
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
		eM_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[eM_trunk_vehicle] call EMonkeys_fnc_kisteInventory;
	}
		else
	{
		hint "Sie haben nicht mehr genug Platz!";
	};
};
