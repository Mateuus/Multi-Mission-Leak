/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/

private["_shortName", "_num", "_totalWeight", "_itemWeight", "_veh_data", "_inv", "_index", "_val"];

disableSerialization;

if( isNil "XY_trunkVehicle" || { isNull XY_trunkVehicle } || { !(alive XY_trunkVehicle) } ) exitWith {
    hint localize "STR_MISC_VehDoesntExist"
};
if( !(alive player) ) exitwith {
    closeDialog 0;
};
if( (lbCurSel 3503) == -1 ) exitWith {
    hint localize "STR_Global_NoSelection";
};

_num = ctrlText 3506;
if(!([_num] call XY_fnc_isnumber)) exitWith {
    hint "Falsches Zahlenformat";
};
_num = parseNumber(_num);
if(_num < 1) exitWith {
    hint "Du kannst keine Zahl unter 1 eingeben!";
};

_shortName = lbData[3503, lbCurSel 3503];
if( _shortName isEqualTo "" ) exitWith {};

if( (XY_trunkVehicle isKindOf "House_F") && ([_shortName, 4] call KRON_StrLeft) isEqualTo "uran" ) exitWith {
    hint "Das willst du nicht in deinem Haus haben";
};
if( (XY_trunkVehicle isKindOf "House_F") && (_shortName isEqualTo "goldbar") ) exitWith {
    hint "Das kannst du nicht einlagern";
};

if( _num > missionNameSpace getVariable [ format["%1%2", XY_ssv_mniPrefix, _shortName], 0] ) then {
    hint "So viele Items hast du nicht";
};

if(XY_trunkVehicle isKindOf "House_F") then {
	_mWeight = 0;
	{
        _mWeight = _mWeight + (( [typeOf _x] call XY_fnc_vehicleConfig ) select 2);
    } forEach (XY_trunkVehicle getVariable["containers", []]);
	_totalWeight = [_mWeight, (XY_trunkVehicle getVariable["trunk", [[], 0]]) select 1];
} else {
	_totalWeight = [XY_trunkVehicle] call XY_fnc_vehicleWeight;
};
_itemWeight = (([_shortName] call XY_fnc_itemConfig) select 1) * _num;
_veh_data = XY_trunkVehicle getVariable ["trunk",[[],0]];
_inv = _veh_data select 0;

if(_shortName isEqualTo "goldbar" && { !(XY_trunkVehicle isKindOf "LandVehicle" || XY_trunkVehicle isKindOf "House_F") } ) exitWith {
    hint "Das kannst du nur auf dem Landweg transportieren";
};

if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {
    hint "Das Fahrzeug ist entweder voll oder kann die Menge nicht tragen"
};

if(!([false, _shortName, _num] call XY_fnc_handleInv)) exitWith {
    hint "Der Gegenstand konnte nicht aus deinem Inventar entfernt werden, um es ins Fahrzeug zu legen";
};

_index = [_shortName,_inv] call XY_fnc_index;
if(_index == -1) then {
    _inv pushBack [_shortName, _num];
} else {
    _val = _inv select _index select 1;
    _inv set[_index, [_shortName, _val + _num]];
};

XY_trunkVehicle setVariable["trunk", [_inv, (_veh_data select 1) + _itemWeight]];

[XY_trunkVehicle] call XY_fnc_vehInventory;