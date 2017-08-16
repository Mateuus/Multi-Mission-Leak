/*
	File: fn_dispatchRadio.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Add or remove the selected unit to the custom dispatch channel.
	Please ask for permission to use this and stop stealing my stuff.
*/

disableSerialization;

private ["_isCop","_unit","_task","_flush"];

_isCop = [_this,0,true,[true]] call BIS_fnc_param;
_flush = [_this,1,false,[false]] call BIS_fnc_param;

if (isNull (findDisplay 39500)) exitWith {hint "Can't find dialog."};
if (playerSide != west) exitWith {hint "You're not even a cop."};

_unit = objNull;
if (_isCop) then
{
	_unit = call compile (((findDisplay 39500) displayCtrl 39510) lbData (lbCurSel 39510));
}
else
{
	_task = call compile (((findDisplay 39500) displayCtrl 39514) lbData (lbCurSel 39514));
	{ if (getPlayerUID _x == (_task select 6)) then { _unit = _x; } } forEach allPlayers;
};
if (isNull _unit) exitWith { hint "INVALID UNIT!" };

_chan = -1;
if (_isCop && !((getPlayerUID _unit) in life_dispatchUsers)) then { _chan = 1; ((findDisplay 39500) displayCtrl 39530) ctrlSetText "Cop Rem Chan"; } else { ((findDisplay 39500) displayCtrl 39530) ctrlSetText "Cop Add Chan"; };
if (!_isCop && !((getPlayerUID _unit) in life_dispatchUsers)) then { _chan = 1; ((findDisplay 39500) displayCtrl 39528) ctrlSetText "911 Rem Chan"; } else { ((findDisplay 39500) displayCtrl 39528) ctrlSetText "911 Add Chan"; };

if (_flush) then { hint "All players but yourself have been removed from the APD dispatch channel."; }
else
{
	if (_chan > -1) then { hint format["Added %1 to the APD dispatch communications channel.", name _unit]; }
	else { hint format["Removed %1 from the APD dispatch communications channel.", name _unit]; };
};

[[_unit, _chan, true, _flush], "ASY_fnc_manageRadio", false, false] spawn life_fnc_MP;