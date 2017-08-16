/*
	File: fn_packItem.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Function for packing packable game items
*/

private ["_info","_className","_itemString","_side","_vehicle","_itemWeight","_longName"];

_info = _this select 3;
_className = _info select 0; //Class name of object to pack
_itemString = _info select 1; //String name to display of object being packed
_side = _info select 2; //Side of player packing object
_shortName = _info select 3;//Short variable name of object

systemchat format ["Packing your %1......",_itemString];

_itemWeight = [_shortName] call DS_fnc_itemWeight;

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;

_vehicle = (nearestobjects [getpos player, [_className],  6] select 0);

if(!alive _vehicle) exitwith {hint format ["You can not pack a destroyed %1",_itemString];};

if(_className == "Land_Campfire_F")exitWith	
	{
	deletevehicle _vehicle;
	[_shortName,true,1] call DS_fnc_handleInventory;
	systemchat format ["You have placed a packed %1 into your inventory",_itemString];
	hint format ["You have placed a packed %1 into your inventory",_itemString];
	};

	if(_vehicle in DS_keyRIng)then
	{
	deletevehicle _vehicle;
	[_shortName,true,1] call DS_fnc_handleInventory;
	systemchat format ["You have placed a packed %1 into your inventory",_itemString];
	hint format ["You have placed a packed %1 into your inventory",_itemString];
	}
	else
	{
	systemchat format ["This is not your %1",_itemString];
	hint format ["This is not your %1",_itemString];
	};