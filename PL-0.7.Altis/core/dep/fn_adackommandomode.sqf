/*---------------------------------------------------------------------------
	File: fn_adacKommandoMode.sqf
	Author: Skrow & Skyfezzer
	
	Description:
	Notifies the repair man that someone has requested ADAC and prompts them
	if they want to take the request or not.
---------------------------------------------------------------------------*/
	
private["_mode","_totenliste","_display"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;

disableSerialization;
_display = findDisplay 13625;
_totenliste = lbData[13626,lbCurSel (13626)];

_totenliste = call compile format["%1", _totenliste];
//hint format ["adacliste %1",_totenliste];
if(isNil "_totenliste") exitwith {};
if(isNull _totenliste) exitWith {};
switch (_mode) do {

case 1:
{
[[1,profileName],"life_fnc_adacnotiz",_totenliste,false] spawn life_fnc_MP;
};
case 2: 
{
[[2],"life_fnc_adacnotiz",_totenliste,false] spawn life_fnc_MP;
};

};

closeDialog 0;