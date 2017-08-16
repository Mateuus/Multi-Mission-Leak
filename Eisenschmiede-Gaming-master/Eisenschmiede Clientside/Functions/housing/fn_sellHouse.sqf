#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,ObjNull,[ObjNull]];
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "house_owner"}) exitWith {hint "There is no owner for this house."};
closeDialog 0;

_houseCfg = [(typeOf _house)] call ES_fnc_houseConfig;
if(EQUAL(count _houseCfg,0)) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round(SEL(_houseCfg,0)/2)) call ES_fnc_numberText,
	SEL(_houseCfg,1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	_house setVariable ["house_sold",true,true];
	[_house] remoteExec ["ES_fnc_sellHouse",2];
	_house setVariable ["locked",false,true];
	_house setVariable ["Trunk",nil,true];
	_house setVariable ["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable ["uid",nil,true];
	
	ES_atmbank = ES_atmbank + (round((_houseCfg select 0)/2));
	_index = ES_vehicles find _house;
	
	if(_index != -1) then {
		ES_vehicles set[_index,-1];
		ES_vehicles = ES_vehicles - [-1];
	};
	
	_index = [str(getPosATL _house),ES_houses] call ES_fnc_index;
	if(_index != -1) then {
		ES_houses set[_index,-1];
		ES_houses = ES_houses - [-1];
	};
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");

	for "_i" from 1 to _numOfDoors do {
		_house setVariable [format["bis_disabled_Door_%1",_i],0,true];
	};
};
