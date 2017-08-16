#include <macro.h>
/*
	File: fn_lockStorage.sqf
	Author: Mario2002
	
	Description:
	locks/unlocks a house storage
*/
private["_house", "_buildingName", "_type", "_owners", "_isLocked", "_uid", "_index"];

_house = cursorObject;
_isLocked = _house getVariable["storage_locked", 0];
_owners = _house getVariable["life_homeOwners", []];
_uid = getPlayerUID player;
_buildingID = [_house] call life_fnc_getBuildID;

if (!(_uid in _owners)&&(__GETC__(GTA_copRank) < 4)) exitWith {};
if (player distance cursorObject > 20) exitWith {};
if (_house isKindOf "House") then
{
	_buildingName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	
	if (_isLocked == 1) then
	{
		_isLocked = 0;
		hint format["Unlocked all storages of %1.", _buildingName];
	}
	else
	{
		_isLocked = 1;
		hint format["Locked all storages of %1.", _buildingName];
	};
	_house setVariable["storage_locked", _isLocked, true];
};