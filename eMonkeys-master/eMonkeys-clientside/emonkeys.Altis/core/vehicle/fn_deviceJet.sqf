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
_resourceZones = ["jet_natriumchlorid","jet_maisstärke","jet_cellulosepulver","jet_sildenafil"];
_zone = "";

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 150) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint "Du bist nicht nah genug an einem Rohstoffvorkommen.";
	eM_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
_item = switch(true) do {
	case (_zone in ["jet_natriumchlorid"]): {"natriumchlorid"};
	case (_zone in ["jet_maisstärke"]): {"maisstaerke"};
	case (_zone in ["jet_cellulosepulver"]): {"cellulosepulver"};
	case (_zone in ["jet_sildenafil"]): {"sildenafil"};
	default {""};
};

if(_item == "") exitWith {hint "Bad Resource?"; eM_action_inUse = false;};
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
		_vehicle setFuel (fuel _vehicle)-0.045;
	} else {
		[[_vehicle,(fuel _vehicle)-0.04],"EMonkeys_fnc_setFuel",_vehicle,false] call EMonkeys_fnc_mp;
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