#include "..\..\macros.hpp"
/*
	File: fn_vehicleShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_conditions","_control"];
(_this select 3) params [
    ["_shop","",[""]],
    ["_sideCheck",sideUnknown,[civilian]],
    ["_spawnPoints","",["",[]]],
    ["_shopFlag","",[""]],
    ["_shopTitle","",[""]],
    ["_disableBuy",false,[true]]
];
disableSerialization;

//Long boring series of checks
if (dialog) exitWith {};
if (_shop isEqualTo "") exitWith {};
if (!(_sideCheck isEqualTo sideUnknown) && {!(playerSide isEqualTo _sideCheck)}) exitWith {hint "Du hast keine berechtigung den Laden zu nutzen!"};

_conditions = M_CONFIG(getText,"CarShops",_shop,"conditions");
if !([_conditions] call DWEV_fnc_levelCheck) exitWith {hint "Du bist nicht befugt, dieses Geschäft zu benutzen!"};

if(!createDialog "DWEV_Vehicle_Shop_v2") exitWith {};

DWEV_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it. // wenn nicht geht dann _disableBuy raus

if(_disableBuy) then 
{
	ctrlEnable [IDC_FAHRZEUGSHOP_BUTTON_KAUFEN,false]; //Disable the buy button.
};

//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");

_control = ((findDisplay IDC_FAHRZEUGSHOP_MAIN) displayCtrl IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN);

lbClear _control; //Flush the list.
//ctrlShow [2330,false]; //haben wir nicht gehabt
ctrlShow [IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN,false];

//Loop through
{
    _x params["_className"];

    private _toShow = [_x] call DWEV_fnc_levelCheck;

    if (_toShow) then {
        _vehicleInfo = [_className] call DWEV_fnc_fetchVehInfo;
        _control lbAdd (_vehicleInfo select 3);
        _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
        _control lbSetData [(lbSize _control)-1,_className];
        _control lbSetValue [(lbSize _control)-1,_forEachIndex];
    };
} forEach _vehicleList;

lbSetCurSel[IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN,0];