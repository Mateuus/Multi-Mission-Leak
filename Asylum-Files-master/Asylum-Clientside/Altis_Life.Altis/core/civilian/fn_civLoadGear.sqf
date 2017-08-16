/*
	File: fn_civLoadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads saved civilian gear, this is limited for a reason and that's balance.
*/

if (count civ_gear == 16) then // OLD SYSTEM!
{
	private["_itemArray","_primary","_launcher","_handgun","_magazines","_uniform","_primitems","_secitems","_handgunitems","_backpack","_vest","_goggles","_headgear","_itemArray","_uItems","_bItems","_vItems","_handle"];
	//[_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_headgear,_goggles];
	_itemArray = civ_gear;

	waitUntil {!(isNull (findDisplay 46))};
	if(count _itemArray == 0) exitWith 
	{
		if(headGear player != "") then {removeHeadgear player;};
		if(goggles player != "") then {removeGoggles player;};
	};

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

	_primary = [_itemArray,0,"",[""]] call BIS_fnc_param;
	_launcher = [_itemArray,1,"",["",[]]] call BIS_fnc_param;
	_handgun = [_itemArray,2,"",[""]] call BIS_fnc_param;
	_magazines = [_itemArray,3,[],[[]]] call BIS_fnc_param;
	_uniform = [_itemArray,4,"",[""]] call BIS_fnc_param;
	_vest = [_itemArray,5,"",[""]] call BIS_fnc_param;
	_backpack = [_itemArray,6,"",[""]] call BIS_fnc_param;
	_items = [_itemArray,7,[],[[]]] call BIS_fnc_param;
	_primitems = [_itemArray,8,[],[[]]] call BIS_fnc_param;
	_secitems = [_itemArray,9,[],[[]]] call BIS_fnc_param;
	_handgunitems = [_itemArray,10,[],[[]]] call BIS_fnc_param;
	_uItems = [_itemArray,11,[],[[]]] call BIS_fnc_param;
	_vItems = [_itemArray,12,[],[[]]] call BIS_fnc_param;
	_bItems = [_itemArray,13,[],[[]]] call BIS_fnc_param;
	_headgear = [_itemArray,14,"",[""]] call BIS_fnc_param;
	_goggles = [_itemArray,15,"",[""]] call BIS_fnc_param;


	if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
	if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
	if(_goggles != "") then {_handle = [_goggles,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
	if(_headgear != "") then {_handle = [_headgear,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
	if(_vest != "") then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
	{
		_handle = [_x,true,false,false,false] spawn life_fnc_handleItem;
		waitUntil {scriptDone _handle};
	} foreach _magazines;
	if(_primary != "") then {[_primary,true,false,false,false] spawn life_fnc_handleItem;};

	if (typeName _launcher == "ARRAY") then 
	{
		if(_launcher select 0 != "") then {[_launcher select 0,true,false,false,false] spawn life_fnc_handleItem;};
		if (typeName (_launcher select 1) == "STRING") then { if(_launcher select 1 != "") then {player addSecondaryWeaponItem (_launcher select 1)}; };
	}
	else { if(_launcher != "") then {[_launcher,true,false,false,false] spawn life_fnc_handleItem;}; };

	if(_handgun != "") then {[_handgun,true,false,false,false] spawn life_fnc_handleItem;};
	{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;
	{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_uItems);
	{[_x,true,true,false,false] call life_fnc_handleItem;} foreach (_bItems);
	{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_vItems);
	{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_primitems);
	{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_secitems);
	{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_handgunitems);  

	/*if(primaryWeapon player != "") then
	{
		player selectWeapon (primaryWeapon player);
	};*/
}
else // New system
{
	player setUnitLoadout civ_gear;
};