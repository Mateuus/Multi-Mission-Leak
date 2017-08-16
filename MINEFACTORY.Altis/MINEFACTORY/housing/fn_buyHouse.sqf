#include "..\..\script_macros.hpp"
/*
	File: fn_buyHouse.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,ObjNull,[ObjNull]];
_uid = steamid;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house GVAR ["house_owned",false])) exitWith {hint "This house is already owned even though you shouldn't be seeing this hint..."};
if(!isNil {(_house GVAR "house_sold")}) exitWith {hint  "Dieses Haus wurde vor Kurzem verkauft."};
if(!license_civ_home) exitWith {hint  "Du hast keine Eigentumsurkunde!"};
if(count life_houses >= (LIFE_SETTINGS(getNumber,"house_limit"))) exitWith {hint format[ "Du darfst nur %1 Häuser zugleich besitzen.",LIFE_SETTINGS(getNumber,"house_limit")]};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(EQUAL(count _houseCfg,0)) exitWith {};

_action = [
	format[ "Dieses Haus gibt es für <t color='#8cff9b'>$%1</t><br/> Es unterstützt %2 Lagerbox(en)",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)], "Haus kaufen", "Kaufen", "Abbrechen"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(BANK < (_houseCfg select 0)) exitWith {hint format [ "Du hast nicht genug Geld!"]};
	SUB(BANK,(SEL(_houseCfg,0)));
	
	if(life_HC_isActive) then {
		[_uid,_house] remoteExec ["HC_fnc_addHouse",HC_Life];
	} else {
		[_uid,_house] remoteExec ["TON_fnc_addHouse",RSERV];
	};
	
	_house SVAR ["house_owner",[_uid,profileName],true];
	_house SVAR ["locked",true,true];
	_house SVAR ["containers",[],true];
	_house SVAR ["uid",floor(random 99999),true];

	life_vehicles pushBack _house;
	life_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house GVAR "uid")],getPosATL _house];
	_houseName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _house), "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _house),"numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house SVAR [format["bis_disabled_Door_%1",_i],1,true];
	};
};
