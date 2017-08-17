#include "..\..\script_macros.hpp"
/*
    File: fn_vehInvSearch.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Searches the vehicle for illegal items.
*/
private ["_vehicle","_vehicleInfo","_value","_list"];
_vehicle = cursorObject;
_list = ["Air","Ship","LandVehicle"];
if (isNull _vehicle || {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if ((count _vehicleInfo isEqualTo 0) && !(_vehicle getVariable "purpose" == "truck_mission")) exitWith {[localize "STR_Cop_VehEmpty",true,"slow"] call life_fnc_notificationSystem;};

if(_vehicle getVariable "purpose" == "truck_mission") then
{
	_type = _vehicle getVariable["type","legal"];
	_cargo = _vehicle getVariable["cargoType",["Food",100]];
	_cargoAmount = _vehicle getVariable["cargoAmount",100];

	if(_type == "legal") then
	{
		hint format["This vehicle is legally transporting %1 %2, and you're delaying them. Ass.",_cargo select 0, _cargoAmount];
	}
	else
	{
		if(_vehicle getVariable["goodsRemoved","1"] == "1") then
		{
			hint format["This truck has already been searched and the contents (%1 %2) submitted to evidence. Impound it already!", _cargoAmount, _cargo select 0];
		}
		else
		{
			_vehicle setVariable["goodsRemoved","1",true];
			_tmp = player nearEntities ["Man", 1000];
			_otherCops = [];
			{
				if(side _x == west && _x != player) then {
					_otherCops pushBack _x;
				};
			} foreach _tmp;
			_cargoValue = (_cargo select 1) * (_cargoAmount);
			_payout = (_cargoValue/((count _otherCops)+1));
			_payout = _payout * LIFE_SETTINGS(getNumber,"truck_searched_cop_percentage");
			if(_payout > 1000000) then	{	_payout = 1000000;	};
			_Driver = _vehicle getVariable "truckDriver";

			hint format["You have searched an illegal vehicle and discovered %1 %2! You and all oficers within 1km have been rewarded a finders fee of %3! Good work officer!",_cargoAmount, _cargo select 0, _payout];
	    [0,"STR_NOTF_VehContraband",[_cargoAmount, _cargo select 0, [_cargoValue] call BIS_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

			civRDMed = civRDMed + _payout;
			_xp = ceil(_payout * 0.0025);
			[_xp] spawn life_fnc_awardExperience;
			{
				[_x,_payout,player] remoteExecCall ["life_fnc_receiveMoney",_x];
			} foreach _otherCops;
		};
	};
};


if(isNil{_vehicle getVariable "purpose"}) then {
	_value = 0;
	_illegalValue = 0;
	{
	    _var = _x select 0;
	    _val = _x select 1;
	    _isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
	    if (_isIllegalItem isEqualTo 1 ) then{
	        _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_var,"sellPrice");
	        if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "processedItem")) then {
	            _illegalItemProcessed = M_CONFIG(getText,"VirtualItems",_var,"processedItem");
	            _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_illegalItemProcessed,"sellPrice");
	        };

	        _illegalValue = _illegalValue + (round(_val * _illegalPrice / 2));
	    };
	} forEach (_vehicleInfo select 0);
	_value = _illegalValue;
	if (_value > 0) then {
	    [0,"STR_NOTF_VehContraband",true,[[_value] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	    civRDMed = civRDMed + _value;
	    [1] call SOCK_fnc_updatePartial;
	    _vehicle setVariable ["Trunk",[[],0],true];
	} else {
	    [localize "STR_Cop_NoIllegalVeh",true,"slow"] call life_fnc_notificationSystem;
	};
};
