// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_success"];

if( !params[
        [ "_success", false, [false] ]
    ]) exitWith {};

if( !_success ) exitWith {

    hint (_this select 1);

    XY_CA = XY_CA + XY_gangPrice;
    [0] call XY_fnc_updatePartial;
};

hint "Die Gang wurde erstellt";