/*
	File: fn_saveGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Saves the player / cops gear in a formatted array.
*/
private["_primary","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_curWep"];

//Old format / code
_primary = primaryWeapon player;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
_primitems = primaryWeaponItems player;
_secitems = secondaryWeaponItems player;
_handgunitems = handGunItems player;
_uitems = [];
_vitems = [];
_bitems = [];

if(_uniform != "" && !(player getVariable["onkill",false])) then {{_uitems pushBack _x;} foreach (uniformItems player);};
if(_vest != "" && !(player getVariable["onkill",false])) then {{_vitems pushBack _x;} foreach (vestItems player);};
if(_backpack != "" && !(player getVariable["onkill",false])) then {{_bitems pushBack _x;} foreach (backPackItems player);};

if(goggles player != "" && !(player getVariable["onkill",false])) then { _items pushBack goggles player; };
if(headgear player != "" && !(player getVariable["onkill",false])) then { _items pushBack headgear player; };
if(count (primaryWeaponMagazine player) > 0  && !(player getVariable["onkill",false])) then
{
	{
		_magazines pushBack _x;
	} foreach (primaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0  && !(player getVariable["onkill",false])) then
{
	{
		_magazines pushBack _x;
	} foreach (handgunMagazine player);
};

//Hard code for Laser Desigantor batteries
_curWep = currentWeapon player;
if("Laserdesignator" in assignedItems player) then
{
	player selectWeapon "Laserdesignator";
	if(currentMagazine player != "" && !(player getVariable["onkill",false])) then {_magazines pushBack (currentMagazine player);};
};

player selectWeapon _curWep;

cop_gear = [_primary,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems];