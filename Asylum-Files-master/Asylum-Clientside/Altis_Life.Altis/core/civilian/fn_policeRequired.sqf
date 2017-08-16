/*
	File: fn_policeRequired.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Checks that enough police are online for the event and shows an error if not. Returns true if police are present.
*/

private ["_required", "_cops", "_hint"];

_required = [_this,0,1,[1]] call BIS_fnc_param;
_ignoreFed = [_this,1,false,[false]] call BIS_fnc_param;

_initRequired = _required;
_cops = 0;
{ if (side _x == west && _x distance (getMarkerPos "Respawn_west") > 200) then { _cops = _cops + 1; }; } forEach allPlayers;

if (!isNil "life_prison_inProgress" && {life_prison_inProgress}) then { _required = _required + 3 };
if (!isNil "life_bank_inProgress" && {life_bank_inProgress} && !_ignoreFed) then { _required = _required + 5 };
if (!isNil "life_bank_drilling" && {life_bank_drilling}) then { _required = _required + 4 };

_hint = "You";
if (_initRequired < _required) then { _hint = "Because of crimes already in progress, you" };
if (_cops < _required) then { hint format["%1 cannot initiate this crime with fewer than %2 police officers online. An additional %3 officers are required.", _hint, _required, _required - _cops] };

(_cops >= _required)