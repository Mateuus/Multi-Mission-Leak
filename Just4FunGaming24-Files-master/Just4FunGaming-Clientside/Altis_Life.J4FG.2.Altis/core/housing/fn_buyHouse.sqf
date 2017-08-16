// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_house","_uid","_action","_houseCfg","_housec"];

_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_uid = getPlayerUID player;

closeDialog 0;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if( !((_house getVariable["house_owner", []]) isEqualTo []) ) exitWith {
    hint "Das Haus ist schon verkauft..."
};
if(_house getVariable ["house_sold", false] ) exitWith {
    hint localize "STR_House_Sell_Process"
};
if( !license_civ_home ) exitWith {
    hint localize "STR_House_License"
};

_houseCfg = [typeOf _house] call XY_fnc_houseConfig;
if( _houseCfg isEqualTo [] ) exitWith {};

private _count = 0;

private _isGarage = ((typeOf _house) in ["Land_i_Garage_V1_F", "Land_i_Garage_V2_F"]);

{
    if( _x isKindOf "House_F" && { ((_x getVariable["house_owner", [""]]) select 0) isEqualTo (getPlayerUID player) } ) then {
        if( ((typeOf _x) in ["Land_i_Garage_V1_F", "Land_i_Garage_V2_F"]) isEqualTo _isGarage ) then {
            _count = _count + 1;
        };
    };
} forEach XY_vehicles;

private _price = (_houseCfg select 0) * ( 1 + (_count * 0.3));

_action = [
	format[
            localize "STR_House_BuyMSG",
            [_price] call XY_fnc_numberText,
            _houseCfg select 1
        ],
        localize "STR_House_Purchase",
        localize "STR_Global_Buy",
        localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if( !_action ) exitWith {};

if( _price > XY_CA + XY_CC ) exitWith {
    hint localize "STR_House_NotEnough";
};

[player, _house, _price] remoteExec ["XY_fnc_addHouse", 2];