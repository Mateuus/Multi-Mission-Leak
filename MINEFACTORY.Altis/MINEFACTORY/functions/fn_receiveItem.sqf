#include "..\..\script_macros.hpp"
/*
	File: fn_receiveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receive an item from a player.
*/
private["_unit","_val","_item","_from","_diff"];
_unit = SEL(_this,0);
if(_unit != player) exitWith {};
_val = SEL(_this,1);
_item = SEL(_this,2);
_from = SEL(_this,3);

_diff = [_item,(parseNumber _val),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(!(EQUAL(_diff,(parseNumber _val)))) then {
	if(([true,_item,_diff] call life_fnc_handleInv)) then {
		hint format[ "Du wolltest %1 %2 %3 geben, aber er hat keinen Platz in seinem Inventar und hat es darum zurückgegeben._3",_from GVAR ["realname",name _from],_val,_diff,((parseNumber _val) - _diff)];
		[_from,_item,str((parseNumber _val) - _diff),_unit] remoteExecCall ["life_fnc_giveDiff",_from];
	} else {
		[_from,_item,_val,_unit,false] remoteExecCall ["life_fnc_giveDiff",_from];
	};
} else {
	if(([true,_item,(parseNumber _val)] call life_fnc_handleInv)) then {
		private "_type";
		_type = M_CONFIG(getText,"VirtualItems",_item,"displayName");
		hint format[ "%1 hat dir %2 %3 gegeben",_from GVAR ["realname",name _from],_val,( _type)];
	} else {
		[_from,_item,_val,_unit,false] remoteExecCall ["life_fnc_giveDiff",_from];
	};
};