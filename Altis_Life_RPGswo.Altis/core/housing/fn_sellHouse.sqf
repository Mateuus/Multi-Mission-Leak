#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine Modified by: Sink(Al Morise) & Division Wolf e.V.
	
	Description:
	Sells the house?
*/
private["_house","_uid","_action","_houseCfg","_securityLvl","_ownerID"];
_house = param [0,ObjNull,[ObjNull]];
_uid = getPlayerUID player;

if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};
if (isNil {_house getVariable "house_owner"}) exitWith {hint "Für dieses Haus gibt es keinen Besitzer"};

_ownerID = ((_house getVariable ["house_owner",[0,0]]) select 0);
if ( _ownerID != getPlayerUID player) exitWith {hint "Dieses Haus gehört nicht dir! Du kannst nur deine eigenen Häuser verkaufen"};

if (_house getVariable["house_sold",false]) exitWith {hint "Dieses Haus wurde bereits Verkauft";};
closeDialog 0;

_houseCfg = [(typeOf _house)] call DWEV_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};
_securityLvl = _house getVariable "house_security";

_action = [	
	format["Bist du sicher, dass du das Haus verkaufen möchtes? Du bekommst dafür: <t color='#8cff9b'>%1€</t>",
	(round((_houseCfg select 0)/ 5)*(1 max (_securityLvl-2))) call DWEV_fnc_numberText,
	(_houseCfg select 1)],"Haus Verkaufen","Verkaufen","Abbrechen"
] call BIS_fnc_guiMessage;
	
if(_action) then
{
	if(isNil "DWEV_house_inUse") then {DWEV_house_inUse = time-301;};
	if(DWEV_house_inUse+(300) >= time) exitWith {closeDialog 0;hint format["Du kannst nur alle 5 Minuten ein Haus verkaufen, nächstes in %1:%2",4 - floor ((time - DWEV_house_inUse) / 60),59 - round (time - DWEV_house_inUse - (floor ((time - DWEV_house_inUse) / 60)) * 60)];};
	_house setVariable["house_sold",true,true];
	[_house] remoteExec ["DWF_fnc_sellHouse",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	_house setVariable["locked",false,true];
	_house setVariable["Trunk",nil,true];
	_house setVariable["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable["uid",nil,true];
	dwf_atmcash = dwf_atmcash + (round((_houseCfg select 0)/5)*(1 max (_securityLvl-2)));
	_house setVariable["house_security",0,true];
	
	[7,player,"verkauf",format ["%1 für %2 € - Bargeld. %3 € Bankkonto. %4 €",typeof(_house),[(round((_houseCfg select 0)/5)*(1 max (_securityLvl-2)))] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

	[1] call SOCK_fnc_updatePartial;
	
	closeDialog 0;
	DWEV_house_inUse = time;
	_index = DWEV_vehicles find _house;
	
	if(_index != -1) then 
	{
		DWEV_vehicles set[_index,-1];
		DWEV_vehicles = DWEV_vehicles - [-1];
	};
	
	_index = [str(getPosATL _house),DWEV_houses] call DWF_fnc_index;
	
	if(_index != -1) then
	{
		DWEV_houses set[_index,-1];
		DWEV_houses = DWEV_houses - [-1];
	};
	
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do
	{
		_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};
};