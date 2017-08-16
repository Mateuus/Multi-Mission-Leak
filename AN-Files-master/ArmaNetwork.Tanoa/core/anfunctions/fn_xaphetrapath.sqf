#include <macro.h>

/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Searches the player and he returns information back to the player.
*/
private _cop = param [0,Objnull,[objNull]];
if (isNull _cop) exitWith {};
private _inv = [];
private _robber = false;
private _random = round (random (1));

if ("smuggler" in AN_Skills && {_random isEqualTo 1}) then 
{
	_inv = [];
	["Smuggler"] call life_fnc_notificationHandler;
}
else
{
	{
		private _item = _x select 0;
		private _value = _x select 1;
		if ([_item] call life_fnc_virtualIsIllegal) then
		{
			_inv pushBack [_item,_value];
			[_item,_value] call life_fnc_virtualItemRemove;
		};
	} foreach AN_Inventory;
};

if (!life_use_atm) then
{
	CASH = 0;
	_robber = true;
};

[player,_inv,_robber] remoteExecCall ["life_fnc_copSearch",_cop];
