/*
    File: fn_handleInv.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Do I really need one?
*/
private["_math","_item","_num","_return","_var","_weight","_value","_diff"];

_math = [_this,0,false,[false]] call BIS_fnc_param; //true = add; false = subtract;
_item = [_this,1,"",[""]] call BIS_fnc_param; //The item we are using to add or remove.
_num = [_this,2,0,[0]] call BIS_fnc_param; //Number of items to add or remove.
if(_item == "" OR _num == 0) exitWith {false};


if( _math ) then {
    _diff = [_item,_num,XY_carryWeight,XY_maxWeightCurrent] call XY_fnc_calcWeightDiff;
    _num = _diff;
    if(_num <= 0) exitWith {false};
};

private _varName = format["%1%2", XY_ssv_mniPrefix, _item];
_weight = (([_item] call XY_fnc_itemConfig) select 1) * _num;
_value = missionNamespace getVariable [_varName, 0];

if(_math) then {
    //Lets add!
    if((XY_carryWeight + _weight) <= XY_maxWeightCurrent) then {
        missionNamespace setVariable[_varName, (_value + _num)];
        XY_carryWeight = XY_carryWeight + _weight;
        _return = true;    
    } else {
        _return = false;
    };
} else {
    //Lets subtract!
    if((_value - _num) < 0) then {
        _return = false;
    } else {
        missionNamespace setVariable[_varName, _value - _num];

        XY_carryWeight = XY_carryWeight - _weight;
        XY_carryWeight = 0 max XY_carryWeight;
        _return = true;
    };
};
XY_forceSaveTime = time + 5;
_return;