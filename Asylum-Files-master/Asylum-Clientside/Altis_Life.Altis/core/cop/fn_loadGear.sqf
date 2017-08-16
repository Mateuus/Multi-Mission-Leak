/*
	File: fn_loadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for loading cop saved gear loadout.
*/
private["_loadout","_primary","_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle"];

_loadout = cop_gear;
if(life_coprole == "detective") then {_loadOut = _loadout select 1} else {_loadout = _loadout select 0};

if (!life_alive || {isNil "_loadout"} || {typeName _loadout != "ARRAY"} || {count _loadout == 0}) exitWith { if (life_coprole == "detective" || (str player) in ["cop_detective_1","cop_detective_2","cop_detective_3"]) then { [] call life_fnc_detectiveGear } else { [] call life_fnc_copDefault; } };
_primary = _loadout select 0;
_launcher = "";
_handgun = _loadout select 1;
_magazines = _loadout select 2;
_uniform = _loadout select 3;
_vest = _loadout select 4;
_backpack = _loadout select 5;
_items = _loadout select 6;
_primitems = _loadout select 7;
_secitems = _loadout select 8;
_handgunitems = _loadout select 9;
_uitems = _loadout select 10;
_vitems = _loadout select 11;
_bitems = _loadout select 12;

//Strip the unit down
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

//Add the gear
if(_uniform != "") then { [_uniform,true,false,false,false] call life_fnc_handleItem; };
if(_vest != "") then { [_vest,true,false,false,false] call life_fnc_handleItem; };
if(_backpack != "") then { [_backpack,true,false,false,false] call life_fnc_handleItem; };
{
	[_x,true,false,false,false] call life_fnc_handleItem;
} foreach _magazines;

if(_primary != "") then {[_primary,true,false,false,false] call life_fnc_handleItem;};
if(_launcher != "") then {[_launcher,true,false,false,false] call life_fnc_handleItem;};
if(_handgun != "") then {[_handgun,true,false,false,false] call life_fnc_handleItem;};

{ [_x,true,false,false,false] call life_fnc_handleItem; } foreach _items;
{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_uitems);
{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_vitems);
{[_x,true,true,false,false] call life_fnc_handleItem;} foreach (_bitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_primitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_secitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_handgunitems);  

/*if(primaryWeapon player != "") then
{
	player selectWeapon (primaryWeapon player);
};*/

[] call life_fnc_equipGear;

_TracerMag = {
	if(["tracer",_x] call BIS_fnc_inString) exitWith {_x}; ""
} forEach magazines player;
if(!isNil "_TracerMag" && {_TracerMag != ""} && {!(["tracer",currentMagazine player] call BIS_fnc_inString)}) then {
	player removeMagazine _TracerMag;
	player addMagazine currentMagazine player;
	player addprimaryweaponitem _TracerMag;
};