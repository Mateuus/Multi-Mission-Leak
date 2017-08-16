/*
	File: fn_civFetchGear.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Fetches specific key items from the civilian for a persistent state.
*/

/*private["_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_headgear","_goggles"];
if (life_laser_inprogress) exitWith {};
_primitems = [];
_secitems = [];
_handgunitems = [];
_primary = primaryWeapon player;
_launcher = [secondaryWeapon player, if (count (secondaryWeaponMagazine player) > 0) then { (secondaryWeaponMagazine player) select 0 } else { "" }];
_handgun = handGunWeapon player;
_magazines = magazinesAmmo player;
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
if(primaryWeapon player != "") then {_primitems = primaryWeaponItems player;};
if(handgunWeapon player != "") then {_handgunItems = handgunItems player;};
_headgear = headgear player;
_goggles = goggles player;
_uitems = [];
_vitems = [];
_bitems = [];
if(_uniform != "") then {
	{
		if(!(_x in magazines player)) then {
			_uitems pushBack _x;
		};
	} foreach (uniformItems player);
};
if(_vest != "") then {
	{
		if(!(_x in magazines player)) then {
			_vitems pushBack _x;
		};
	} foreach (vestItems player);
};
if(_backpack != "") then {
	{
		if(!(_x in magazines player)) then {
			_bitems pushBack _x;
		};
	} foreach (backPackItems player);
};

if(primaryWeapon player != "" && count (primaryWeaponMagazine player) > 0) then
{
	_magazines pushBack [((primaryWeaponMagazine player) select 0),player ammo primaryWeapon player];
};

/*if(secondaryWeapon player != "" && count (secondaryWeaponMagazine player) > 0) then
{
	_magazines pushBack ((secondaryWeaponMagazine player) select 0);
};*/
/*
if(handgunWeapon player != "" && count (handgunMagazine player) > 0) then
{
	_magazines pushBack [((handgunMagazine player) select 0),player ammo handgunWeapon player];
};

if(isNil "_handgunItems") then {_handgunItems = ["","",""];};

civ_gear = [_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_headgear,_goggles];*/
civ_gear = getUnitLoadout player;