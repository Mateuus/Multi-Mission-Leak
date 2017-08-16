/*
	File: fn_lockHouse.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Toggles locks on all doors of selected house
*/
private["_house", "_buildingName", "_type", "_owners", "_isLocked", "_uid", "_index", "_soundFile", "_numDoors", "_notify"];

_house = cursorObject;
_isLocked = _house getVariable["life_locked", 0];
_uid = getPlayerUID player;
_buildingID = [_house] call life_fnc_getBuildID;

if ((_house getVariable["govOffice", false]) && (getPlayerUID player) == (life_configuration select 0)) then
{
	if (_isLocked == 1) then
	{
		_isLocked = 0;
		hint "Unlocked your office doors.";
	}
	else
	{
		_isLocked = 1;
		hint "Locked your office doors.";
	};
	_house setVariable["life_locked", _isLocked, true];
	_house setVariable["bis_disabled_Door_3", _isLocked, true];
	_house setVariable["bis_disabled_Door_4", _isLocked, true];
}
else
{
	if (!(_house in life_houses) && (life_coplevel < 4) && (life_swatlevel < 3) && (_buildingID != life_gang)) exitWith {};
	if (player distance _house > 20) exitWith {};
	if (_house isKindOf "House") then
	{
		_buildingName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		_type = typeOf _house;
		if (_numDoors < 1) exitWith {hint "You can't lock a building with no doors!";};
		
		if (_isLocked == 1) then
		{
			_isLocked = 0;
			hint format["Unlocked all doors of %1.", _buildingName];
		}
		else
		{
			_isLocked = 1;
			hint format["Locked all doors of %1.", _buildingName];
		};
		_house setVariable["life_locked", _isLocked, true];
		
		for "_i" from 1 to _numDoors do
		{
			_house setVariable[format["bis_disabled_Door_%1", _i], _isLocked, true];
			if(_isLocked == 1) then {
				_house animate [format["door_%1_rot",_i],0];
			};
		};
		
		//[[23, player, format["Set locks for house at %1 to %2", position _house, _isLocked]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
		
		//[[_buildingID, _isLocked, position _house],"DB_fnc_updateHouse",false,false] spawn life_fnc_MP;
	};
};

if (_isLocked == 1) then { _soundFile = "lock"; }
else { _soundFile = "unlock"; };
[[player, _soundFile, 10],"life_fnc_playSound",true,false] spawn life_fnc_MP;