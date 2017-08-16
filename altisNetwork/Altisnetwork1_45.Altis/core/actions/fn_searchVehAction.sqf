#include "..\..\script_macros.hpp"
/*
    File: fn_searchVehAction.sqf
    Author:

    Description:

*/
private["_vehicle","_data", "_upp", "_ui", "_progress", "_pgText", "_cP"];
_vehicle = cursorObject;
if ((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then {
    _owners = _vehicle getVariable "vehicle_info_owners";
    if (isNil "_owners") exitWith {
        [localize "STR_NOTF_VehCheat",true,"fast"] call life_fnc_notification_system;
        };

    life_action_inUse = true;
    //hint localize "STR_NOTF_Searching";

_upp = localize "STR_NOTF_Registration";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep 0.09;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if (_cP >= 1) exitWith {};
    if (player distance _vehicle > 10) exitWith {};
    if (!alive player) exitWith {};
};

5 cutText ["","PLAIN"];

    //sleep 3;
    life_action_inUse = false;

    if (player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {
        [localize "STR_NOTF_SearchVehFail",true,"fast"] call life_fnc_notification_system;
        };
    //_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
    //if (isNil {_inventory}) then {_inventory = "Nothing in storage."};
    _owners = [_owners] call life_fnc_vehicleOwners;

    if (_owners == "any<br/>") then {
        _owners = "No owners, impound it<br/>";
    };
    hint parseText format[localize "STR_NOTF_SearchVeh",_owners];
};
