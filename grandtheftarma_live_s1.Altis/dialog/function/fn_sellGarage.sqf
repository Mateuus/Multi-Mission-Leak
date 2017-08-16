private ["_vehicle", "_vid"];
disableSerialization;
if (lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData [2802, lbCurSel 2802];
_vehicle = (call compile format ["%1", _vehicle]) select 0;
_vid = lbValue [2802, lbCurSel 2802];

if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

if ([format [localize "STR_GTA_MISC_VEHICLE_DELETE_WARNING", getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName")], "Warning", "Yes", "No"] call BIS_fnc_guiMessage) then {
  [[_vid, _vehicle, getPlayerUID player], "GTA_fnc_deleteVehicleFromID", false] call GTA_fnc_remoteExec;
  closeDialog 0;
};
