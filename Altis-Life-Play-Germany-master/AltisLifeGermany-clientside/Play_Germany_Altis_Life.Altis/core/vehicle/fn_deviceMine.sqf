#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	Modified by: Play Germany

	Description:
	Starts automated mining of resource from the tempest device.
*/
private["_vehicle","_resourceZones","_zone","_weight","_item","_vInv","_itemIndex"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle getVariable "mining"}) exitWith {hint localize "STR_NOTF_DeviceIsMining";}; //Mining is already in process..
_vehicle setVariable ["mining",player,true];
if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
closeDialog 0; //Close the interaction menu.
life_action_inUse = true; //Lock out the interaction menu for a bit..
_weight = [_vehicle] call life_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {hint localize "STR_NOTF_DeviceFull"; life_action_inUse = false;};
_resourceZonesGather = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","resarea_drugs_heroin","resarea_drugs_cocaine","resarea_drugs_cannabis","resarea_oilfield","resarea_oilrig","resarea_hopfen","resarea_getreide"];
_zone = "";
_mode = "";

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 50) exitWith {_zone = _x; _mode = "gather";};
} foreach _resourceZonesGather;

if(_zone == "") then {
	for "_i" from 0 to ((count PGSERV_res_loot) - 1) do
	{
		_markerName = SEL(PGSERV_res_loot, _i) select 0;
		_distanceToMarker = ((getMarkerPos _markerName) distance (vehicle player));

		if (_distanceToMarker < 40) exitWith {

			_action = [
				"Willst du Bohren (entspricht Spitzhacke) oder Graben (entspricht Schaufel)?",
				"Automining",
				"Bohren",
				"Graben"
			] call BIS_fnc_guiMessage;

			if(_action) then {
				_mode = "pick";
				_zone = SEL(PGSERV_res_loot, _i) select 2; // select pickaxe loot array at position 2
			} else {
				_mode = "shovel";
				_zone = SEL(PGSERV_res_loot, _i) select 1; // select shovel loot array at position 1
			};
		};
	};
};

if(EQUAL(_zone,"")) exitWith {
	hint localize "STR_NOTF_notNearResource";
	_vehicle setVariable["mining",nil,true];
	life_action_inUse = false;
};

switch (_mode) do {
	case "gather": {
		//Get the resource that will be gathered from the zone name...
		switch(true) do {
			case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_item = "apple";};
			case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_item = "peach";};
			case (_zone in ["resarea_drugs_heroin"]): {_item = "heroin_unprocessed";};
			case (_zone in ["resarea_drugs_cocaine"]): {_item = "cocaine_unprocessed";};
			case (_zone in ["resarea_drugs_cannabis"]): {_item = "cannabis";};
			case (_zone in ["resarea_hopfen"]): {_item = "hopfen";};
			case (_zone in ["resarea_getreide"]): {_item = "getreide";};
			case (_zone in ["resarea_zuckerrohr"]): {_item = "zuckerrohr";};
			default {""};
		};

		if(_item == "") exitWith {hint "Bad Resource?"; life_action_inUse = false;};
		[_vehicle,"life_fnc_soundDevice",true,false] call life_fnc_MP; //Broadcast the 'mining' sound of the device for nearby units.

		life_action_inUse = false; //Unlock it since it's going to do it's own thing...

		while {true} do {
			if(!alive _vehicle OR isNull _vehicle) exitWith {};
			if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
			if (!((_vehicle getVariable "mining") isEqualTo player)) exitWith {};

			titleText[localize "STR_NOTF_DeviceMining","PLAIN"];
			_time = time + 27;

			//Wait for 27 seconds with a 'delta-time' wait.
			waitUntil {
				if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"]; true};
				if (!((_vehicle getVariable "mining") isEqualTo player)) exitWith {true};
				if(round(_time - time) < 1) exitWith {true};
				sleep 0.2;
				false
			};
			if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
			if (!((_vehicle getVariable "mining") isEqualTo player)) exitWith {};
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
				[[_vehicle,(fuel _vehicle)-0.04],"life_fnc_setFuel",_vehicle,false] call life_fnc_MP;
			};

			if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
			titleText[format[localize "STR_NOTF_DeviceMined",_sum,localize M_CONFIG(getText,"VirtualItems",_item,"displayName")],"PLAIN"];
			_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
			_weight = [_vehicle] call life_fnc_vehicleWeight;
			_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight..
			if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
			sleep 2;
		};

		if (!((_vehicle getVariable "mining") isEqualTo player)) then {hint "Sammeln abgebrochen!";};
		_vehicle setVariable["mining",nil,true];
	};

	case "pick"; case "shovel": {

		[_vehicle,"life_fnc_soundDevice",true,false] call life_fnc_MP; //Broadcast the 'mining' sound of the device for nearby units.

		life_action_inUse = false; //Unlock it since it's going to do it's own thing...
		_loot = _zone;
		while {true} do {
			_trashRandom = floor(random 101);
			if (_trashRandom <= 9) then {
				// chance by 9% that we will collect some trash
				_loot = PGSERV_res_loot_trash;
			} else {
				_loot = _zone;
			};

			/*****************************************************************
			* Select random item
			* ***************************************************************/
			_random = floor(random (100));
			_item = "";
			_psum = 0;

			{
				_currentItem = SEL(_x, 0);
				_currentChance = SEL(_x, 1);

				_psum = _psum + _currentChance;
				if (_psum >= _random) exitWith { _item = _currentItem; };
			} foreach _loot;
			/*****************************************************************/

			if(EQUAL(_item,"")) exitWith {hint "Gathering Bug: _item not set";};

			// TODO: exp system
			_lootFactor = (random 2)+1; //number to give favor 2
			_lootFactor = round(_lootFactor * 5); //5 times because slower then manual mining

			_diff = [_item,_lootFactor,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

			/*************************** DEVICE STUFF ************************/
			if(!alive _vehicle OR isNull _vehicle) exitWith {};
			if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
			if (!((_vehicle getVariable "mining") isEqualTo player)) exitWith {};
			titleText[localize "STR_NOTF_DeviceMining","PLAIN"];

			//Weight pre check
			_weight = [_vehicle] call life_fnc_vehicleWeight;
			_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight..
			if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};

			_time = time + 27;

			//Wait for 27 seconds with a 'delta-time' wait.
			waitUntil {
				if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"]; true};
				if (!((_vehicle getVariable "mining") isEqualTo player)) exitWith {true};
				if(round(_time - time) < 1) exitWith {true};
				sleep 0.2;
				false
			};
			if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
			if (!((_vehicle getVariable "mining") isEqualTo player)) exitWith {};
			_vInv = _vehicle getVariable ["Trunk",[[],0]];
			_items = _vInv select 0;
			_space = _vInv select 1;
			_itemIndex = [_item,_items] call TON_fnc_index;
			_weight = [_vehicle] call life_fnc_vehicleWeight;
			_sum = [_item,_lootFactor,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight..
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
				[[_vehicle,(fuel _vehicle)-0.04],"life_fnc_setFuel",_vehicle,false] call life_fnc_MP;
			};

			if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
			titleText[format[localize "STR_NOTF_DeviceMined",_sum,localize M_CONFIG(getText,"VirtualItems",_item,"displayName")],"PLAIN"];
			_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
			sleep 2;
		};
		if (!((_vehicle getVariable "mining") isEqualTo player)) then {hint "Mining abgebrochen!";};
		_vehicle setVariable["mining",nil,true];
	};

	default {diag_log "Switch case hates you";};
};

_vehicle setVariable["mining",nil,true];