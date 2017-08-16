/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by Play Germany
	
	Description:
	Starts the robbing process?
*/
private["_target","_gps","_radio","_targetGroup"];
_target = cursorTarget;
_gps = false;
_radio = false;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

if("ItemRadio" in assignedItems _target) then {
	_target removeweapon "ItemRadio";
	_defenceplace1 = "Item_ItemRadio" createVehicle (player modelToWorld[0,0,0]);
	_radio = true;
};

if("ItemGPS" in assignedItems _target) then {
	_target removeweapon "ItemGPS";
	_defenceplace2 = "Item_ItemGPS" createVehicle (player modelToWorld[0,0,0]);
	_gps = true;
};

if(_radio) then {
	if(_gps) then {
		hint "Ein Smartphone und ein GPS sind auf den Boden gefallen";	
	} else {
		hint "Ein Smartphone ist auf den Boden gefallen";
	};
} else {
	if(_gps) then {
		hint "Ein GPS ist auf den Boden gefallen";	
	} else {
		hint "Die Person hat weder Smartphone noch GPS!";
	};
};

if(_gps) then{
	//side check is probably unnecessary, but I'm too lazy for testing
	if(side _target == west) then {
		[[name _target,visiblePosition _target],"life_fnc_copLostMarker",west,false] spawn life_fnc_MP;
	} else {
		_targetGroup = group _target;
		if(!isNil {_targetGroup getVariable "gang_name"})then {
			[[name _target,visiblePosition _target],"life_fnc_copLostMarker",_targetGroup,false] spawn life_fnc_MP;
		};
	};
};
