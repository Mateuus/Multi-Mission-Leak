/*
	File: fn_fetchDeadGear.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Fetches gear off of a body.
*/

if (time - life_last_death_gear < 5) exitWith {life_dead_gear};

private["_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_headgear","_goggles","_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_primitems = [];
_secitems = [];
_handgunitems = [];
_primary = primaryWeapon _unit;
_launcher = secondaryWeapon _unit;
_handgun = handGunWeapon _unit;
_magazines = magazinesAmmo _unit;
_uniform = uniform _unit;
_vest = vest _unit;
_backpack = backpack _unit;
_items = assignedItems _unit;
if(primaryWeapon _unit != "") then {_primitems = primaryWeaponItems _unit;};
if(handgunWeapon _unit != "") then {_handgunItems = handgunItems _unit;};
_headgear = headgear _unit;
_goggles = goggles _unit;
_uitems = [];
_vitems = [];
_bitems = [];
if(_uniform != "") then {
	{
		if(!(_x in magazines _unit)) then {
			_uitems pushBack _x;
		};
	} foreach (uniformItems _unit);
};
if(_vest != "") then {
	{
		if(!(_x in magazines _unit)) then {
			_vitems pushBack _x;
		};
	} foreach (vestItems _unit);
};
if(_backpack != "") then {
	{
		if(!(_x in magazines _unit)) then {
			_bitems pushBack _x;
		};
	} foreach (backPackItems _unit);
};

if(primaryWeapon _unit != "" && count (primaryWeaponMagazine _unit) > 0) then
{
	_magazines pushBack [((primaryWeaponMagazine _unit) select 0),_unit ammo primaryWeapon _unit];
};

/*if(secondaryWeapon _unit != "" && count (secondaryWeaponMagazine _unit) > 0) then
{
	_magazines pushBack ((secondaryWeaponMagazine _unit) select 0);
};*/

if(handgunWeapon _unit != "" && count (handgunMagazine _unit) > 0) then
{
	_magazines pushBack [((handgunMagazine _unit) select 0),_unit ammo handgunWeapon _unit];
};

life_last_death_gear = time;

if(isNil "_handgunItems") then {_handgunItems = ["","",""];};
[_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_headgear,_goggles];