/*
	File: fn_dispatchMessage.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Process messaging actions in dispatch.
	Please ask for permission to use this and stop stealing my stuff.
*/

disableSerialization;

private ["_type","_text","_cop","_task"];

_type = [_this,0,0,[0]] call BIS_fnc_param;

if (isNull (findDisplay 39500)) exitWith {};
if (playerSide != west) exitWith {};

_text = ctrlText 39516;
if (_text == "") exitWith {};
ctrlSetText [39516, ""];

switch (_type) do
{
	case 0:
	{
		if ((lbCurSel 39510) < 0) exitWith {};
		_unit = call compile (((findDisplay 39500) displayCtrl 39510) lbData (lbCurSel 39510));
		[[_text,profileName,0],"life_fnc_clientMessage",_unit,false] spawn life_fnc_MP;
	};
	case 1:
	{
		if ((lbCurSel 39514) < 0) exitWith {};
		_task = call compile (((findDisplay 39500) displayCtrl 39514) lbData (lbCurSel 39514));
		{
			[[_text,profileName,0],"life_fnc_clientMessage",_x,false] spawn life_fnc_MP;
		} forEach (_task select 4);
	};
	case 2:
	{
		if ((lbCurSel 39514) < 0) exitWith {};
		_task = call compile (((findDisplay 39500) displayCtrl 39514) lbData (lbCurSel 39514));
		_unit = objNull;
		{ if (getPlayerUID _x == (_task select 6)) then { _unit = _x; } } forEach allPlayers;
		if (isNull _unit) exitWith { hint format["The issuer of this call is no longer on %1.", worldName] };
		[[_text,profileName,0],"life_fnc_clientMessage",_unit,false] spawn life_fnc_MP;
	};
};