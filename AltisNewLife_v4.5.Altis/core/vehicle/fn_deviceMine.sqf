#include <macro.h>
private["_vehicle","_resourceZones","_zone","_weight","_item","_vInv","_itemIndex"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle GVAR "mining"}) exitWith {hint localize "STR_NOTF_DeviceIsMining";};
closeDialog 0;
life_action_inUse = true;
_weight = [_vehicle] call life_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {hint localize "STR_NOTF_DeviceFull"; life_action_inUse = false;};
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","cocaine_2","weed_1","lead_1","iron_1","salt_1","sand_1","diamond_1","oil_1","rock_1","or_1","rye_1","hops_1","yeast_1","osmium_1","palladium_1"];
_zone = "";
{
	if(player distance (getMarkerPos _x) < 100) exitWith {_zone = _x;};
} foreach _resourceZones;
if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";
	life_action_inUse = false;
};
_item = switch(true) do {
	case (_zone in ["apple_1","apple_2"]): {"apple"};
	case (_zone in ["peaches_1","peaches_2"]): {"peach"};
	case (_zone in ["heroin_1"]): {"heroinu"};
	case (_zone in ["cocaine_1"]): {"coke"};
	case (_zone in ["weed_1"]): {"cannabis"};
	case (_zone in ["lead_1"]): {"copperore"};
	case (_zone in ["iron_1"]): {"ironore"};
	case (_zone in ["salt_1"]): {"salt"};
	case (_zone in ["sand_1"]): {"sand"};
	case (_zone in ["diamond_1"]): {"diamond"};
	case (_zone in ["oil_1"]): {"oilu"};
	case (_zone in ["rock_1"]): {"rock"};
	case (_zone in ["or_1"]): {"orr"};
	case (_zone in ["rye_1"]): {"rye"};
	case (_zone in ["yeast_1"]): {"yeast"};
	case (_zone in ["hops_1"]): {"hops"};
	case (_zone in ["osmium_1"]): {"osmium"};
	case (_zone in ["palladium_1"]): {"palladium"};
	case (_zone in ["phos_1"]): {"phosphore"};
	case (_zone in ["iode_1"]): {"iode"};
	default {""};
};
if(_item == "") exitWith {hint "Mauvaise ressources ?"; life_action_inUse = false;};
_vehicle SVAR ["mining",true,true]; //Lock the device
[_vehicle,"life_fnc_soundDevice",true,false] spawn life_fnc_MP;
life_action_inUse = false;
while {true} do {
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	titleText[localize "STR_NOTF_DeviceMining","PLAIN"];
	_time = time + 27;
	waitUntil {
		if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"]; true};
		if(round(_time - time) < 1) exitWith {true};
		uiSleep 0.2;
		false
	};
	if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	_vInv = _vehicle GVAR ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_item,_items] call TON_fnc_index;
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff;
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	_itemWeight = ([_item] call life_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};
	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.045;
	} else {
		[[_vehicle,(fuel _vehicle)-0.04],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
	};
	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	titleText[format[localize "STR_NOTF_DeviceMined",_sum],"PLAIN"];
	_vehicle SVAR["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff;
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	uiSleep 2;
};
_vehicle SVAR["mining",nil,true];