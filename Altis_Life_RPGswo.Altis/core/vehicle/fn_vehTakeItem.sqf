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
if(isNull DWEV_trunk_vehicle OR !alive DWEV_trunk_vehicle) exitWith {hint "Das Fahrzeug ist entweder nicht vorhanden oder zerstört."};
if(!alive player) exitwith {closeDialog 0;};

if((lbCurSel 3502) == -1) exitWith {hint "Du musst einen Gegenstand auswählen!";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call DWF_fnc_isnumber)) exitWith {hint "Ungültiges Zahlenformat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst keine Zahl unter 1 eingeben!";};

_index = [_ctrl,((DWEV_trunk_vehicle getVariable "Trunk") select 0)] call DWF_fnc_index;
_data = (DWEV_trunk_vehicle getVariable "Trunk") select 0;
_old = DWEV_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {hint "Das Fahrzeug hat nicht die eingegebene Menge vom Gegenstand."};
_num = [_ctrl,_num,DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Dein Inventar ist voll."};
_weight = ([_ctrl] call DWEV_fnc_itemWeight) * _num;
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
	
	dwf_cash = dwf_cash + _num;
	DWEV_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[DWEV_trunk_vehicle] call DWEV_fnc_vehInventory;
}
	else
{
	if([true,_ctrl,_num] call DWEV_fnc_handlelnv) then
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
		DWEV_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[DWEV_trunk_vehicle] call DWEV_fnc_vehInventory;
	}
		else
	{
		hint "Konnte nicht zum Inventar hinzugefügt werden, bist du voll?";
	};
};