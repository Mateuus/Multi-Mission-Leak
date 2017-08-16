#include "..\..\script_macros.hpp"
/*
    File: fn_sellHouseGarage.sqf
    Author: BoGuu
    Description:
    Sell functionality for house garages.
*/

private _house = param [0,objNull,[objNull]];
private _uid = getPlayerUID player;

if (isNull _house) exitWith {};
if !(_house getVariable ["garageBought",false]) exitWith {hint localize "STR_Garage_NotOwned";};
if ((_house getVariable "house_owner") select 0 != getPlayerUID player) exitWith {hint localize "STR_Garage_NotOwner";};
closeDialog 0;

private _sellPrice = LIFE_SETTINGS(getNumber,"houseGarage_sellPrice");

_action = [
    format [localize "STR_Garage_HouseSellMSG",_price],
    localize "STR_House_GarageSell",
    localize "STR_Global_Sell",
    localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
    [_uid,_house,1] remoteExec ["TON_fnc_houseGarage",RSERV];
    BANK = BANK + _sellPrice;
    [1] call SOCK_fnc_updatePartial;

    _house setVariable ["garageBought",false,true];
	
	_log = format["%1 (%2) hat eine Garage (Position: %3) für %4$ verkauft.", player getVariable["realname", name player], getPlayerUID player, getPosATL _house, [_sellPrice]call life_fnc_numberText];
	["HOUSE_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];

};