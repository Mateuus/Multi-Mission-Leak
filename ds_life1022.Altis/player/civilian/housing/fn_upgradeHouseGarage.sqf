/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Upgrades a house for an added garage
*/

private ["_infoArray","_garagePrice","_action"];

params [["_house",objNull,[objNull]]];

if(isNull _house)exitWith{};
if(!(_house isKindOf "House_F"))exitWith{};

DS_doingStuff = true;

_infoArray = [typeOf _house] call DS_civ_houseInfo;
_garagePrice = round((_infoArray select 0)/2);
if(_garagePrice > 2500000)then{_garagePrice = 2500000};
if(_house getVariable ["garage",false])exitWith{hint "This property already has this upgrade";DS_doingStuff = false;};

_action = [
	format ["Adding a garage to this property will cost $%1, this will enable you to retrieve and store vehicles here",[_garagePrice] call DS_fnc_numberText],
	"Upgrade House",
	"Add Garage",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{DS_doingStuff = false;};

if([_garagePrice,true] call DS_fnc_checkMoney)exitWith{hint "You do not have enough money in your bank to cover this cost";closeDialog 0;DS_doingStuff = false;};
[_garagePrice,true,false] call DS_fnc_handleMoney;

hint "Your house has been upgraded!";

[_house,false,true] remoteExec ["HUNT_fnc_updateHouseUpgrade",2];
sleep 10;
DS_doingStuff = false;