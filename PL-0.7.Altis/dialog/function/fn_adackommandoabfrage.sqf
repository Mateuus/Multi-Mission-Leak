/*---------------------------------------------------------------------------
	File: fn_adacKommandoAbfrage.sqf
	Auteur: Skrow & Skyfezzer
---------------------------------------------------------------------------*/

private["_display","_text","_adacliste","_btn","_name"];
disableSerialization;
_display = findDisplay 13625;
_text = _display displayCtrl 13629;
_adacliste = lbData[13626,(lbCurSel 13626)];

_adacliste = call compile format["%1", _adacliste];
//hint format ["_adacliste %1",_adacliste];
if(isNil "_adacliste") exitwith {};
	if(isNull _adacliste) exitWith {};

		_btn = _adacliste getvariable["adacweg",false];
		if(_btn) then {

			ctrlShow[13628,true]; ctrlShow[13627,false];
			_name = _adacliste getvariable["adacname",-1];
			_text ctrlSetStructuredText parseText format["<t size='1'><br/>Le dépanneur est en route: <br/>%1 </t>",_name];
		} else{
		_text ctrlSetStructuredText parseText format[""];
		ctrlShow[13628,false]; ctrlShow[13627,true];

};