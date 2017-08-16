/*
    Author: H4SHK3KS (ofpectag: PoA)
    File: fn_resetStackedEVH.sqf

    Written for Pirates of Altis
    http://pirates-of-altis.de/
    The usage of this file is restricted to allowed servers (e.g. PoA)
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!

    Description:
    Resets all stacked evh

    Parameters:
    None

    Returns:
    Nothing
*/
{
	_event = _x;
	_namespaceId = "BIS_stackedEventHandlers_";
	_namespaceEvent = _namespaceId + _event;
	_data = missionNameSpace getVariable [_namespaceEvent, []];
	{
		private "_itemId";
		_itemId	= [_x, 0, "", [""]] call BIS_fnc_param;
		[_itemId,_event] call bis_fnc_removeStackedEventHandler;
	} forEach _data;
} forEach ["oneachframe", "onpreloadstarted", "onpreloadfinished", "onmapsingleclick", "onplayerconnected", "onplayerdisconnected"];