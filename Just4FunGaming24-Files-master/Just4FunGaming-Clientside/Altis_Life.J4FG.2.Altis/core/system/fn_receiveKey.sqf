// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private["_vehicle", "_source", "_users"];

_vehicle = [ _this, 0, objNull, [objNull] ] call BIS_fnc_param;
_source  = [ _this, 1, "",      [""]      ] call BIS_fnc_param;

if( isNull _vehicle || _source == "" ) exitWith {};

_users = _vehicle getVariable[ "users", [] ];
if( !(profileName in _users) ) then {
    _users pushBack profileName;
    _vehicle setVariable[ "users", _users, true ];
};

if( !(_vehicle in XY_vehicles) ) then {
    XY_vehicles pushBack _vehicle;
    [player, playerSide, _vehicle] remoteExec ["XY_fnc_addToKeychain", 2];
};

hint format[ "%1 hat dir einen Schlüssel für %2 gegeben", _source, getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName") ];