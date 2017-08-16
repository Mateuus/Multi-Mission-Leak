/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_prices","_vehicleInfo","_colorArray","_ctrl"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;

private _config = [ _className ] call XY_fnc_vehicleConfig;
if( _config isEqualTo [] ) exitWith {};

_vehicleInfo = [_className] call XY_fnc_fetchVehInfo;

private _isRentable = (_config select 4) >= 1;
private _isBuyable = (_config select 3) >= 1;

ctrlShow [2330, true];

((findDisplay 2300) displayCtrl 2303) ctrlSetStructuredText parseText format[" Kaufpreis: <t color='#8cff9b'>%1</t><br/> Mietpreis: <t color='#8cff9b'>%2</t><br/> Höchstgeschwindigkeit: %3 km/h<br/> PS: %4<br/> Sitzplätze: %5<br/> Tankkapazität: %6l<br/> Kofferraumgröße: %7<br/>",
    ["NICHT VERFÜGBAR", format["%1€", [_config select 3] call XY_fnc_numberText]] select _isBuyable,
    ["NICHT VERFÜGBAR", format["%1€", [_config select 4] call XY_fnc_numberText]] select _isRentable,
    _vehicleInfo select 8,
    _vehicleInfo select 11,
    (_vehicleInfo select 10) + 1,
    [_vehicleInfo select 12] call XY_fnc_numberText,
    [_config select 2] call XY_fnc_numberText
];

_ctrl = (findDisplay 2300) displayCtrl 2304;
lbClear _ctrl;

{
	if( (call (_x select 0)) isEqualTo (XY_currentVehicleShop select 0) ) then {
		_ctrl lbAdd format["%1", _x select 1];
		_ctrl lbSetValue [ (lbSize _ctrl) - 1, _forEachIndex ];
	};
} forEach ([_className] call XY_fnc_colorConfig);

lbSetCurSel[2304, 0];
ctrlShow[2304, (lbSize _ctrl) > 0];

ctrlEnable[2308, _isRentable ];
ctrlEnable[2309, _isBuyable ];

true;