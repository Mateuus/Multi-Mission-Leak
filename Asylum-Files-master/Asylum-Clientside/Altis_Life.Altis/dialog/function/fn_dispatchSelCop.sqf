/*
	File: fn_dispatchSelCop.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player has selected a cop as target in dispatch.
	Please ask for permission to use this and stop stealing my stuff.
*/

disableSerialization;

if (isNull (findDisplay 39500)) exitWith {};
if (playerSide != west) exitWith {};

_copList = (findDisplay 39500) displayCtrl 39510;
_cop = call compile (_copList lbData (lbCurSel 39510));

if (isNull _cop) exitWith {ctrlEnable [39518, false];ctrlEnable [39512, false];ctrlEnable [39530, false];ctrlEnable [39534, false];};

ctrlEnable [39518, true];
ctrlEnable [39530, true];
ctrlEnable [39534, true];
if ((lbCurSel 39514) > -1) then { ctrlEnable [39512, true] };

[(findDisplay 39500) displayCtrl 39501, 1, 0.1, getPos _cop] call life_fnc_setMapPosition;

_isActive = false;
if (!isNil "life_dispatchTasks") then
{
	{
		if (count (_x select 4) > 0) then
		{
			_task = _x;
			{
				if (_x == _cop) then { _isActive = true };
			} forEach (_task select 4);
		};
	} forEach life_dispatchTasks;
};

_label = if (_isActive) then { "Unassign" } else { "Assign Task" };
ctrlSetText [39512, _label];

_label = "Cop Add Chan";
if ((getPlayerUID _cop) in life_dispatchUsers) then { _label = "Cop Rem Chan"; };
((findDisplay 39500) displayCtrl 39530) ctrlSetText _label;