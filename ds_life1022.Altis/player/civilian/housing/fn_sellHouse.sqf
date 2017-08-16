/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sells ones house
*/

private ["_owner","_infoArray","_action","_index","_numOfDoors"];

if(DS_doingStuff)exitwith{hint "You have either too recently sold this property, or you are bugged. Wait 1 minute or relog to fix"};

params [["_house",objNull,[objNull]]];

if(isNull _house)exitWith{};
if(!(_house isKindOf "House_F"))exitWith{};

_owner = _house getVariable ["house_owner",""];

if(_house getVariable ["house_sold",false])exitWith{hint "This house has already been sold"};
if(!((getPlayerUID player) isEqualTo (_owner select 0)))exitWith{hint "Only the property owner can sell it"};
_infoArray = [(typeOf _house)] call DS_civ_houseInfo;

_action = [
	format ["This property will sell for $%1, would you like to continue with the sale?",[((_infoArray select 0)/2)] call DS_fnc_numberText],
	"Sell This Property",
	"Sell",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

closeDialog 0;

[(getPlayerUID player),_house] remoteExec ["HUNT_fnc_sellHouse",2];

DS_doingStuff = true;
sleep 5;
DS_doingStuff = false;

_house setVariable ["house_owner",[nil,nil],true];
_house setVariable ["locked",false,true];
//_house setVariable ["HID",nil,true];
_house setVariable ["house_owned",false,true];
_house setVariable ["house_sold",true,true];

_index = DS_keyRing find _house;
if(!(_index isEqualTo -1))then{DS_keyRing deleteAt _index;};

_numOfDoors = getNumber (configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_house setVariable [format ["bis_disabled_Door_%1",_i],0,true];
};

[((_infoArray select 0)/2),true,true] call DS_fnc_handleMoney;
[] call DS_fnc_compileData;

{
	deleteMarker _x;
} forEach DS_houseMarkers;

{
	if(((getPos _house) distance _x) < 5)then {
		_index = DS_houses find _x;
		if(!(_index isEqualTo -1))then{DS_houses deleteAt _index;};
	};
} forEach DS_houses;

[] spawn DS_civ_houseMarkers;