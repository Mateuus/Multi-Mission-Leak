/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sells ones house
*/
private ["_property","_owner","_infoArray","_action"];
if(DS_doingStuff)exitwith{hint "You have either too recently sold this property, or you are bugged. Wait 1 minute or relog to fix"};
_property = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_owner = _property getVariable["house_owner",""];
if(_property getVariable ["house_sold",false])exitwith{hint "This house has already been sold"};
if((getPlayerUID player) != (_owner select 0))exitwith{hint "Only the property owner can sell it"};
_infoArray = [(typeOf _property)] call DS_civ_houseInfo;
_action = [
	format ["This property will sell for $%1, would you like to continue with the sale?",[((_infoArray select 0)/2)] call DS_fnc_numberText],
	"Sell This Property",
	"Sell",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
closeDialog 0;
[[(getPlayerUID player),_property],"HUNT_fnc_sellHouse",false,false] spawn BIS_fnc_MP;
DS_doingStuff = true;
sleep 5;
DS_doingStuff = false;
_property setVariable["house_owner",[nil,nil],true];
_property setVariable["locked",false,true];
_property setVariable["HID",nil,true];
_property setVariable["house_owned",false,true];
_property setVariable["house_sold",true,true];
DS_keyRing = DS_keyRing - [_property];
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _property) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do 
		{
		_property setVariable[format["bis_disabled_Door_%1",_i],0,true];
		};
[((_infoArray select 0)/2),true,true] call DS_fnc_handleMoney;
[] call DS_fnc_compileData;
{
	deleteMarker _x;
}forEach DS_houseMarkers;
{
	if(((getPos _property) distance _x) < 5)then
		{
		DS_houses = DS_houses - [_x];
		};
}forEach DS_houses;
[] spawn DS_civ_houseMarkers;




















