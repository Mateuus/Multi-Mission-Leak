#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg","_blacklist","_bad"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;
_scrptname = "houseadd";
_bad = false;

_blacklist = [
	[3571.11,13617.7,0.0199618], //präsidentenvilla
	[7383.74,12300.6,-0.020607]	 //jagdhütte west
];

{
	if(_house == (nearestBuilding _x)) exitWith {_bad = true};
} foreach _blacklist;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(_bad) exitWith {hint "Dieses Haus ist leider nicht kaufbar."};
if(_house isKindOF "Land_i_House_Small_03_V1_F") exitWith {hint "Dieses Haus ist vorübergehend nicht zu kaufen."};
if!(_house getVariable["house_owner",[]] isEqualTo []) exitWith {hint "Dieses Haus wurde bereits gekauft."};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!license_civ_home) exitWith {hint localize "STR_House_License"};
if(count life_houses >= (__GETC__(life_houseLimit))) exitWith {hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format["Diese Immobilie kostet dich %1. Sie unterstützt %2 Lagerplätze.",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_beatbankgeld < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	titleText["Haus gekauft!","PLAIN DOWN"];
	hint "Das Haus gehört nun dir. Du kannst deine Abenteuer nun auch von hier aus starten!";
	[_uid,_house,_scrptname] remoteExec ["SOA_fnc_addHouse",2];
	_house setVariable["house_owner",[_uid,profileName],true];
	_house setVariable["locked",true,true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["containers",[],true];
	_house setVariable["uid",round(random 99999),true];
	life_beatbankgeld = life_beatbankgeld - (_houseCfg select 0);
	life_vehicles pushBack _house;
	life_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};

	[1] call SOCK_fnc_UpdatePartial;
};
