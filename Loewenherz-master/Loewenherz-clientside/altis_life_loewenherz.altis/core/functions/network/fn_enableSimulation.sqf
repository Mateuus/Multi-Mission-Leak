/*
	File: fn_enableSimulation.sqf
	Author: Barney
	
	Description:
	Simulation Things
	_this select 0 = Object
	_this select 1 = Status
	
	
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
private["_object","_status"];
_object = _this select 0;
_status = _this select 1;

 _object enableSimulation _status;
