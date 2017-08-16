/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop","_inv","_var","_val","_robber","_illegalItems"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
_illegalItems = getArray(missionConfigFile >> "Cfgmaster" >> "illigalItems");
if(isNull _cop) exitWith {};
_inv = [];
_robber = false;
player say3D "patdown";
{
	_var = [_x select 0,0] call EMonkeys_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_inv pushBack [_x select 0,_val];
		[false,(_x select 0),_val] call EMonkeys_fnc_handleInv;
	};
} foreach _illegalItems;

if(!eM_use_atm) then 
{
	EMonkeys_c164 = 0;
	_robber = true;
};

[[player,_inv,_robber],"EMonkeys_fnc_copSearch",_cop,false] call EMonkeys_fnc_mp;