/*
	File: fn_trackBounty.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Track a wanted criminal
*/

private ["_chance","_animal","_animals","_msg","_error","_dir","_bearing","_comp","_distance","_message"];

_isNew = true;
_silent = false;
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if (_uid == "") then {
	_index = [_this,3,0,[0]] call BIS_fnc_param;
	_silent = [_this,4,false,[false]] call BIS_fnc_param;
	_uid = (life_bounty_contract select _index) select 1;
	_isNew = false;
};
if (isNil "_uid") exitWith {};
if (_uid == "") exitWith {};

_bounty = [];
_bountyIndex = -1;
_unit = objNull;

{
	if ((_x select 1) == _uid) exitWith	{ _bounty = _x; _bountyIndex = _forEachIndex; };
} forEach life_bounty_contract;
if (_bountyIndex < 0 && !_silent) exitWith {systemChat "You are no longer responsible for this bounty."};

{
	if (getPlayerUID _x == _uid) then { _unit = _x };
} forEach playableUnits;
if (isNull _unit) exitWith {[_uid] spawn life_fnc_removeBounty;};

_searchTime = switch (true) do
{
	case (12 in life_coptalents): { 120 };
	case (11 in life_coptalents): { 180 };
	case (10 in life_coptalents): { 360 };
	case (9 in life_coptalents): { 480 };
	case (playerSide == west): { 540 };
	default { 180 };
};
if (!_isNew && (time - life_bounty_tracked) < _searchTime && !_silent) exitWith { hint format["You can only track a target once every %1 minutes, you can track again in %2 seconds ", _searchTime/60,round(_searchTime - (time - life_bounty_tracked))]};

if (vehicle player != player && !_silent && !_isNew) exitWith { hint "You can't track someone from within a vehicle." };

deleteMarkerLocal format["bounty_%1", _bountyIndex];
deleteMarkerLocal format["bounty_dot_%1", _bountyIndex];

life_track_radius = switch (true) do
{
	case (125 in life_talents): { 175 };
	case (124 in life_talents): { 250 };
	case (playerSide == west): {life_track_radius};
	default { 300 };
};

_pos = [(getPos _unit), [1,life_track_radius] call BIS_fnc_randomInt, [0,359] call BIS_fnc_randomInt] call BIS_fnc_relPos;

_marker = createMarkerLocal [format["bounty_%1", _bountyIndex], _pos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [life_track_radius, life_track_radius];
_marker setMarkerTypeLocal "mil_dot";
_marker setMarkerBrushLocal "DiagGrid";
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTextLocal format["Fugitive %1", _bounty select 0];

_marker2 = createMarkerLocal [format["bounty_dot_%1", _bountyIndex], _pos];
_marker2 setMarkerShapeLocal "ICON";
_marker2 setMarkerTypeLocal "mil_dot";
_marker2 setMarkerColorLocal "ColorRed";
_marker2 setMarkerTextLocal format["Fugitive %1", _bounty select 0];

if (!_isNew) then { life_bounty_tracked = time; };
_bounty set [5, _pos];
life_bounty_contract set [_bountyIndex, _bounty];

if (!_silent) then {
	_message = "You receive word that %1 is in the marked area, %2 meters away";
	/*if(vehicle _unit != _unit) then {
		_vehicle = vehicle _unit;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		if(_displayName == "") exitWith {};
		_color = [typeOf _vehicle,_vehicle getVariable "Life_VEH_color"] call life_fnc_vehicleColorStr;
		_dir = switch(true) do {
			case (getDir _vehicle > 22.5 && getDir _vehicle <= 67.5): {"North-East"};
			case (getDir _vehicle > 67.5 && getDir _vehicle <= 112.5): {"East"};
			case (getDir _vehicle > 112.5 && getDir _vehicle <= 157.5): {"South-East"};
			case (getDir _vehicle > 157.5 && getDir _vehicle <= 202.5): {"South"};
			case (getDir _vehicle > 202.5 && getDir _vehicle <= 247.5): {"South-West"};
			case (getDir _vehicle > 247.5 && getDir _vehicle <= 292.5): {"West"};
			case (getDir _vehicle > 292.5 && getDir _vehicle <= 337.5): {"North-West"};
			case (getDir _vehicle > 337.5 || getDir _vehicle <= 22.5): {"North"};
		};
		_message = _message + format[", driving a %3 %1 and potentially headed %2 at a speed of %4", _displayName,_dir,_color,round speed _vehicle];
	} else {
		_message = _message + ", on foot";
	};*/
	[[0,2], format[_message + ".",_bounty select 0, player distance _pos]] call life_fnc_broadcast; 
};