/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Buys the house the player is currently selected
*/

private ["_specialInfo","_houseAmountLimit","_special","_price","_house","_houseAmount","_infoArray","_action"];

params [["_house",objNull,[objNull]]];

if(isNull _house)exitWith{};
if(!(_house isKindOf "House_F"))exitWith{};

_houseAmount = (count (DS_houses));
_special = false;
_houseAmountLimit = 2;
if(DS_perkLevel > 2)then{_houseAmountLimit = _houseAmountLimit + 2};
if((DS_infoArray select 13) > 48)then{_houseAmountLimit = _houseAmountLimit + 2;};
if(_houseAmount >= _houseAmountLimit)exitWith {
	hint "You have reached the maximum amount of houses you can buy. \n\nYou can buy 2 house until you are perk level 3\n\nYou can then buy a 2 more houses when you are at perk level 3\n\nYou can also complete the house quest in the civilian quest line to be able to buy an extra 2 houses for a total of 6 possible houses";
};

if(_house in server_houseArray)exitWith{hint "This house is already owned"};
if(_house getVariable ["house_owned",false])exitWith{hint "This house is already owned"};
if(_house distance shawn1 < 3000)exitWith{hint "Houses can not be purchased this close to the Rebel KOS Zone"};
if((_house distance fortknoxweapons4 < 600)||(_house distance baseClan21 < 30)||((_house distance (getMarkerPos "hospital_3")) < 300))exitWith{hint "Houses can not be purchased in this area"};
if((_house distance (getMarkerPos "bankDoor") < 300))exitWith{hint "Houses can not be purchased this close to the bank"};

_infoArray = [(typeOf _house)] call DS_civ_houseInfo;
_price = (_infoArray select 0);
if((_house distance gangFlag1 < 500)||(_house distance gangFlag2 < 500)||(_house distance gangFlag3 < 500))then {
	_special = true;
	_price = _price*6;
};
if(_house distance (getMarkerPos "auctionHouse_1") < 1200)then {
	_special = true;
	_price = _price*16;
};

if(_special)then {
	_special = false;

	_action = [
		format ["This house is in a special location, because of this its buy price is $%1",[_price] call DS_fnc_numberText,(_infoArray select 1)],
		"Special Locations",
		"Buy",
		"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitWith{_special = true;};
};
if(_special)exitWith{};

_action = [
	format ["Would you like to buy this house for $%1? Fully upgraded it has %2 storage slots.",[_price] call DS_fnc_numberText,(_infoArray select 1)],
	"Buy This Property",
	"Buy",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

if([_price,true] call DS_fnc_checkMoney)exitWith{hint "You do not have enough money in your bank to cover this purchase"};
[_price,true,false] call DS_fnc_handleMoney;
hint format ["You have bought this house for $%1, press U on its doors to unlock it and windows key to interact with it",[_price] call DS_fnc_numberText];
closeDialog 0;
[(getPlayerUID player),_house] remoteExec ["HUNT_fnc_buyHouse",2];

_house setVariable ["house_owner",[(getPlayerUID player),profileName],true];
_house setVariable ["locked",true,true];
//_house setVariable ["HID",round(random 99999),true];
_house setVariable ["house_owned",true,true];

DS_keyRing pushBack _house;
DS_houses pushBack (getPosATL _house);

_numOfDoors = getNumber (configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_house setVariable [format ["bis_disabled_Door_%1",_i],1,true];
};

[] call DS_civ_houseMarkers;
[] call DS_fnc_compileData;