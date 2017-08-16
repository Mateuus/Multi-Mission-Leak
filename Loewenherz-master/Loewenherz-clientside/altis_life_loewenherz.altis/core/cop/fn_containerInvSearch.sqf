#include <macro.h>
/*
	File: fn_containerInvSearch.sqf
	Author: NiiRoZz
	Inspired : Bryan "Tonic" Boardwine

	Description:
	Searches the container for illegal items.
*/
private["_container","_containerInfo","_value"];
_container = param [0,ObjNull,[ObjNull]];
if(isNull _container) exitWith {};

_containerInfo = _container getVariable ["Trunk",[]];
if(count _containerInfo isEqualTo 0) exitWith {hint localize "STR_Cop_ContainerEmpty"};
_value = 0;
_illegalValue = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_index = [_var,lhm_illegal_items] call TON_fnc_index;
	if(_index != -1) then
	{
		_vIndex = [_var,__GETC__(sell_array)] call TON_fnc_index;
		if(_vIndex != -1) then
		{
			_illegalValue = _illegalValue + (_val * ((__GETC__(sell_array) select _vIndex) select 1));
		};
	};
} foreach (_containerInfo select 0);


_value = _illegalValue;

if(_value > 0) then {
	[[0,"STR_NOTF_ContainerContraband",true,[[_value] call lhm_fnc_numberText]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
	lhm_atmcash = lhm_atmcash + _value;
	_container setVariable ["Trunk",[[],0],true];
	[[_container],"TON_fnc_updateHouseTrunk",false,false] call lhm_fnc_mp;
} else {
	hint localize "STR_Cop_NoIllegalCOntainer";
};