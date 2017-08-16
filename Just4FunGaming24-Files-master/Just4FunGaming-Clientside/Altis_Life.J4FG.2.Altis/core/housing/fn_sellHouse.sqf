// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_house","_uid","_action","_houseCfg"];

_house = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param;

_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if( _house getVariable ["house_owner", [] ] isEqualTo [] ) exitWith {
    hint "Das Haus hat keinen Besitzer";
};
closeDialog 0;

_houseCfg = [(typeOf _house)] call XY_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_price = round((_houseCfg select 0) / 2);

_action = [
	format[
            localize "STR_House_SellHouseMSG",
            [_price] call XY_fnc_numberText,
            _houseCfg select 1
        ],
    localize "STR_pInAct_SellHouse", 
    localize "STR_Global_Sell", 
    localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if( !_action ) exitWith {};

hint "Verkaufe Haus...";
[_house, player, _price] remoteExec ["XY_fnc_removeHouse", 2];