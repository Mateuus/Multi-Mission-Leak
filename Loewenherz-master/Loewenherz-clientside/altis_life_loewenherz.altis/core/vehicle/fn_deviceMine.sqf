/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts automated mining of resource from the tempest device.
*/
private["rye_1","hops_1","yeast_1","_vehicle","_resourceZones","_zone","_weight","_item","_vInv","_itemIndex","_addExpAmount","_profName"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle getVariable "mining"}) exitWith {hint localize "STR_NOTF_DeviceIsMining";}; //Mining is already in process..
closeDialog 0; //Close the interaction menu.
lhm_action_inUse = true; //Lock out the interaction menu for a bit..
_weight = [_vehicle] call lhm_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {hint localize "STR_NOTF_DeviceFull"; lhm_action_inUse = false;};
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","lead_1","iron_1","salt_1","sand_1","diamond_1","oil_1","oil_2","rock_1"];
_zone = "";

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 150) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";
	lhm_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
_item = switch(true) do {
// LHM Alcohol Start
	case (_zone in ["rye_1"]): {"rye"};
	case (_zone in ["yeast_1"]): {"yeast"};
	case (_zone in ["hops_1"]): {"hops"}; 
// LHM ALcohol End
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {"apple"};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {"peach"};
	case (_zone in ["heroin_1"]): {"heroinu"};
	case (_zone in ["cocaine_1"]): {"cocaine"};
	case (_zone in ["weed_1"]): {"cannabis"};
	case (_zone in ["lead_1"]): {"copperore"};
	case (_zone in ["iron_1"]): {"ironore"};
	case (_zone in ["salt_1"]): {"salt"};
	case (_zone in ["sand_1"]): {"sand"};
	case (_zone in ["diamond_1"]): {"diamond"};
	case (_zone in ["oil_1","oil_2"]): {"oilu"};
	case (_zone in ["rock_1"]): {"rock"};
	default {""};
};

if(_item == "") exitWith {hint "Bad Resource?"; lhm_action_inUse = false;};
_vehicle setVariable ["mining",true,true]; //Lock the device
[_vehicle,"lhm_fnc_soundDevice",true,false] call lhm_fnc_mp; //Broadcast the 'mining' sound of the device for nearby units.

lhm_action_inUse = false; //Unlock it since it's going to do it's own thing...

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
	_weight = [_vehicle] call lhm_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call lhm_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	_itemWeight = ([_item] call lhm_fnc_itemWeight) * _sum;
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
		[[_vehicle,(fuel _vehicle)-0.04],"lhm_fnc_setFuel",_vehicle,false] call lhm_fnc_mp;
	};
	
	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	titleText[format[localize "STR_NOTF_DeviceMined",_sum],"PLAIN"];
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call lhm_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call lhm_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	sleep 2;
};

_addExpAmount = round(_sum / 2);
_profName = [_item] call lhm_fnc_profType;
if( _profName != "" ) then {
		_data = missionNamespace getVariable (_profName);
		[_profName,_addExpAmount] call lhm_fnc_addExp;
}; 
		
_vehicle setVariable["mining",nil,true];