/*
Filename: init_fuelstation.sqf
Author: MarioF
Modified by: Altis Life Germany

Description: initialize Gas Station Scripts

*/
if (isServer) then {
    private["_var","_markername","_marker"];
    life_fuelstation_stationlist = (nearestObjects [getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["Land_fs_feed_F","Land_CarService_F"], 25000]);
    _var = 0;

    {
        _nearPump = nearestObjects [getPos _x, ["Land_fs_feed_F"], 45];
        if (_x isKindOf "Land_CarService_F" && count _nearPump > 0) then {
            _var = _var + 1;
            _markername = format ["%1",_var];
            _marker = createMarker ["GasMarker_"+_markername, getPos _x];
            _marker setMarkerColor "ColorGreen";
            _marker setMarkerText "Tankstelle";
            _marker setMarkerType "loc_Fuelstation";
        };
        _x setFuelCargo 0;
    } forEach life_fuelstation_stationlist;

    publicVariable "life_fuelstation_stationlist";
};

if (!isDedicated) then {

    life_fuelstation_price = 0;
    life_fuelstation_lockVeh = objNull;
    life_fuelstation_fueltruck = objNull;
    life_fuelstation_amount = 0;
    life_fuelstation_fitamount = 0;
    life_fuelstation_cfgTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F"];

    [] spawn PG_fnc_initFuelstations;
};