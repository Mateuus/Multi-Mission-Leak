scriptName "fn_mainMenuForType";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_mainMenuForType.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_mainMenuForType.sqf"

_type = param[0,"",[""]];
if (_type == "") exitWith {};

_configName = "";

// Determine master config name (either directly defined or parent)
_configName = [_type] call mav_tuning_fnc_getMasterConfig;

// Not tuneable
if (_configName == "") exitWith {diag_log "This vehicle is not tuneable"};

// Display
disableSerialization;
_listbox = (findDisplay 5100) displayCtrl 0;
lbClear _listbox;

// First entry?
_first = true;

// Fetch config statistics
// Raw modifications
if (isClass(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "RawModifications")) then {
	_listbox lbAdd "Vehicle Parts Modifications";
	_listbox lbSetColor [(lbSize _listbox) - 1, [0.99,0.83,0.23,1]];
	{
		_display = getText(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "RawModifications" >> _x >> "displayText");
		_price   = getNumber(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "RawModifications" >> _x >> "price");
	 	_listbox lbAdd format ["$%1 - %2",_price, _display];
	 	_listbox lbSetData [(lbSize _listbox) - 1, "RawModifications"];
	 	_listbox lbSetValue [(lbSize _listbox) - 1, _forEachIndex];
	} forEach (getArray(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "RawModifications" >> "pool"));
	_first = false;
};

if (isClass(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Colors")) then {
	// Empty line
	if (!_first) then {_listbox lbAdd "";};

	// Colors
	_listbox lbAdd "Color Modifications";
	_listbox lbSetColor [(lbSize _listbox) - 1, [0.99,0.83,0.23,1]];
	{
		_display = getText(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Colors" >> _x >> "displayText");
		_price   = getNumber(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Colors" >> _x >> "price");
	 	_listbox lbAdd format ["$%1 - %2",_price, _display];
	 	_listbox lbSetData [(lbSize _listbox) - 1, "Colors"];
	 	_listbox lbSetValue [(lbSize _listbox) - 1, _forEachIndex];
	} forEach (getArray(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Colors" >> "pool"));
	_first = false;
};

/*// Empty line
_listbox lbAdd "";

// Colors
_listbox lbAdd "Wheel Modifications";
_listbox lbSetColor [(lbSize _listbox) - 1, [0.99,0.83,0.23,1]];
if (isClass(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Wheels")) then {
	{
		_display = getText(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Wheels" >> _x >> "displayText");
		_price   = getNumber(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Wheels" >> _x >> "price");
	 	_listbox lbAdd format ["$%1 - %2",_price, _display];
	 	_listbox lbSetData [(lbSize _listbox) - 1, "Wheels"];
	 	_listbox lbSetValue [(lbSize _listbox) - 1, _forEachIndex];
	} forEach (getArray(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Wheels" >> "pool"));
};*/

if (isClass(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Nitro")) then {
	// Empty line
	if (!_first) then {_listbox lbAdd "";};

	// Colors
	_listbox lbAdd "Vehicle Boosts";
	_listbox lbSetColor [(lbSize _listbox) - 1, [0.99,0.83,0.23,1]];
	{
		_display = getText(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Nitro" >> _x >> "displayText");
		_price   = getNumber(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Nitro" >> _x >> "price");
	 	_listbox lbAdd format ["$%1 - %2",_price, _display];
	 	_listbox lbSetData [(lbSize _listbox) - 1, "Nitro"];
	 	_listbox lbSetValue [(lbSize _listbox) - 1, _forEachIndex];
	} forEach (getArray(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Nitro" >> "pool"));
	_first = false;
};

if (isClass(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Underglow")) then {
	// Empty line
	if (!_first) then {_listbox lbAdd "";};

	// Underglow
	_listbox lbAdd "Vehicle Underglow";
	_listbox lbSetColor [(lbSize _listbox) - 1, [0.99,0.83,0.23,1]];
	{
		_display = getText(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Underglow" >> _x >> "displayText");
		_price   = getNumber(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Underglow" >> _x >> "price");
	 	_listbox lbAdd format ["$%1 - %2",_price, _display];
	 	_listbox lbSetData [(lbSize _listbox) - 1, "Underglow"];
	 	_listbox lbSetValue [(lbSize _listbox) - 1, _forEachIndex];
	} forEach (getArray(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _configName >> "Underglow" >> "pool"));
	_first = false;
};