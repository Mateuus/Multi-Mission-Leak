#include "..\..\script_macros.hpp"
/*
	File: fn_stealgear.sqf
	Author: RPGforYOU 
	Website: www.outlawed-veterans.com
	
	Description:
	Will steal the clothing of zipped-tied people and put it on the floor for the robbers to get. 
	If you are copying it, be so kind to leave my name as author in it as I'm the one and only original one - RPGforYOU! :)
	And this took some time to fucking write, check and search for XD
*/
private["_Victim","_Pos","_uniform",
"_vest","_backpack","_goggles","_headgear",
"_primarywep","_secondarywep","_handgunwep",
"_UniformItems","_UniformMagazines",
"_Backpackitems","_BackpackMagazines",
"_VestItems","_VestMagazines","_assignedItems",
"_primaryWeaponItems","_HandgunWeaponItems","_SecondaryWeaponItems"
];

//if((player getVariable "restrained")) exitWith {hint"You are restrained therefore you can't interact";_bad = 1;};

_Pos = position player; 
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_goggles = goggles player;
_headgear = headgear player;
_primarywep = primaryWeapon player;	
_secondarywep = secondaryWeapon player;
_handgunwep = handgunWeapon player;	
_UniformItems = [];
_UniformMagazines  = [];
_Backpackitems = [];
_BackpackMagazines  = [];
_VestItems = [];
_VestMagazines  = [];
_primaryWeaponItems = [];
_HandgunWeaponItems = [];
_SecondaryWeaponItems = [];
_assignedItems = [];

/////////////////////
//Get all the freaking gear and shit into array's
/////////////////////
if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _UniformMagazines = _UniformMagazines + [_x];
        } else {
            _UniformItems = _UniformItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _BackpackMagazines = _BackpackMagazines + [_x];
        } else {
            _Backpackitems = _Backpackitems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _VestMagazines = _VestMagazines + [_x];
        } else {
            _VestItems = _VestItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _primaryWeaponItems = _primaryWeaponItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (secondaryWeaponItems player) > 0) then
{
    {
        _SecondaryWeaponItems = _SecondaryWeaponItems + [_x];
    } forEach (secondaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _HandgunWeaponItems = _HandgunWeaponItems + [_x];
    } forEach (handGunItems player);
};


{
	_assignedItems = _assignedItems + [_x];
} foreach (assignedItems player);


/////////////////////
//Strip the player entirely!
/////////////////////

RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);
uiSleep 0.2;

/////////////////////
//Create the ground object which will contain all the gear
/////////////////////

_Victim = createVehicle ["WeaponHolderSimulated", [0,0,0], [], 0, "CAN_COLLIDE"];
if(_primarywep != "") then {
_Victim addWeaponCargoGlobal [_primarywep,1];
};
if(_handgunwep != "") then {
_Victim addWeaponCargoGlobal [_handgunwep,1];
};
if(_secondarywep != "") then {
_Victim addWeaponCargoGlobal [_secondarywep,1];
};
_Victim addItemCargoGlobal [_headgear,1];
_Victim addItemCargoGlobal [_vest,1];
_Victim addItemCargoGlobal [_goggles,1];
_Victim addItemCargoGlobal [_uniform,1];
_Victim addBackpackCargoGlobal [_backpack,1];
{(_Victim) addMagazineCargoGlobal [_x,1];} foreach (_BackpackMagazines);
{(_Victim) addMagazineCargoGlobal [_x,1];} foreach (_VestMagazines);
{(_Victim) addMagazineCargoGlobal [_x,1];} foreach (_UniformMagazines);
{(_Victim) addItemCargoGlobal [_x,1];} foreach (_Backpackitems);
{(_Victim) addItemCargoGlobal [_x,1];} foreach (_VestItems);
{(_Victim) addItemCargoGlobal [_x,1];} foreach (_UniformItems);
{(_Victim) addItemCargoGlobal [_x,1];} foreach (_primaryWeaponItems);
{(_Victim) addItemCargoGlobal [_x,1];} foreach (_SecondaryWeaponItems);
{(_Victim) addItemCargoGlobal [_x,1];} foreach (_HandgunWeaponItems);
{(_Victim) addItemCargoGlobal [_x,1];} foreach (_assignedItems);
_Victim setPos (getPos player);
//Sync the shit
[] call SOCK_fnc_updateRequest;
