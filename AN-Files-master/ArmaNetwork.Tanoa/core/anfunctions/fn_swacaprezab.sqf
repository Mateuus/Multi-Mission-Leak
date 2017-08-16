#include <macro.h>
/*
	File: fn_loadDeadGear.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	BLAH


private["_allowedItems","_loadout","_primary","_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle"];
_loadout = param [0,[],[[]]];

_primary = SEL(_loadout,0);
_launcher = SEL(_loadout,1);
_handgun = SEL(_loadout,2);
_magazines = SEL(_loadout,3);
_uniform = SEL(_loadout,4);
_vest = SEL(_loadout,5);
_backpack = SEL(_loadout,6);
_items = SEL(_loadout,7);
_primitems = SEL(_loadout,8);
_secitems = SEL(_loadout,9);
_handgunitems = SEL(_loadout,10);
_uitems = SEL(_loadout,11);
_vitems = SEL(_loadout,12);
_bitems = SEL(_loadout,13);
_headgear = SEL(_loadout,14);
_goggles = SEL(_loadout,15);

//Strip the unit down
RemoveAllWeapons player;
{player removeMagazine _x;} forEach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} forEach (assignedItems player);

//Add the gear
if(!(EQUAL(_uniform,""))) then {[_uniform,true,false,false,false] call life_fnc_waxecruwuka;};
if(!(EQUAL(_vest,""))) then {[_vest,true,false,false,false] call life_fnc_waxecruwuka;};
if(!(EQUAL(_backpack,""))) then {[_backpack,true,false,false,false] call life_fnc_waxecruwuka;};
{
	[_x,true,false,false,false] call life_fnc_waxecruwuka;
} forEach _magazines;

if(!(EQUAL(_primary,""))) then {[_primary,true,false,false,false] spawn life_fnc_waxecruwuka;};
if(!(EQUAL(_launcher,""))) then {[_launcher,true,false,false,false] spawn life_fnc_waxecruwuka;};
if(!(EQUAL(_handgun,""))) then {[_handgun,true,false,false,false] spawn life_fnc_waxecruwuka;};

{[_x,true,false,false,false] call life_fnc_waxecruwuka;} forEach _items;
{[_x,true,false,false,true] call life_fnc_waxecruwuka;} forEach (_uitems);
{[_x,true,false,false,true] call life_fnc_waxecruwuka;} forEach (_vitems);
{[_x,true,true,false,false] call life_fnc_waxecruwuka;} forEach (_bitems);
{[_x,true,false,true,false] call life_fnc_waxecruwuka;} forEach (_primitems);
{[_x,true,false,true,false] call life_fnc_waxecruwuka;} forEach (_secitems);
{[_x,true,false,true,false] call life_fnc_waxecruwuka;} forEach (_handgunitems);

if(!(EQUAL(_headgear,""))) then {player addHeadGear _headgear};
if(!(EQUAL(_goggles,""))) then {player addGoggles _goggles};

*/
private["_allowedItems","_loadout","_primary","_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle"];
_loadout = param [0,[],[[]]];

RemoveAllWeapons player;
{player removeMagazine _x;} forEach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
player setUnitLoadout _loadout;
