/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts automated mining of resource from the tempest device.
*/
private["_vehicle","_resourceZones","_zone","_weight","_item","_vInv","_itemIndex"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle getVariable "mining"}) exitWith {hint "Dieses Fahrzeug baut bereits ab";}; //Mining is already in process..
closeDialog 0; //Close the interaction menu.
eM_action_inUse = true; //Lock out the interaction menu for a bit..
_weight = [_vehicle] call EMonkeys_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {hint "Dieses Fahrzeug ist voll"; eM_action_inUse = false;};
_resourceZones = [["holz_1",30],["lead_1",30],["iron_1",30],["salt_1",30],["sand_1",30],["diamond_1",30],["oil_1",70],["rock_1",30],["silver_1",30],["hops_1",30],["fruit_1",30],["fruit_2",30],["fruit_3",30],["fruit_4",30],["fruit_5",30],["fruit_ff",30],["bananas_1",30],["bananas_2",30],["bananas_3",30],["bananas_4",30],["heroin_1",30],["cocaine_1",30],["weed_1",30],["rye_1",30],["yeast_1",30],["holz_1",30],["cotton_1",30],["cotton_2",30],["rape_1",30]];
_zone = "";
_farm = "";

//Find out what zone we're near
{
	if(_vehicle distance (getMarkerPos (_x select 0)) <= (_x select 1)) exitWith {_zone = _x select 0;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint "Du bist nicht nah genug an einem Rohstoffvorkommen.";
	eM_action_inUse = false;
};

switch(true) do {
	case (_zone in ["cotton_1","cotton_2"]): {_farm = "cotton"};
	case (_zone in ["hops_1"]): {_farm = "hops"};
	case (_zone in ["heroin_1"]): {_farm = "heroin"};
	case (_zone in ["cocaine_1"]): {_farm = "cocaine"};
	case (_zone in ["weed_1"]): {_farm = "cannabis"};
	case (_zone in ["rye_1"]): {_farm = "rye"};
	case (_zone in ["yeast_1"]): {_farm = "yeast"};
	case (_zone in ["lead_1"]): {_farm = "copper"};
	case (_zone in ["iron_1"]): {_farm = "iron"};
	case (_zone in ["salt_1"]): {_farm = "salt"};
	case (_zone in ["sand_1"]): {_farm = "sand"};
	case (_zone in ["diamond_1"]): {_farm = "diamond"};
	case (_zone in ["rock_1"]): {_farm = "rock"};
	case (_zone in ["silver_1"]): {_farm = "silver"};
	case (_zone in ["waterplace_1"]): {_farm = "water"};
};

//Normales Abbauen
_farmArry = [_farm,EMonkeys_GatherCfg] call TON_fnc_index;
_farmArry = EMonkeys_GatherCfg select _farmArry;

_itemNr = _farmArry select 1;
_item = _farmArry select 2;
_random = _farmArry select 3;

//Random Items
if(_random != -1) then
{
	_ran = ceil(random _random);
	{
		if(_ran in (_x select 1)) exitWith {_item = _x select 0};
	}foreach _item;
}else{
	_item = ((_item select 0) select 0);
};

if(_item == "" || _farm == "") exitWith {eM_action_inUse = false;};
_vehicle setVariable ["mining",true,true]; //Lock the device
[_vehicle,"EMonkeys_fnc_soundDevice",true,false] call EMonkeys_fnc_mp; //Broadcast the 'mining' sound of the device for nearby units.

eM_action_inUse = false; //Unlock it since it's going to do it's own thing...

while {true} do {
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText["Das Fahrzeug muss während des abbauens stillstehen.","PLAIN"];};
	titleText["Abbauvorgang läuft...","PLAIN"];
	_time = time + 38;
	
	//Wait for 27 seconds with a 'delta-time' wait.
	waitUntil {
		if(isEngineOn _vehicle) exitWith {titleText["Das Fahrzeug muss während des abbauens stillstehen.","PLAIN"]; true};
		if(round(_time - time) < 1) exitWith {true};
		uisleep 0.2;
		false
	};
	if(isEngineOn _vehicle) exitWith {titleText["Das Fahrzeug muss während des abbauens stillstehen.","PLAIN"];};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_item,_items] call TON_fnc_index;
	_weight = [_vehicle] call EMonkeys_fnc_vehicleWeight;
	_sum = [_item,10,_weight select 1,_weight select 0] call EMonkeys_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText["Dieses Fahrzeug ist voll","PLAIN"];};
	_itemWeight = ([_item] call EMonkeys_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};
	
	if(fuel _vehicle == 0) exitWith {titleText["Tank leer","PLAIN"];};
	
	//Locality checks...
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.025; //-0.045
	} else {
		[[_vehicle,(fuel _vehicle)-0.02],"EMonkeys_fnc_setFuel",_vehicle,false] call EMonkeys_fnc_mp; //-0.04
	};
	
	if(fuel _vehicle == 0) exitWith {titleText["Tank leer","PLAIN"];};
	titleText[format["Zyklus beendet, es wurde(n) %1 abgebaut.",_sum],"PLAIN"];
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call EMonkeys_fnc_vehicleWeight;
	_sum = [_item,10,_weight select 1,_weight select 0] call EMonkeys_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText["Dieses Fahrzeug ist voll","PLAIN"];};
	uisleep 2;
};

_vehicle setVariable["mining",nil,true];