/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Saves police gear into an array 
*/
private["_uniformItems","_backpackItems","_vestItems","_mainWeapon","_secondaryWeapon","_ammo","_clothes","_vest","_backpack","_assigned","_handgunAttachments","_secondaryAttachments","_primaryAttachments","_handGun"];

if(player distance spawnIsland < 1000)exitwith{};

_uniformItems = [];
_backpackItems = [];
_vestItems = [];
_mainWeapon = primaryWeapon player;
_handGun = handGunWeapon player;
_ammo = [];
if(DS_sharpShooter == 0)then
	{
	_clothes = uniform player;
	}
	else
	{
	_clothes = DS_sharpShooterUniform;
	};
_vest = vest player;
_backpack = backpack player;
_assigned = assignedItems player;
_handgunAttachments = handGunItems player;
_secondaryAttachments = secondaryWeaponItems player;
_primaryAttachments = primaryWeaponItems player;
_fuelDart = secondaryWeapon player;

if(_backpack != "") then 
	{
		{
		_backpackItems pushBack _x;
		} foreach (backPackItems player);
	};
if(_clothes != "") then 
	{
		{
		_uniformItems pushBack _x;
		} foreach (uniformItems player);
	};
if(_vest != "") then 
	{
		{
		_vestItems pushBack _x;
		} foreach (vestItems player);
	};
if(headgear player != "") then 
	{ 
	_assigned pushBack (headgear player); 
	};
if(goggles player != "") then 
	{ 
	_assigned pushBack (goggles player); 
	};	

if(count (primaryWeaponMagazine player) > 0) then
{
	{
		_ammo pushBack _x;
	} foreach (primaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0) then
{
	{
		_ammo pushBack _x;
	} foreach (handgunMagazine player);
};

_curWep = currentWeapon player;
player selectWeapon _curWep;

cop_gear = [_mainWeapon,_handGun,_ammo,_clothes,_vest,_backpack,_assigned,_primaryAttachments,_secondaryAttachments,_handgunAttachments,_uniformItems,_vestItems,_backpackItems,_fuelDart];