#include "..\..\macros.hpp"
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_vehicleInfo","_colorArray","_ctrl","_groupID","_initalPrice","_buyMultiplier","_rentMultiplier","_classNameLife"];


//Fetch some information.
_className = (_this select 0) lbData (_this select 1);
_classNameLife = _className;
_vIndex = (_this select 0) lbValue (_this select 1);
_vehicleInfo = [_className] call DWEV_fnc_fetchVehInfo;
_trunkSpace = [_className] call DWEV_fnc_vehicleWeightCfg;
_initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");

switch (side player) do
{
    case civilian:
	{
        _buyMultiplier = DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
        _rentMultiplier = DWEV_SETTINGS(getNumber,"vehicle_rental_multiplier_CIVILIAN");
    };
    case west:
	{
        _buyMultiplier = DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
        _rentMultiplier = DWEV_SETTINGS(getNumber,"vehicle_rental_multiplier_COP");
    };
    case independent:
	{
        _buyMultiplier = DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
        _rentMultiplier = DWEV_SETTINGS(getNumber,"vehicle_rental_multiplier_MEDIC");
    };
    case east:
	{
        _buyMultiplier = DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
        _rentMultiplier = DWEV_SETTINGS(getNumber,"vehicle_rental_multiplier_OPFOR");
    };
};
switch (__GETC__(DWEV_donator)) do
{
	case 1: {_buyMultiplier = (_buyMultiplier*0.9); _rentMultiplier = (_rentMultiplier*0.9);};// Premium 10% rabatt
	case 2: {_buyMultiplier = (_buyMultiplier*0.8); _rentMultiplier = (_rentMultiplier*0.8);};// Premium 20% rabatt
	case 3: {_buyMultiplier = (_buyMultiplier*0.7); _rentMultiplier = (_rentMultiplier*0.7);};// Premium 30% rabatt
	case 4: {_buyMultiplier = (_buyMultiplier*0.5); _rentMultiplier = (_rentMultiplier*0.5);};// Premium 50% rabatt
};

if (actionSpendenziel1 && ((__GETC__(DWEV_donator)) isEqualTo 0)) then
{
	_buyMultiplier = (_buyMultiplier*0.9); // 10% rabatt wenn Spendenziel erreicht. Alt Donator bekommen kein extra rabatt.
};

(getControl(IDC_FAHRZEUGSHOP_MAIN,IDC_FAHRZEUGSHOP_VEHICLEINFORMATIONEN_LISTBOX)) ctrlSetStructuredText parseText format[
"
<t color='#000000'>Mietpreis: <t color='#01AC18'>%1€</t><br/>
Kaufpreis: <t color='#01AC18'>%2€</t><br/>
Max. Geschwindigkeit: %3 km/h<br/>
PS: %4<br/>
Beifahrersitzte: %5<br/>
Lagerplatz: %6<br/>
Tank: %7<br/>
Panzerung: %8</t>
",
[round(_initalPrice * _rentMultiplier)] call DWEV_fnc_numberText,
[round(_initalPrice * _buyMultiplier)] call DWEV_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"Keiner"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleInfo select 9
];

_ctrl = getControl(IDC_FAHRZEUGSHOP_MAIN,IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN);
lbClear _ctrl;

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class gibt es nicht",_className];
};

_types = [];

if ((playerside) isEqualTo civilian) then 
{
//	_groupID = grpPlayer getVariable["gang_id",-1];
	_types pushBack "civ";
	if (__GETC__(DWEV_donator) > 0) then {_types pushBack "donate";};
	for "_i" from 1 to (__GETC__(DWEV_adminlevel)) do
	{
		_types pushback format ["admin_%1",_i];
	};
	if (lc_rebel) then {_types pushBack "reb";};
	if (lc_girl) then {_types pushBack "girl";};
	for "_i" from 1 to (__GETC__(DWEV_viplevel)) do
	{
		_types pushback format ["vip_%1",_i];
	};
	// für einzelne gangs eine extra textur
//	if (_groupID == 846 && (__GETC__(DWEV_viplevel) >= 1)) then {_types pushback format ["gang_%1",_groupID];};
};

if ((playerside) isEqualTo west) then 
{
	_types pushBack "cop";
	if (lp_swat) then {_types pushBack "cop_sek";};
	if (lp_zivi) then {_types pushBack "cop_zivi";};
	if (lp_beg) then {_types pushBack "beg";};
	for "_i" from 1 to (__GETC__(DWEV_coplevel)) do
	{
		_types pushback format ["cop_%1",_i];
	};
};

if ((playerside) isEqualTo independent) then 
	{
		_types pushBack "med";
		for "_i" from 1 to (__GETC__(DWEV_medicLevel)) do
		{
			_types pushback format ["med_%1",_i];
		};
	};

if ((playerside) isEqualTo east) then 
{
	_types pushBack "WSC";
	for "_i" from 1 to (__GETC__(DWEV_opforlevel)) do
	{
		_types pushback format ["opfor_%1",_i];
	};
};	


_colorArray = M_CONFIG(getArray,"LifeCfgVehicles",_classNameLife,"textures");
{
    _flag = (_x select 1);
    _textureName = (_x select 0);
	if(_flag in _types) then 
 //   if ((DWEV_veh_shop select 2) isEqualTo _flag) then
	{
        _x params ["_texture"];
        private _toShow = [_x] call DWEV_fnc_levelCheck;
        if (_toShow) then {
            _ctrl lbAdd _textureName;
            _ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
        };
    };
} forEach _colorArray;

_numberindexcolorarray = [];

for "_i" from 0 to (count(_colorArray) - 1) do
{
    _numberindexcolorarray pushBack _i;
};
_indexrandom = _numberindexcolorarray call BIS_fnc_selectRandom;
_ctrl lbSetCurSel _indexrandom;

if (_className in (DWEV_SETTINGS(getArray,"vehicleShop_rentalOnly"))) then
{
	ctrlEnable [IDC_FAHRZEUGSHOP_BUTTON_KAUFEN,false];
	((findDisplay IDC_FAHRZEUGSHOP_MAIN) displayCtrl IDC_FAHRZEUGSHOP_BUTTON_KAUFEN) ctrlSetTooltip "Das Fahrzeug kann man nur mieten!";
} 
else 
{
		if (!(DWEV_veh_shop select 3)) then {
		ctrlEnable [IDC_FAHRZEUGSHOP_BUTTON_KAUFEN,true];
		};
};
lbSetCurSel[IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN,0];

if !((lbSize _ctrl)-1 isEqualTo -1) then 
{
	ctrlShow[IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN,true];
}
 else 
{
	ctrlShow[IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN,false];
	[] call DWEV_fnc_vehicleShopControl;
};
true;