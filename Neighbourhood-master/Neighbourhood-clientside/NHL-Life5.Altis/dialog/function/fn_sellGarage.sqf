#include <macro.h>
/*
File: fn_sellGarage.sqf
Author: Bryan "Tonic" Boardwine

Description:
Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(playerSide == west) exitWith {hint "Du willst doch nicht ernsthaft deinen Dienstwagen verkaufen...."};
if(playerSide == independent) exitWith {hint "Du willst doch nicht ernsthaft deinen Dienstwagen verkaufen...."};
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
//if (life_action_inUse) exitWith{}; // prevent duping

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if((time - life_action_delay) < 1.5) exitWith {hint "Nicht so schnell kleiner.... So viele Autos möchte ich nicht kaufen!";};
//life_action_inUse = true; // duping fix
_price = [_vehicle,__GETC__(life_garage_sell)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};

[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;
hint format[localize "STR_Garage_SoldCar",[_price] call life_fnc_numberText];
life_atmcash = life_atmcash + _price;
sendlogfile = [format ["###### %1 verkauft Fahrzeug: %2 für %3$",name player,_vehicle,_price],"AUTOVERKAUFT"];
publicVariableServer "sendlogfile";
//life_action_inUse = false; // duping fix
life_action_delay = time;
closeDialog 0;