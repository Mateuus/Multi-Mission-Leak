/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop","_inv","_var","_val","_robber"];
_cop = param [0,Objnull,[objNull]];
if(isNull _cop) exitWith {};
_inv = [];
_robber = false;
//Illegal items
{
	_var = [_x select 0,0] call lhm_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_inv pushBack [_x select 0,_val];
		[false,(_x select 0),_val] call lhm_fnc_handleInv;
	};
} foreach lhm_illegal_items;

if(!lhm_use_atm) then 
{
	lhm_cash = 0;
	_robber = true;
};

[[player,_inv,_robber],"lhm_fnc_copSearch",_cop,false] call lhm_fnc_mp;