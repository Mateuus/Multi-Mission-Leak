#include <macro.h>
private["_vehicle","_vid","_pid","_unit","_sellPrice"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_Noselection"};
if((life_nottoofast != 0) && ((time - life_nottoofast) < 2)) exitWith {hint "TU T'ES PRIS POUR FLASH !!! Merci de ralentir un peu...";};
life_nottoofast = time;
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_selection_Error"};
_sellPrice = [_vehicle,GETC(ANL_vehicules)] call TON_fnc_index;
if(_sellPrice == -1) then {_sellPrice = 1000;} else {_sellPrice = (GETC(ANL_vehicules) select _sellPrice) select 2;};
[[_vid,_pid,_sellPrice,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;
hint format[localize "STR_Garage_SoldCar",[_sellPrice] call life_fnc_numberText];
compte_banque = compte_banque + _sellPrice;
closeDialog 0;