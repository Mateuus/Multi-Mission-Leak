#include <macro.h>
/*
	File: fn_dogInit.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	
*/
if(playerSide != west) exitWith { hint "Only police can use the dog whistle!";}; //if not a cop, then no
if(__GETC__(life_coplevel) < 3) exitWith {hint "You are too low of a rank to use the dog whistle!";};
_unit = _this select 0;
_side = side (group _unit);
sleep 2;
_unit setvariable ["order","nil"];
_unit setvariable ["step","wait"];
_unit setvariable ["action","true"];
_unit setvariable ["seek","false"];
_unit setvariable ["searchDrugs","false"];
_unit setvariable ["actions",[]];

//Attempt to Limit Dogs
_unit setVariable ["hasDog",true,true];

while {(_unit getvariable "action") == "true"} do
{
	_unit setvariable ["step","wait"];
	_actions = _unit getvariable "actions";
	{
		_unit removeaction _x;
	} foreach _actions;
	
	_actions = [ ];

	if ((_unit getvariable "order") == "nil") then
	{
		_whistle = _unit addAction ["Whistle", life_fnc_dogWhistle, [_unit]];
		_unit setvariable ["order","whistle"];
		_unit setvariable ["step","wait"];
		_unit setvariable ["actions",[_whistle]];
	};
	
	if ((_unit getvariable "order") == "idle") then
	{
		_follow = _unit addAction ["<t color = '#ffff00'>Follow</t>", life_fnc_dogFollow, [_unit]];
		_find = _unit addAction ["<t color = '#ffff00'>Search</t>", life_fnc_dogSeek, [_unit]];
		_drugs = _unit addAction ["<t color = '#ffff00'>Sniff</t>", life_fnc_dogSearchDrugs, [_unit]];
		_heel = _unit addAction ["<t color = '#ffff00'>Heel</t>", life_fnc_dogHeel, [_unit]];
		_rest = _unit addAction ["<t color = '#ff0000'>Hide</t>", life_fnc_dogHide, [_unit]];
		_unit setvariable ["step","wait"];
		
		_unit setvariable ["actions",[_follow,_find,_drugs,_rest,_heel]];
		
	};

	if ((_unit getvariable "order") == "active") then
	{
		_stop = _unit addAction ["<t color = '#ff0000'>Stop!</t>", life_fnc_dogStop, [_unit]];
		_unit setvariable ["step","wait"];
		_unit setvariable ["actions",[_stop]];
	};
	if ((_unit getvariable "dead") == "active") then
	{
		_unit setvariable ["order","nil"];
	};		
	waituntil {((_unit getvariable "step") == "go")};
};

_actions = _unit getvariable "actions";
{
	_unit removeaction _x;
} foreach _actions;