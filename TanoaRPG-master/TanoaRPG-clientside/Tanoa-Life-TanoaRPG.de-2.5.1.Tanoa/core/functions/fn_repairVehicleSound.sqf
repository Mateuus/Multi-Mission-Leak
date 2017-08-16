/*
	File: fn_RepairVehicleSound.sqf
*/
private["_source","_rate"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _source) exitWith {};
_rate = 4;

while {_source getVariable ["Reparing", false] && (_rate > 0)} do
{
	_source say3D "Car_Repair";
	_rate = _rate - 1;
	sleep 5.0;
};