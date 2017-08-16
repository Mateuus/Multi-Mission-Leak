#include "..\..\script_macros.hpp"
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value","_list"];
_vehicle = cursorTarget;
_list = ["Air","Ship","LandVehicle"];
if(isNull _vehicle || {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};

_vehicleInfo = _vehicle GVAR ["Trunk",[]];
if (count _vehicleInfo isEqualTo 0) exitWith {hint localize "STR_Cop_VehEmpty"};

_value = 0;
_illegalValue = 0;
{
	_var = SEL(_x,0);
	_val = SEL(_x,1);
	_isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
	if(_isIllegalItem isEqualTo 1) then{

		_illegalPrice = -2;
		_itemNameToSearchFor = _var;
		{
        	_curItemName = _x select 0;
        	_curItemPrice = _x select 1;
        	if (_curItemName == _itemNameToSearchFor) then {_illegalPrice = _curItemPrice};
        } forEach DYNMARKET_prices;
		
		if (_illegalPrice isEqualTo -2) then {
            _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_var,"sellPrice");
        };

		if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "processedItem")) then {
            _illegalItemProcessed = M_CONFIG(getText,"VirtualItems",_var,"processedItem");
            _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_illegalItemProcessed,"sellPrice");
            _illegalPrice = -2;
            _itemNameToSearchFor = _illegalItemProcessed;
            {
            	_curItemName = _x select 0;
            	_curItemPrice = _x select 1;
            	if (_curItemName == _itemNameToSearchFor) then {_illegalPrice = _curItemPrice};
            } forEach DYNMARKET_prices;

            if (_illegalPrice isEqualTo -2) then {
                _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_illegalItemProcessed,"sellPrice");
            };
        };

        _illegalValue = _illegalValue + (round(_val * _illegalPrice / 3));
    };
} forEach (_vehicleInfo select 0);
_value = _illegalValue;
if (_value > 0) then {
    [0,"STR_NOTF_VehContraband",true,[[_value] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
    BANK = BANK + _value;
    [1] call SOCK_fnc_updatePartial;
    _vehicle setVariable ["Trunk",[[],0],true];
} else {
    hint localize "STR_Cop_NoIllegalVeh";
};
