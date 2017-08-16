private["_primary","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_curWep"];
_primary = RIFLE;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
_primitems = RIFLE_ITEMS;
_secitems = secondaryWeaponItems player;
_handgunitems = handGunItems player;
_uitems = [];
_vitems = [];
_bitems = [];
if(_uniform != "") then {
{
_uitems pushBack _x;
} foreach (uniformItems player);
};
if(_vest != "") then {
{
_vitems pushBack _x;
} foreach (vestItems player);
};
if(_backpack != "") then {
{_bitems pushBack _x;
} foreach (backPackItems player);
};
if(goggles player != "") then { _items pushBack goggles player; };
if(headgear player != "") then { _items pushBack headgear player; };
if(count (primaryWeaponMagazine player) > 0) then
{
	{
		_magazines pushBack _x;
	} foreach (primaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0) then
{
	{
		_magazines pushBack _x;
	} foreach (handgunMagazine player);
};
_curWep = currentWeapon player;
if("Laserdesignator" in assignedItems player) then
{
	player selectWeapon "Laserdesignator";
	if(currentMagazine player != "") then {_magazines pushBack (currentMagazine player);};
};
player selectWeapon _curWep;
cop_gear = [_primary,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems];
[] spawn life_fnc_copDefault;