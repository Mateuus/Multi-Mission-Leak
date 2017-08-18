/*
	File: fn_searchDrugsClient.sqf
	Author: ishi
	
	Description:
	Searches the player for drugs.
*/
private["_inv","_var","_val"];

_inv = false;
{
	_var = [_x select 0,0] call life_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_inv = true;
	};
} foreach life_drug_items;

player setVariable["hasDrugs", _inv];

[] spawn {
	sleep 5;
	player setVariable["hasDrugs", nil];
};