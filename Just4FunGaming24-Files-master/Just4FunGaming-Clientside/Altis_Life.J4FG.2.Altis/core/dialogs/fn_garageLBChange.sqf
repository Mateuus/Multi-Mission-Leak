/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;

private _control = _this select 0;
private _index = _this select 1;

private _dataArr = _control lbData _index; 
_dataArr = call compile format["%1", _dataArr];

private _chipTuning = (switch(_dataArr select 3) do {
    case 1: { "Eco" };
    case 2: { "Sport" };
    case 3: { "Race" };
    case 4: { "Insane" };
    case 5: { "Ludicrous" };
    default { "Nein" };
});

private _className = _dataArr select 0;

// get vehicle skins
private _colorConfig = [_className, _dataArr select 1] call XY_fnc_colorConfig;
private _colorName = "Standard";
if( !(_colorConfig isEqualTo []) ) then {
    _colorName = _colorConfig select 1;
};

private _locked = _dataArr select 2;
private _vehicleInfo = [_className] call XY_fnc_fetchVehInfo;

private _config = [ _className ] call XY_fnc_vehicleConfig;
if( _config isEqualTo [] ) exitWith {};

((findDisplay 2800) displayCtrl 2803) ctrlSetStructuredText parseText format[
    "<br/>" +
	" Ausparkgebühr: <t color='#8cff9b'>%1€</t><br/>" +
	" Verkaufserlös: <t color='#8cff9b'>%2€</t><br/>" +
	" Lackierung: %3<br/>" +
	" Höchstgeschwindigkeit: %4 km/h<br/>" +
	" Sitzplätze: %5<br/>" +
	" Chip-Tuning: %6<br/>" +
	" Tankkapazität: %7l<br/>" +
	" Kofferraumgröße: %8<br/>" +
	"%9",
    [_config select 6] call XY_fnc_numberText,
    [(_config select 3) * XY_ssv_SF] call XY_fnc_numberText,
    _colorName,
    _vehicleInfo select 8,
    (_vehicleInfo select 10) + 1,
    _chipTuning,
    [_vehicleInfo select 12] call XY_fnc_numberText,
    [_config select 2] call XY_fnc_numberText,
    if(_locked == 1) then {"<t color='#FF0000'>Fahrzeug beschlagnahmt, bei THW melden</t>"} else {""}
];

ctrlEnable [2885, _locked != 1 ];
ctrlEnable [2886, _locked != 1 ];

ctrlShow [2803, true];
ctrlShow [2830, true];