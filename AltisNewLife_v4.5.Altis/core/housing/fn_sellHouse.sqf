#include <macro.h>
private["_house","_uid","_action","_houseCfg","_securityLvl"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = steamid;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "house_owner"}) exitWith {hint "Il n'y a pas de proprietaires."};
closeDialog 0;
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};
_securityLvl = 	_house getVariable "house_security";
_action = [
	format["Voulez vous vraiement vendre votre maison ? Prix de revente : <t color='#8cff9b'>%1€</t>",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],"Vendre votre maison","Vendre","Annuler"
] call BIS_fnc_guiMessage;

if(_action) then {
	_house SVAR["house_sold",true,true];
	[[_house],"TON_fnc_sellHouse",false,false] spawn life_fnc_MP;
	_house SVAR["locked",false,true];
	_house SVAR["Trunk",nil,true];
	_house SVAR["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house SVAR["uid",nil,true];
	compte_banque = compte_banque + (round((_houseCfg select 0)/ 1)*(1 max _securityLvl));
	_house setVariable["house_security",0,true];
	_index = life_vehicles find _house;
	if(_index != -1) then {
		life_vehicles set[_index,-1];
		life_vehicles = life_vehicles - [-1];
	};
	
	_index = [str(getPosATL _house),life_houses] call TON_fnc_index;
	if(_index != -1) then {
		life_houses set[_index,-1];
		life_houses = life_houses - [-1];
	};
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house SVAR[format["bis_disabled_Door_%1",_i],0,true];
	};
};
