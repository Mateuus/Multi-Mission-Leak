/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle") OR (cursorTarget getVariable["containerId", -1] > -1))) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[[],0]];
if(count _vehicleInfo == 0) exitWith {hint "This vehicle is empty"};
_newTrunk = _vehicleInfo select 0;
_newWeight = _vehicleInfo select 1;
_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_index = [_var,life_illegal_items] call life_fnc_index;
	if(_index != -1) then
	{
		_value = _value + (_val * ((life_illegal_items select _index) select 1));
		_newTrunk = _newTrunk - [_x];
 		_newWeight = _newWeight - (([_x select 0] call life_fnc_itemWeight) *(_x select 1));
	};
} foreach (_vehicleInfo select 0);

if (_vehicle getVariable ["drugrunning",false]) then { _value = _value + 10000; };

if(_value > 0) then
{
	[[0,format["A vehicle was searched and has $%1 worth of drugs / contraband.",[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	["atm","add",_value] call life_fnc_uC;
	[floor (_value / 10)] spawn life_fnc_earnPrestige;
	_vehicle setVariable["Trunk",[_newTrunk,_newWeight],true];
	if (_value >= 5000) then {
		_vehicle setVariable["illegalVehicle",true,true];
	};
}
else
{
	hint "Nothing illegal in this vehicle.";
};