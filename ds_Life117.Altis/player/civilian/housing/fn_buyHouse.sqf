/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Buys the house the player is currently selected
*/
private ["_special","_price","_property","_propertyAmount","_infoArray","_action"];

_property = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_propertyAmount = (count(DS_houses));
_special = false;
if(_propertyAmount >= (DS_perkLevel + 1))exitwith
	{
	hint format ["You have reached the maximun amount of propertys that you can own with your current perk level\n\nPerk Level %1\nHouse Limit %2",DS_perkLevel,(DS_perkLevel + 1)];
	};

if(isNull _property) exitWith {};
if(!(_property isKindOf "House_F")) exitWith {};
if(_property in server_houseArray)exitwith{hint "This house is already owned"};
if(_property getVariable ["house_owned",false])exitwith{hint "This house is already owned"};
if(_property distance shawn1 < 3000)exitwith{hint "Houses can not be purchased this close to the Rebel KOS Zone"};
_infoArray = [(typeOf _property)] call DS_civ_houseInfo;

_price = (_infoArray select 0);
if((_property distance gangFlag1 < 200)||(_property distance gangFlag2 < 200)||(_property distance gangFlag3 < 200))then
	{
	_special = true;
	_price = _price*4;
	};
if((_property distance shawn1 < 2500)||(_property distance reb_1_1 < 1200)||(_property distance reb_1_1_2 < 1200))then
	{
	_special = true;
	_price = _price*8;
	};
if(_property distance hosp1_1_1_3_1 < 1000)then
	{
	_special = true;
	_price = _price*16;
	};

if(_special)then
	{
	_special = false;
	_action = [
	format ["This house is in a special location, because of this its buy price is $%1",[_price] call DS_fnc_numberText,(_infoArray select 1)],
	"Special Locations",
	"Buy",
	"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_special = true;};
	};
if(_special)exitwith{};
	
_action = [
	format ["Would you like to buy this house for $%1? Fully upgraded it has %2 storage slots",[_price] call DS_fnc_numberText,(_infoArray select 1)],
	"Buy This Property",
	"Buy",
	"Cancel"
] call BIS_fnc_guiMessage;

if(!_action)exitwith{};
if([_price,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to cover this purchase"};
[_price,true,false] call DS_fnc_handleMoney;
hint format ["You have bought this house for $%1, press U on its doors to unlock it and windows key to interact with it",[_price] call DS_fnc_numberText];
closeDialog 0;
[[(getPlayerUID player),_property],"HUNT_fnc_buyHouse",false,false] spawn BIS_fnc_MP;
_property setVariable["house_owner",[(getPlayerUID player),profileName],true];
_property setVariable["locked",true,true];
//_property setVariable["HID",round(random 99999),true];
_property setVariable["house_owned",true,true];
DS_keyRing pushBack _property;
DS_houses pushBack (getPosATL _property);
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _property) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do 
		{
		_property setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};
[] call DS_civ_houseMarkers;
[] call DS_fnc_compileData;












