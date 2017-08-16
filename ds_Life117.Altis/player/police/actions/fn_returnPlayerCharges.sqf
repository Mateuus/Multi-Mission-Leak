/*
	File: fn_returnPlayerCharges.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	returns players charges back to sender
*/
private["_cop","_text","_units","_charge","_chargeStr"];

_cop = _this select 0;

[[DS_wanted_stats,DS_civRecords],"DS_cop_displayPlayerCharges",_cop,false] spawn DS_fnc_MP;

