// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// based on work by Tonic

private["_vehicle", "_isHouse", "_mWeight", "_vehicleData"];

if( dialog ) exitWith {};

if( !params[
    [ "_vehicle", objNull, [objNull] ]
    ]) exitWith {};

_isHouse = _vehicle isKindOf "House_F";

if( !(_vehicle isKindOf "Car" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship" || _isHouse) ) exitWith {};

if( (_vehicle getVariable ["lockedUntil", 0]) > servertime ) exitWith {
	hint "Das Fahrzeug ist bereits beschäftigt oder in Benutzung";
};

if( _isHouse ) then {
    _mWeight = 0;
    {
        _mWeight = _mWeight + (( [typeOf _x] call XY_fnc_vehicleConfig ) select 2);
    } forEach ( _vehicle getVariable["containers", []] );
    _vehicleData = [ _mWeight, (_vehicle getVariable["trunk", [[], 0]]) select 1 ];

} else {
    _vehicleData = [ _vehicle ] call XY_fnc_vehicleWeight;
};

if( _isHouse && {(_vehicle getVariable ["containers", []]) isEqualTo []} ) exitWith {
    hint localize "STR_MISC_NoStorageWarn";
};
if( !_isHouse && { (_vehicleData select 0) <= 0 } ) exitWith {
    hint localize "STR_MISC_NoStorageVeh";
};
if( [_vehicle] call XY_fnc_inUse ) exitWith {
    hint format["Das %1 ist bereits in Benutzung", ["Fahrzeug", "Haus"] select _isHouse];
};

disableSerialization;
createDialog "XY_dialog_trunk";

ctrlSetText[ 3501, getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName") ];
ctrlSetText[ 3508, ["Kofferraum", "Lager"] select _isHouse ];
ctrlSetText[ 3504, format[(localize "STR_MISC_Weight") + " %1/%2", _vehicleData select 1, _vehicleData select 0] ];

[_vehicle] call XY_fnc_vehInventory;
XY_trunkVehicle = _vehicle;

_vehicle spawn {

    private _vehicle = _this;
    private _isHouse = _vehicle isKindOf "House_F";

    private _isOwner = false;
    private _isLocked = false;
    waitUntil { _isLocked = ( !(_vehicle in XY_vehicles) && (locked _vehicle) == 2 ); _isOwner = !([_vehicle] call XY_fnc_inUse); !_isOwner || _isLocked || isNull (findDisplay 3500) };

    // Trunk was open and vehicle owner locked it...
    if( _isLocked ) then {
        closeDialog 0;
        hint "Das Fahrzeug wurde abgeschlossen";
    };

    if( !_isOwner ) exitWith {
        closeDialog 0;
        format [ "<TRUNK_TAMPER> %1 (%2) opened vehicle %3 trunk @ %4, owner changed to %5", profileName, getPlayerUID player, _vehicle, mapGridPosition player, _vehicle getVariable ["usedBy", ""] ] remoteExec ["XY_fnc_log", 2];
        hint "Jemand anderes benutzt den Kofferraum bereits";

        // force closing on other side by overwriting usedBy variable...
        _vehicle setVariable ["usedBy", "CLOSE", true];
        sleep (random 2);        
        _vehicle setVariable ["usedBy", "CLOSE", true];
        sleep (random 2);
        // remove vehicle lock...
        [_vehicle, true] call XY_fnc_inUse;
    };

    // Retrieve local trunk copy...
    private _temp = _vehicle getVariable["trunk", []];
    if ( _temp isEqualTo [] ) then {
        hint "Irgendwas hat beim Speichern des Kofferraums nicht geklappt";
        format [ "<CERROR> %1 (%2) got a vehicle without valid trunk", profileName, getPlayerUID player] remoteExec ["XY_fnc_log", 2];
    } else {
        // Publish trunk contents
        _vehicle setVariable["trunk", _temp, true];
    };

    sleep 1;

    [_vehicle] remoteExec [ ["XYDB_fnc_updateVehicle", "XYDB_fnc_updateHouseTrunk"] select _isHouse, XYDB];
    [_vehicle, true] call XY_fnc_inUse;

    XY_forceSaveTime = time;
};