/*
	File: fn_fetchDeadGear.sqf
	
	
	Description:
	Fetches gear off of a body.
*/
private["_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_headgear","_goggles","_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
_primitems = [];
_secitems = [];
_handgunitems = [];
_primary = life_primary;
_launcher = life_secondary;
_handgun = life_handgun;
_magazines = [];
_uniform = uniform _unit;
_vest = vest _unit;
_backpack = backpack _unit;
_items = assignedItems _unit;
_items pushback life_binocular;
if(_primary != "") then {_primitems = life_primItems};
if(_handgun != "") then {_handgunItems = life_handItems};
_headgear = headgear _unit;
_goggles = goggles _unit;
_uitems = [];
_vitems = [];
_bitems = [];
if(_uniform != "") then {{_uitems pushBack _x;} foreach (uniformItems _unit);};
if(_vest != "") then {{_vitems pushBack _x;} foreach (vestItems _unit);};
if(_backpack != "") then {{_bitems pushBack _x;} foreach (backPackItems _unit);};
	
if(life_primary != "") then
{
	_unit selectWeapon (life_primary);
	if(currentMagazine _unit != "") then
	{
		_magazines pushBack currentMagazine _unit;
	};
};
		
if(life_secondary != "") then
{
	_unit selectWeapon (life_secondary);
	if(currentMagazine _unit != "") then
	{
		_magazines pushBack currentMagazine _unit;
	};
};
		
if(life_handgun != "") then
{
	_unit selectWeapon (life_handgun);
	if(currentMagazine _unit != "") then
	{
		_magazines pushBack currentMagazine _unit;
	};
};
_unit selectWeapon (life_primary);

if(isNil "_handgunItems") then {_handgunItems = ["","",""];};

[_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_headgear,_goggles];