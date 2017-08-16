#include <macro.h>
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_Noselection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;
if(isNil "_vehicle") exitWith {hint "Il y a une erreur dans la sélection..."};
_price = [_vehicle,GETC(ANL_vehicules)] call TON_fnc_index;
if(_price == -1) then {_price = 9999999;} else {_price = (GETC(ANL_vehicules) select _price) select 3;};
if(compte_banque < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};
[[_vid,_pid,_unit,_price],"TON_fnc_InsureCar",false,false] spawn life_fnc_MP;
hint "Vous avez pris une assurance pour ce vehicule";
compte_banque = compte_banque - _price;
closeDialog 0;