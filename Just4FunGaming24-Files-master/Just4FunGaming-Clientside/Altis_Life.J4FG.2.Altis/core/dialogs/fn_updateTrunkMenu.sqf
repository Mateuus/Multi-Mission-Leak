// fn_updateTrunkMenu.sqf
// by Kupferkarpfen

private["_mode", "_display"];

_mode = param [0, 0, [0]];

_display = findDisplay 2001;

if( _mode isEqualTo 0 ) exitWith {
    (_display displayCtrl 3501) ctrlSetText getText(configFile >> "CfgVehicles" >> (typeOf XY_trunkVehicle) >> "displayName");
};