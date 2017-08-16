#include "..\..\script_macros.hpp"
/*---------------------------------------------------------------------------
    File: fn_upgradeVehicle.sqf
    Author: Skrow & Skyfezzer
    Date: 06/03/2017
    Description:
        *************************
---------------------------------------------------------------------------*/

private["_nearVehicles","_trunk","_insurance","_security","_gps","_hooks","_display","_hooksctrl","_gpsctrl","_securityctrl"];

_mode = [_this,0,-1,[0]] call BIS_fnc_param;
if(_mode == -1) exitWith {};
disableSerialization;

if(isNil "upgradeVehicle") exitWith {hint "Aucun véhicule proche de la zone de mise à niveau"};
if(isNull upgradeVehicle) exitWith {};

if (BANK < upgrade_price) exitWith {hint "Vous n'avez pas asser d'argent pour modifier votre véhicule.";};

switch (_mode) do
{
    case 0:
    {
        _gps = false;
        _hooks = false;
        _security = false;
        
        _display = findDisplay 5500;
        
        _insurance = round(sliderPosition 5502);
        _trunk = round(sliderPosition 5501);
        
        _securityctrl = _display displayCtrl 5503;
        _hooksctrl = _display displayCtrl 5504;
        _gpsctrl = _display displayCtrl 5505;
        
        _gps = cbChecked _gpsctrl;
        _hooks = cbChecked _hooksctrl;
        _security = cbChecked _securityctrl;
        
        upgradeVehicle setVariable["gps",_gps,true];
        upgradeVehicle setVariable["hooks",_hooks,true];
        upgradeVehicle setVariable["insurance",_insurance,true];
        upgradeVehicle setVariable["security",_security,true];
        upgradeVehicle setVariable["trunklevel",_trunk,true];
        
        
    };
    default
    {
        diag_log "No Mode passed in";
    };
};



[[upgradeVehicle],"TON_fnc_updateUpgrades",false,false] spawn life_fnc_MP;

SUB(BANK,upgrade_price);

