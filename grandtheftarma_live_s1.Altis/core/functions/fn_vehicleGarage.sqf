/*
	File: fn_vehicleGarage.sqf
	Author: Skalicon
	
	Description:
	Handles everything that happens when you open the vehicle garage.
*/
private ["_marker"];

if ((player distance cursorObject) > 5) exitWith {hint "You are too far away to use this NPC."};
if (vehicle player != player) exitWith {hint "You cannot use this npc while in a vehicle."};
if (cursorObject isKindOf "House") then
{
	_marker = format["%1", [cursorObject] call life_fnc_getBuildID];
	if ((getMarkerPos _marker) select 0 == 0) then
	{
		_position = [10, position cursorObject, direction cursorObject, 270] call life_fnc_calcGarageSpawn;
		_marker = createMarker [_marker, _position];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "hd_arrow";
		_marker setMarkerDir (direction cursorObject);
		_marker setMarkerAlpha 0;
	};
	//life_veh_sp = _marker;
	life_garage_sp = _marker;
}
else
{
	[_this select 0] call life_fnc_getSpawnMarker;
};
life_garage_type = "Car";
[[getPlayerUID player,playerSide,life_garage_type,player],"TON_fnc_getVehicles",false,false] call GTA_fnc_remoteExec;
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,"Fetching Vehicles...."];
