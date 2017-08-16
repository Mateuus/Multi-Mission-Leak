/*
	File: fn_checkPlayerCharges.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Sends a request to a player to obtain their current charges
*/
private["_display","_text","_units","_charge","_chargeStr"];

_unit = lbData [2666,lbCurSel 2666];
_unit = call compile format["%1",_unit];

DS_setCharge = _unit;

closeDialog 0;
createDialog "setwanted";
disableSerialization;