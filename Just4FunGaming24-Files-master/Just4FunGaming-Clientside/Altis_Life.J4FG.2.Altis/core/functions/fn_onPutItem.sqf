private _unit = param[0 , objNull, [objNull]];
private _container = param[1, objNull, [objNull]];
private _item = param[2, "", [""] ];

private _dead = !(alive player) || !(isNil "XY_corpse");
format [ "<PUT> %1 (%2) PUT %3 TO %4 (DEAD: %5)", profileName, getPlayerUID player, _item, _container, _dead] remoteExec ["XY_fnc_log", 2];

if( _dead ) then {
	deleteVehicle _container;
};