#include "..\..\macros.hpp"
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_multiplier","_purchasePrice","_vehicleLife"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint "Du hast nichts ausgewählt."};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
closeDialog 0;

if(isNil "_vehicle") exitWith {hint "Die Auswahl hat einen Fehler..."};
if(isNil "DWEV_cgar_inUse") then {DWEV_cgar_inUse = time-301;};
if(DWEV_cgar_inUse+(300) >= time) exitWith {closeDialog 0;hint format["Du kannst nur alle 5 Minuten ein Fahrzeug verkaufen, nächstes in %1:%2",4 - floor ((time - DWEV_cgar_inUse) / 60),59 - round (time - DWEV_cgar_inUse - (floor ((time - DWEV_cgar_inUse) / 60)) * 60)];};

_action = ["Bist du sicher, dass du das Fahrzeug verkaufen möchtest?</t>","Fahrzeug Verkaufen","Verkaufen","Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith { closeDialog 0;  };

if((DWEV_cgar_inUse+(300) >= time)) then
	{
		hint format["Du kannst nur alle 5 Minuten ein Fahrzeug verkaufen, nächstes in %1:%2",4 - floor ((time - DWEV_cgar_inUse) / 60),59 - round (time - DWEV_cgar_inUse - (floor ((time - DWEV_cgar_inUse) / 60)) * 60)];
		closeDialog 0;
	}
else
	{
		closeDialog 0;
		_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
		
		switch (playerSide) do
		{
			case civilian:
			{
				_multiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
				_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
			};
			case west:
			{
				_multiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
				_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
			};
			case independent:
			{
				_multiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
				_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
			};
			case east:
			{
				_multiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
				_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
			};
		};

		_price = _purchasePrice * _multiplier;
		
		if (!(_price isEqualType 0) || _price < 1) then {_price = 111111;};
		
		[_vid,_pid,_price,player,DWEV_garage_type] remoteExec ["DWF_fnc_vehicleDelete",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		hint format["Du verkaufst dein Fahrzeug für %1€",[_price] call DWEV_fnc_numberText];

		[1,player,"verkauf",format ["%1 für %2 € - Bargeld. %3 € Bankkonto. %4 €",_vehicle,[_price] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

		dwf_atmcash = dwf_atmcash + _price;
		[1] call SOCK_fnc_updatePartial;

		closeDialog 0;
		DWEV_cgar_inUse = time;
	};