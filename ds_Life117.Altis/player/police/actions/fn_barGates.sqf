/*
	File: fn_wantedlist
	Author: Shawn "Huntah" Macgillivray
	
	Description:
Opens nearby bargates
	*/
private["_nearestGate","_gates"];

_gates = nearestObjects [getPos player, ["Land_BarGate_F"], 50]; 
if(_gates isEqualTo [])exitwith{};
_nearestGate = _gates select 0;
if(DS_openGate)then
	{
	_nearestGate animate ["Door_1_rot", 0];
	}
	else
	{
	_nearestGate animate ["Door_1_rot", 1];
	};
DS_openGate = !DS_openGate;