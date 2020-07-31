#include <macro.h>
/*
	File: fn_sellGarage.sqf
	
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];

disableSerialization;
if(lbCurSel 2802 isEqualTo -1) exitWith {[localize "STR_Global_NoSelection", false] spawn domsg;};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
closeDialog 0;
if(life_dontsell isEqualTo 0) then {

	life_dontsell = 1;
	_dist = getpos player;
	_cancel = false;
	_selling = 15;
	while{_selling > 0} do {
		["Sprzedajesz pojazd - oddal sie od automatu aby anulowac!", false] spawn doquickmsg;

		if(_dist distance player > 5) exitwith { 
			hint "Anulowano.";
			_cancel = true; 
		};

		uiSleep 1;
		_selling = _selling - 1;
	};

	if(!_cancel) then {

		if(isNil "_vehicle") exitWith {[localize "STR_Garage_Selection_Error", false] spawn domsg;};

		_price = [_vehicle,__GETC__(life_garage_sell)] call fnc_index;
		if(_price isEqualTo -1 || side player == west) then {
			_price = 1000;
		} else {
			_price = (__GETC__(life_garage_sell) select _price) select 1;
		};

		[_vid,_pid,_price,player,life_garage_type] remoteExecCall ["TON_fnc_vehicleDelete",(call life_fnc_HCC)];

		life_dontsell = 0;

	};

} else {
	["Please wait before selling another vehicle!", false] spawn domsg;
};
