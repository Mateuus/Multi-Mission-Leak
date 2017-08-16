/*
    File: fn_vehInventory.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Used a refresher for the vehicle inventory / trunk menu items.
*/
private["_veh", "_tInv", "_pInv", "_veh_data"];

_veh = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param;

if( isNull _veh || !alive _veh ) exitWith {
    closeDialog 0;
};

disableSerialization;

_tInv = (findDisplay 3500) displayCtrl 3502;
_pInv = (findDisplay 3500) displayCtrl 3503;

lbClear _tInv;
lbClear _pInv;

if(_veh isKindOf "House_F") then {
    private["_mWeight"];
    _mWeight = 0;
    {
        _mWeight = _mWeight + (( [typeOf _x] call XY_fnc_vehicleConfig ) select 2);
    } forEach (_veh getVariable["containers",[]]);

    _veh_data = [_mWeight, (_veh getVariable["trunk", [[], 0]]) select 1];
} else {
    _veh_data = [_veh] call XY_fnc_vehicleWeight;
};

if(_veh_data select 0 == -1) exitWith {
    closeDialog 0
};

ctrlSetText[3504, format[ "%1: %2/%3 | Inventar: %4/%5", ["Ladeplatz", "Lagerplatz"] select (_veh isKindOf "House_F"), _veh_data select 1, _veh_data select 0, XY_carryWeight, XY_maxWeightCurrent ]];

_data = _veh getVariable ["trunk", []];
if(count _data == 0) then {
    _veh setVariable["trunk", [[], 0], true]; 
    _data = [];
} else {
    _data = _data select 0;
};

{
    _itemName = _x select 2;
    _shortName = _x select 0;
    _val = missionNameSpace getVariable [_x select 6, 0];

    if(_val > 0) then {
        _pInv lbAdd format["%1x %2", _val, _itemName];
        _pInv lbSetData [(lbSize _pInv) - 1, _shortName];
    };
} forEach XY_virtItems;

//Trunk Inventory Items
{
    private _count = _x select 1;
    if(_count > 0) then {
        _tInv lbAdd format["%1x %2", _count, ([_x select 0] call XY_fnc_itemConfig) select 2];
        _tInv lbSetData [(lbSize _tInv) - 1, _x select 0];
    };

} forEach _data;
