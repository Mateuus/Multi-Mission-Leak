/*
	File: fn_surrenderAction.sqf
	Author: Skalicon
	
	Description:
	Surrender Animation test
*/
private["_unit","_obj","_posATL"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(vehicle _unit != _unit) exitWith{};
if(speed player > 1) exitWith{};
if (_unit getVariable["playerSurrender",false]) then {
	_obj = _unit getVariable["attachedObject",objNull];
	detach _unit;
	deleteVehicle _obj;
	[[_unit,"AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon","playNow"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	[[_unit,"AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon","switch"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	_unit setVariable["playerSurrender",nil,true];
	_unit setVariable["attachedObject",nil,true];
} else {
	_posATL = getPosATL _unit;
	_obj = "Land_ClutterCutter_small_F" createVehicle (_posATL);
	_obj setPosATL (_posATL);
	_obj setDir (direction _unit);
	_unit attachTo [_obj,[0,0,0]];
	_unit playMove "AmovPercMstpSsurWnonDnon";
	_unit setVariable["playerSurrender",true,true];
	_unit setVariable["attachedObject",_obj,true];
};

