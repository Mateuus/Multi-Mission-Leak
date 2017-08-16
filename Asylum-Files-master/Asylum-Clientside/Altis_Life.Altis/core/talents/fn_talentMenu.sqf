/*
	File: fn_talentMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Populates the talent menu.
	Please either get Asylum permission to use this or create this system yourself.
*/

private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 3700)};
_display = findDisplay 3700;
_list = _display displayCtrl 3702;
_learn = _display displayCtrl 3710;
_stats = _display displayCtrl 3712;

//Purge List
lbClear _list;

// Disable buttons by default since none are pre-selected
_learn ctrlShow false;

// Populate general talent stats
_max = [] call life_fnc_calTalents;
if (life_gangperk) then
{
	_free = _max - (count life_gangtalents);
	_stats ctrlSetText format["Used points: %1/%2 - Available: %3", count life_gangtalents, life_maxGangTalents, _free];
}
else
{
	_free = _max - (count life_talents);
	_stats ctrlSetText format["Used points: %1/%2 - Available: %3", count life_talents, life_maxTalents, _free];
};

// And populate the talents
[_list, 0, 0] call life_fnc_addTalentRow;