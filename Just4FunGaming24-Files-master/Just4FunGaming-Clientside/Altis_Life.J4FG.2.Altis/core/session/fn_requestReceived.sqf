/*
    File: fn_requestReceived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called by the server saying that we have a response so let's
    sort through the information, validate it and if all valid
    set the client up.
*/
XY_sessionTries = XY_sessionTries + 1;
if(XY_sessionCompleted) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(XY_sessionTries > 3) exitWith {cutText["Fehler bei der Kommunikation mit dem Server", "BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [ "Verarbeite Spielerdaten...", "BLACK FADED" ];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call XY_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call XY_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call XY_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call XY_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call XY_fnc_dataQuery;};

//Parse basic player information.
XY_CC = parseNumber (_this select 2);
XY_CA = parseNumber (_this select 3);
XY_adminLevel = parseNumber(_this select 4);

//Loop through licenses
{
    missionNamespace setVariable [(_x select 0), (_x select 1)];
} forEach (_this select 5);

[_this select 7] call XY_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
    case west: {
        XY_copLevel = parseNumber(_this select 6);
    };
    case civilian: {
        XY_isArrested = _this select 6;
        XY_houses = _this select 8;
        {
            _house = nearestBuilding (call compile format["%1", _x select 0]);
            XY_vehicles pushBack _house;
        } forEach XY_houses;

        [_this select 9] call XY_fnc_initGang;

        [] call XY_fnc_initHouses;
    };

    case independent: {
        XY_medicLevel = parseNumber(_this select 6);
    };

    case east: {
        XY_thwLevel = parseNumber(_this select 6);
    };
};

private _spawnData = if( playerSide isEqualTo civilian ) then { _this select 10 } else { _this select 8 };

XY_spawnPos = [];
XY_spawnHealth = [];

if( !(_spawnData isEqualTo []) )then {
    XY_spawnPos = _spawnData select 0;
    XY_spawnHealth = _spawnData select 1;
};

// Poll tracked keys from main server
[player, playerSide] remoteExec [ "XY_fnc_pollKeychain", 2 ];

XY_sessionCompleted = true;