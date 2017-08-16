/*
	File: fn_removeHideout.sqf
	Author: Blackd0g

	Description:
	remove all objects from a hideout with gangid and trigger db procedure.
*/
private ["_hideout","_gangId","_hideoutPos","_objects","_items"];
closeDialog 0;
if ((call lhm_adminlevel) < 3) exitWith {Hint "You need Adminlevel 3 to do this!"};

CleanupVehicleList = "";
CleanupVehicleList = ">>> Removing Hideout <<<\n";
hint CleanupVehicleList;

_hideout = nearestObject [player, "Flag_Quontrol_F"];
_gangId = _hideout getVariable ["gangarea_id",-1];
_hideoutPos  = getPos _hideout;

if (isNull _hideout) exitWith {Hint "You need to be closer to a Gang-Starting Point!"};
if (_gangId == -1) exitWith {Hint "Gang ID Error"};

_objects = (nearestObjects [_hideoutPos, ["Building","Thing"], 60]);
_items = count _objects;
{
	if (_x != objNull) then
	{
		deleteVehicle _x;
		CleanupVehicleList = CleanupVehicleList + format["'%1'\n",typeOf _x];
		hint CleanupVehicleList;
	};
sleep 0.5;
} forEach _objects;

CleanupVehicleList = CleanupVehicleList + format["\nRemoved %1 Objects",_items];
hint CleanupVehicleList;

[[_gangID],"build_fnc_deleteHideout",false,false] call lhm_fnc_mp;

[["admin",(format["%1 with UID %2 removed a Gang Hideout - ID %3 | Pos %4",name player,getPlayerUID player,_gangID,_hideoutPos])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;