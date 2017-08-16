#include "..\..\script_macros.hpp"
/*
    File: fn_sellHouse.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Sells the house and delete all container near house.
*/
private ["_house","_uid","_action","_houseCfg"];
_house = param [0,objNull,[objNull]];
_uid = getPlayerUID player;

if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};
if (isNil {_house getVariable "house_owner"}) exitWith {hint localize "STR_House_noOwner";};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if (count _houseCfg isEqualTo 0) exitWith {};

_action = [
    format [localize "STR_House_SellHouseMSG",
    (round((_houseCfg select 0)/2)) call life_fnc_numberText,
    (_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
    _house setVariable ["house_sold",true,true];

    [_house] remoteExecCall ["TON_fnc_sellHouse",RSERV];

    _house setVariable ["locked",false,true];
    deleteMarkerLocal format ["house_%1",_house getVariable "uid"];
    _house setVariable ["uid",nil,true];

    BANK = BANK + (round((_houseCfg select 0)/2));
    [1] call SOCK_fnc_updatePartial;
    _index = life_vehicles find _house;


    if (_index != -1) then {
        life_vehicles deleteAt _index;
    };

    _index = [str(getPosATL _house),life_houses] call TON_fnc_index;
    if (_index != -1) then {
        life_houses deleteAt _index;
    };
    _numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house), "numberOfDoors");
    for "_i" from 1 to _numOfDoors do {
        _house setVariable [format ["bis_disabled_Door_%1",_i],0,true];
    };
    _containers = _house getVariable ["containers",[]];
    if (count _containers > 0) then {
        {
            _x setVariable ["Trunk",nil,true];
			[_x] remoteExecCall ["TON_fnc_sellHouseContainer",RSERV];
        } forEach _containers;
    };
    _house setVariable ["containers",nil,true];
	
	_log = format["%1 (%2) hat ein Haus (Position: %3) für %4$ verkauft.", player getVariable["realname", name player], getPlayerUID player, getPosATL _house, [(round((_houseCfg select 0)/2))]call life_fnc_numberText];
	["HOUSE_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];
};
