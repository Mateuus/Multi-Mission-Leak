#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts automated mining of resource from the tempest device.
*/
private["_vehicle","_resourceZones","_zone","_weight","_item","_vInv","_itemIndex"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle getVariable "mining"}) exitWith {hint localize "STR_NOTF_DeviceIsMining";}; //Mining is already in process..
closeDialog 0; //Close the interaction menu.
life_action_inUse = true; //Lock out the interaction menu for a bit..
_weight = [_vehicle] call life_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {hint localize "STR_NOTF_DeviceFull"; life_action_inUse = false;};
_resourceZones = ["peaches_1","peaches_2","peaches_3","peaches_4","ananas_1","ananas_2","ananas_3","ananas_4","banane_1","banane_2","banane_3","banane_4","algen_1","kokos_1","baumwolle_1","reis_1","nusse_1","kaffee_1","zuckerr_1","bambus_1","palmenb_1","cocain_1","meth_1","hanf_1","heroin_1","tabak_1","coral_1","yeast_1","hops_1","salz_1","steine_1","magmas_1","uran_1","solar_1"];
_zone = "";

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 150) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";
	life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
_item = switch(true) do {
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {"peach"};
	case (_zone in ["ananas_1","ananas_2","ananas_3","ananas_4"]): {"ananas"};
	case (_zone in ["banane_1","banane_2","banane_3","banane_4"]): {"banane"};
	case (_zone in ["algen_1"]): {"algenr"};
	case (_zone in ["kokos_1"]): {"kokos"};
	case (_zone in ["baumwolle_1"]): {"uwolle"};
	case (_zone in ["reis_1"]): {"ureis"};
	case (_zone in ["nusse_1"]): {"unusse"};
	case (_zone in ["kaffee_1"]): {"ukaffee"};
	case (_zone in ["zuckerr_1"]): {"zuckerr"};
	case (_zone in ["bambus_1"]): {"bambusr"};
	case (_zone in ["palmenb_1"]): {"palmenb"};
	case (_zone in ["cocain_1"]): {"ucocain"};
	case (_zone in ["meth_1"]): {"umeth"};
	case (_zone in ["hanf_1"]): {"hanf"};
	case (_zone in ["heroin_1"]): {"uheroin"};
	case (_zone in ["tabak_1"]): {"tabakr"};
	case (_zone in ["lsdf_1"]): {"ulsd"};
	case (_zone in ["coral_1"]): {"coral"};
	case (_zone in ["yeast_1"]): {"yeast"};
	case (_zone in ["hops_1"]): {"hops"};
	case (_zone in ["salz_1"]): {"salzerz"};
	case (_zone in ["steine_1"]): {"steine"};
	case (_zone in ["magmas_1"]): {"magmas"};
	case (_zone in ["uran_1"]): {"uuran"};
	case (_zone in ["solar_1"]): {"solarr"};
	default {""};
};

if(_item == "") exitWith {hint "Bad Resource?"; life_action_inUse = false;};
_vehicle setVariable ["mining",true,true]; //Lock the device
_vehicle remoteExec ["life_fnc_soundDevice",RCLIENT]; //Broadcast the 'mining' sound of the device for nearby units.

life_action_inUse = false; //Unlock it since it's going to do it's own thing...

while {true} do {
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	titleText[localize "STR_NOTF_DeviceMining","PLAIN"];
	_time = time + 27;
	
	//Wait for 27 seconds with a 'delta-time' wait.
	waitUntil {
		if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"]; true};
		if(round(_time - time) < 1) exitWith {true};
		sleep 0.2;
		false
	};
	if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_item,_items] call TON_fnc_index;
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	_itemWeight = ([_item] call life_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};
	
	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	
	//Locality checks...
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.045;
	} else {
		[_vehicle,(fuel _vehicle)-0.04] remoteExecCall ["life_fnc_setFuel",_vehicle];
	};
	
	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	titleText[format[localize "STR_NOTF_DeviceMined",_sum],"PLAIN"];
	_vehicle SVAR ["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	sleep 2;
};

_vehicle SVAR ["mining",nil,true];