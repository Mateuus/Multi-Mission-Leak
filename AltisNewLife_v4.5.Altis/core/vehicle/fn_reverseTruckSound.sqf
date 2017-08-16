#include <macro.h>
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(isNil {_vehicle GVAR "reverse"}) exitWith {};
while {true} do
{
	if(!(_vehicle GVAR "reverse")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle SVAR["reverse",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D "reverse_truck";
	uiSleep 2.56;
	if(isNull driver _vehicle) then { _vehicle SVAR["reverse",false,true]};
	if(!(_vehicle GVAR "reverse")) exitWith {
		life_truckreverse_active = false;
	};
};