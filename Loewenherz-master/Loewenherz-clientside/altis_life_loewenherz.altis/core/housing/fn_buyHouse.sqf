#include <macro.h>
/*
    File: fn_buyHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,ObjNull,[ObjNull]];
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if (_house getVariable ["house_owned",false]) exitWith {hint localize "STR_House_alreadyOwned";};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!license_civ_home) exitWith {hint localize "STR_House_License"};
if(count lhm_houses >= (__GETC__(lhm_houseLimit))) exitWith {hint format[localize "STR_House_Max_House",__GETC__(lhm_houseLimit)]};
closeDialog 0;

_houseCfg = [(typeOf _house)] call lhm_fnc_houseConfig;
if(count _houseCfg isEqualTo 0) exitWith {};

_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call lhm_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;


if (_action) then {
	if(lhm_atmcash < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	lhm_atmcash = lhm_atmcash - (_houseCfg select 0);
	[[_uid,_house],"TON_fnc_addHouse",false,false] call lhm_fnc_mp;
    
    [1] call SOCK_fnc_updatePartial;
/*
    if (lhm_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
        if (lhm_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
            advanced_log = format ["bought a house for $%1. Bank Balance: $%2  On Hand Cash: $%3",[(SEL(_houseCfg,0))] call lhm_fnc_numberText,[BANK] call lhm_fnc_numberText,[CASH] call lhm_fnc_numberText];
        } else {
            advanced_log = format ["%1 - %2 bought a house for $%3. Bank Balance: $%4  On Hand Cash: $%5",profileName,(getPlayerUID player),[(SEL(_houseCfg,0))] call lhm_fnc_numberText,[BANK] call lhm_fnc_numberText,[CASH] call lhm_fnc_numberText];
            };
        publicVariableServer "advanced_log";
    };
*/
    _house setVariable ["house_owner",[_uid,profileName],true];
    _house setVariable ["locked",true,true];
    _house setVariable ["containers",[],true];
    _house setVariable ["uid",floor(random 99999),true];

	lhm_vehicles pushBack _house;
	lhm_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
	[format ["<t color='#ff0000' size = '.8'>Du hast ein Haus vom Typ  '%1'  fuer %2 $ gekauft!</t>",getText (configFile >> "CfgVehicles" >> typeOf _house >> "displayName"),[(_houseCfg select 0)] call lhm_fnc_numberText],-1,-1,5,1,0,789] spawn BIS_fnc_dynamicText;
};