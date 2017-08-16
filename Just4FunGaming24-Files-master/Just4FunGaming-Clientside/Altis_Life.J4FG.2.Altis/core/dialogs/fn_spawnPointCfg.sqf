/*
    File: fn_spawnPointCfg.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration for available spawn points depending on the units side.

    Return:
    [Spawn Marker,Spawn Name,Image Path]
*/

//Spawn Marker, Spawn Name, PathToImage

private _ret = [];
switch ( playerSide ) do {
    case west: {
        _ret pushBack ["cop_spawn_1", "Kavala HQ", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        _ret pushBack ["cop_spawn_2", "Pyrgos HQ", "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"];
        _ret pushBack ["cop_spawn_3", "Altis Mitte", "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"];
        _ret pushBack ["cop_spawn_4", "Sofia HQ", "\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
    };
    case civilian: {
        _ret pushBack ["civ_spawn_2", "Pyrgos", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        _ret pushBack ["civ_spawn_1", "Kavala", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        _ret pushBack ["civ_spawn_3", "Athira", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        _ret pushBack ["civ_spawn_4", "Sofia", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

        if( license_civ_rebel ) then {
            _ret pushBack ["reb_spawn_1", "Rebellen-HQ Süd", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
            _ret pushBack ["reb_spawn_2", "Rebellen-HQ Nord", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        };

        if(count XY_houses > 0) then {
            {
                _pos = call compile format["%1", _x select 0];
                _house = nearestBuilding _pos;
                _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

                _ret pushBack [format["house_%1", _house getVariable "uid"], _houseName, "\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
            } forEach XY_houses;
        };
    };
    case independent: {
        _ret pushBack ["medic_spawn_1", "Kavala Krankenhaus", "\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
        _ret pushBack ["medic_spawn_2", "Athira Krankenhaus", "\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
        _ret pushBack ["medic_spawn_3", "Medic Aussenstelle", "\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
    };
    case east: {
        _ret pushBack ["thw_spawn_1", "Kavala THW", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        _ret pushBack ["thw_spawn_2", "THW Außenstelle", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
    };
    default {
        // WTF?
        diag_log "WTF";
    };
};

_ret;