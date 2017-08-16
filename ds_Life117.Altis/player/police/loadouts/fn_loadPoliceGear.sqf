/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Loads an officers gear after death
*/
//Delete all their items and fix weight
private ["_myGear","_done"];

_myGear = cop_gear;

if(count (_myGear) == 0)exitwith{};//Officer has no gear saved
if(isNil "_myGear")exitwith{};//Officer has no gear saved
//Get nakie
RemoveAllWeapons player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHEadGear player;
{
	player removeMagazine _x;
}forEach (magazines player);
{
	player unassignItem _x;
	player removeItem _x
}forEach (assignedItems player);

//Equip players saved gear
//Clothing first
if((_myGear select 5) != "")then
	{
	_done = [(_myGear select 5),false,false,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
	};
if((_myGear select 3) != "")then
	{
	_done = [(_myGear select 3),false,false,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
	};
if((_myGear select 4) != "")then
	{
	_done = [(_myGear select 4),false,false,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
	};
//Now the Ammo
{
	_done = [_x,false,false,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
}forEach (_myGear select 2);

//Lets add our weapons
if((_myGear select 1) != "")then
	{
	[(_myGear select 1),false,false,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
	};

if((_myGear select 0) != "")then
	{
	[(_myGear select 0),false,false,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
	};
if((_myGear select 13) != "")then
	{
	[(_myGear select 13),false,false,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
	};
//Now we'll add all the items
{
	_done = [_x,false,false,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
}forEach (_myGear select 6);
{
	_done = [_x,false,false,false,true] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
}forEach (_myGear select 10);
{
	_done = [_x,false,true,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
}forEach (_myGear select 11);
{
	_done = [_x,true,false,false,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
}forEach (_myGear select 12);
//if(count(_myGear select 7) > 0)then{removeAllPrimaryWeaponItems player};
{
	_done = [_x,false,false,true,false] spawn DS_fnc_equipItem; waitUntil {scriptDone _done};
}forEach (_myGear select 7);
//Arm player with his selected weapon
if((primaryWeapon player) != "")then
	{
	player selectWeapon (primaryWeapon player);
	};
//Texture clothing
[] call DS_fnc_copuniform;
































