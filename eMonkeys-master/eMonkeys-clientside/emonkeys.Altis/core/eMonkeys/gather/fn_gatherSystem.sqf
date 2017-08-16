/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_gatherSystem.sqf
	Server: e-Monkeys.com
    
    Description: New Gather System with Config
*/
private["_farm","_tool","_exit","_toolname","_item","_itemVar","_itemStr","_itemNr","_random","_ran","_sum","_itemsSpecial","_itemSpecialNr","_randomSpecial","_toolSpecial","_itemSpecial","_itemSpecialVar","_itemSpecialStr"];
_farm = [_this,0,"",[""]] call bis_fnc_param;
_exit = false;
_weaponChange = false;

if(_farm isEqualTo "") exitWith {eM_action_gather = false;};

//Farm in Array suchen
_farmArry = [_farm,EMonkeys_GatherCfg] call TON_fnc_index;
_farmArry = EMonkeys_GatherCfg select _farmArry;

if(typeName _farmArry != "ARRAY") exitWith {};
//Normales Abbauen
_itemNr = _farmArry select 1;
_item = _farmArry select 2;
_random = _farmArry select 3;
_tool = _farmArry select 4;

//Abbauen mit zusätzlichen Items
_itemSpecialNr = _farmArry select 5;
_itemSpecial = _farmArry select 6;
_randomSpecial = _farmArry select 7;
_toolSpecial = _farmArry select 8;

//Abfragen Normal
if(_tool != "") then
{
	_toolVar = compile _tool;
	if((call _toolVar) < 1) exitWith {_exit = true;};
};
if(_exit) exitWith
{
	_toolname = [_tool] call EMonkeys_fnc_varToStr;
	["Information",[format["Du benötigst ein(e) %1 um hier abzubauen/abzupumpen",_toolname]],"#0090ff"] call EMonkeys_fnc_specialText;
	eM_action_gather = false;
};

if(_random != -1) then
{
	_ran = ceil(random _random);
	{
		if(_ran in (_x select 1)) exitWith {_item = _x select 0};
	}foreach _item;
}else{
	_item = ((_item select 0) select 0);
};

_itemVar = [_item,0] call EMonkeys_fnc_varHandle;
_itemStr = [_itemVar] call EMonkeys_fnc_varToStr;
_itemNr = round (random _itemNr);
if(_itemNr isEqualTo 0) then {_itemNr = 1};
_sum = [_item,_itemNr,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;

//Abfragen Special
if(count _itemSpecial > 0) then
{
	if(_toolSpecial != "") then
	{
		_toolSpecial = compile _toolSpecial;
		if((call _toolSpecial) < 1) exitWith {_exit = true};
	};
	if(_exit) exitWith {};
	_ran = ceil(random _randomSpecial);
	{
		if(_ran in (_x select 1)) exitWith {_itemSpecial = _x select 0};
	}foreach _itemSpecial;
	if(typeName _itemSpecial != "STRING") exitWith {};
	_itemSpecialVar = [_itemSpecial,0] call EMonkeys_fnc_varHandle;
	_itemSpecialStr = [_itemSpecialVar] call EMonkeys_fnc_varToStr;
}; 

//Abbauvorgang
if(_sum < 1) exitWith {["Information",["Dein Inventar ist voll,","du kannst nichts mehr abbauen/sammeln"],"#0090ff"] call EMonkeys_fnc_specialText; eM_action_gather = false;};

titleText[format["%1 %2...",if(_tool == "") then {"Sammle"}else{"Baue ab"},_itemStr],"PLAIN"];
if(currentWeapon player != "") then
{
	_weaponChange = true;
	EMonkeys_curWep_h = currentWeapon player;
	player action ["SwitchWeapon", player, player, 100];
};
for "_i" from 0 to 1 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uisleep 2.6;
};
if([true,_item,_sum] call EMonkeys_fnc_handleInv) then
{
	titleText[format["Du hast %1x %2 %3",_sum,_itemStr,if(_tool == "") then {"gesammelt"}else{"abgebaut"}],"PLAIN"];
	eM_leveladd = [_item,"sammeln"];
	if(typeName _itemSpecial == "STRING") then
	{
		_sumSpecial = [_itemSpecial,_itemSpecialNr,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
		if(_sumSpecial < 1) exitWith {};
		if([true,_itemSpecial,_sumSpecial] call EMonkeys_fnc_handleInv) then
		{
			["Information",[format["Du hast beim Abbauen %1 gefunden",_itemSpecialStr]],"#0090ff"] call EMonkeys_fnc_specialText;
		};
	};
	if(_weaponChange) then
	{
		if(EMonkeys_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then
		{
			player selectWeapon EMonkeys_curWep_h;
		};
	};
};
uisleep 2.5;

eM_action_gather = false;