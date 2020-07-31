#include <macro.h>
/*
	
	
	Description:
	Sells the house?
*/

private["_house","_uid","_action","_houseCfg"];
_house = param [0,ObjNull,[ObjNull]];
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "house_owner"}) exitWith {hint "Nie ma wlasciciela tego domu."};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg isEqualTo 0) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round((_houseCfg select 0)/2)) call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	_house setVariable["house_sold",true,true];
	[_house] remoteExecCall ["TON_fnc_sellHouse",(call life_fnc_HCC)];
	_house setVariable["locked",false,true];
	_house setVariable["Trunk",nil,true];
	_house setVariable["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable["uid",nil,true];
	
	["bank","add",(round((_houseCfg select 0)/2))] call life_fnc_handleCash; 
	_index = life_vehicles find _house;
	if(_index != -1) then {
		life_vehicles set[_index,-1];
		life_vehicles = life_vehicles - [-1];
	};
	
	_index = [str(getPosATL _house),life_houses] call fnc_index;
	if(_index != -1) then {
		life_houses set[_index,-1];
		life_houses = life_houses - [-1];
	};
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};
};
