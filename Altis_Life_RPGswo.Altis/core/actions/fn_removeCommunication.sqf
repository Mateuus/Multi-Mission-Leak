#include "..\..\macros.hpp"
/*
	File: fn_removeCommunication.sqf
	Author: division-wolf.de
	
	Description:
	entfernt die kommunikation
*/
private["_target"];
_target = cursorTarget;
if((player distance _target > 3)) exitWith {};

	_target unassignItem "ItemMap";
	_target unassignItem "ItemGPS";
	_target unassignItem "ItemRadio";
	
	hint format ["Du hast %1 folgende Gegenstände abgenommen:\n\nSmartphone\nGPS\nLandkarte",getPlayerDName(_target)];
	
	format["%1 hat dir folgende Gegenstände abgenommen:\n\nSmartphone\nGPS\nLandkarte",getMyDName] remoteExec ["hint",_target];