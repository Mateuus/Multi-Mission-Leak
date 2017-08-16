/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];


if (!(airdrop_kiste getVariable["kiste_open",false])) exitWith {hint "Die kiste ist verschlossen du musst sie erst aufsprengen" };
if(dialog) exitWith {};
_vehicle = cursorTarget;
uisleep random 3.00000;

if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint "Dies ist zeitgleich nur von einer Person möglich."};
_vehicle setVariable["trunk_in_use",true,true];

if(!createDialog "kistenMenu") exitWith {"Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;

_text = format ["*** Inventar | SpielerID: %1 | Name: %2 | Objekt: %3 |",getPlayerUID player,name player,_vehicle];
[[1,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;

[_vehicle] call EMonkeys_fnc_kisteInventory;
eM_trunk_vehicle = _vehicle;

[_vehicle] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["trunk_in_use",false,true];
};