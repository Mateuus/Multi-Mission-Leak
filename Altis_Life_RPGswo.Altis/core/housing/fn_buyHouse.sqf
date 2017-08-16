#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg","_price"];
_house = param [0,ObjNull,[ObjNull]];
_uid = getPlayerUID player;
_exit = false;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house getVariable["house_owned",false])) exitWith {hint "Dieses Haus gehört schon jemanden"};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint "Dieses haus ist vor kurzem verkauft wurden, und ist noch in der Datenbank zur bearbeitung."};
if(!lc_home) exitWith {hint "Du hast keine Hauslizenz!"};
if ((__GETC__(DWEV_adminlevel)) < 4) then //Ab H
{
	if ((__GETC__(DWEV_donator)) > 0) then
	{
		if(count DWEV_houses >= (__GETC__(DWEV_donator))+1) exitWith {hint format["Du kannst nur %1 Häuser besitzen",__GETC__(DWEV_donator)+1]; _exit = true;};
	} 
	else
	{
		if(count DWEV_houses >= 2) exitWith {hint "Du kannst nur 2 Häuser besitzen"; _exit = true;};
	};
};

if (_exit) exitWith {closeDialog 0;};

closeDialog 0;

_houseCfg = [(typeOf _house)] call DWEV_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};
_price = (_houseCfg select 0);
if (actionSpendenziel2) then {_price = (_price*0.95);};
_action = [
	format["Das haus ist verfügbar für <t color='#8cff9b'>%1€</t><br/>Es unterstützt %2 Lagerkisten",
	[_price] call DWEV_fnc_numberText,
	(_houseCfg select 1)],"Haus Kaufen","Kaufen","Abbrechen"
] call BIS_fnc_guiMessage;

if(_action) then
{
	if(dwf_atmcash < _price) exitWith {hint format["Du hast nicht genug Geld! Kaufpreis vom Haus: %1",[_price] call DWEV_fnc_numberText];};
	[_uid,_house] remoteExec ["DWF_fnc_addHouse",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	_house setVariable["house_owner",[_uid,getMyName],true];
	_house setVariable["house_sold", true, true];
	_house setVariable["locked",true,true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["containers",[],true];
	_house setVariable["house_security",0,true];
	_house setVariable["uid",round(random 99999),true];
	dwf_atmcash = dwf_atmcash - _price;

	[7,player,"kauf",format ["%1 für %2 € - Bargeld. %3 € Bankkonto. %4 €",typeof(_house),[_price] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	
	[1] call SOCK_fnc_updatePartial;
	DWEV_vehicles pushBack _house;
	DWEV_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_tourism";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
};