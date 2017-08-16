/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_shortName", "_num", "_index", "_contents", "_trunk", "_value", "_weight", "_diff"];

disableSerialization;

if( isNil "XY_trunkVehicle" || { isNull XY_trunkVehicle } || { !(alive XY_trunkVehicle) } ) exitWith {
    hint localize "STR_MISC_VehDoesntExist"
};
if( !(alive player) ) exitwith {
    closeDialog 0;
};
if( (lbCurSel 3502) == -1 ) exitWith {
    hint localize "STR_Global_NoSelection";
};

_num = ctrlText 3505;
if(!([_num] call XY_fnc_isnumber)) exitWith {
    hint "Falsches Zahlenformat";
};
_num = parseNumber(_num);
if(_num < 1) exitWith {
    hint "Du kannst keine Zahl unter 1 eingeben!";
};

_shortName = lbData[3502, lbCurSel 3502];
if( _shortName isEqualTo "" ) exitWith {};

_trunk = XY_trunkVehicle getVariable["trunk", []];
if( _trunk isEqualTo [] ) exitWith {};

_contents = _trunk select 0;

_index = [ _shortName, _contents ] call XY_fnc_index;
if(_index == -1) exitWith {};

_value = (_contents select _index) select 1;
if(_num > _value) exitWith {
    hint localize "STR_MISC_NotEnough";
};

_num = [_shortName, _num, XY_carryWeight, XY_maxWeightCurrent] call XY_fnc_calcWeightDiff;
if(_num == 0) exitWith {
    hint localize "STR_NOTF_InvFull"
};
_weight = (([_shortName] call XY_fnc_itemConfig) select 1) * _num;

if( !([true, _shortName, _num] call XY_fnc_handleInv) ) exitWith {
    hint localize "STR_NOTF_InvFull";
};

if( _num == _value ) then {
    _contents set[_index, -1];
    _contents = _contents - [-1];
} else {
    _contents set[_index, [_shortName, _value - _num] ];
};
XY_trunkVehicle setVariable[ "trunk", [_contents, (_trunk select 1) - _weight] ];

[XY_trunkVehicle] call XY_fnc_vehInventory;