/*
    File: fn_radar.sqf
    Author: Silly Aussie kid named Jaydon

    Description:
    Looks like weird but radar?
*/
if !(playerSide isEqualTo west) exitWith {};
private ["_speed","_vehicle"];
_vehicle = cursorObject;
_speed = round speed _vehicle;

if ((_vehicle isKindOf "Car") && (currentWeapon player) isEqualTo "hgun_Pistol_heavy_01_snds_F") then {
    switch (true) do {
        case (_speed > 5 && _speed <= 50): {
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#33CC33'><t align='center'><t size='1'>" +(localize "STR_Cop_VehSpeed"),round  _speed];
        };

        case (_speed > 50 && _speed <=120): {
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#FF8400'><t align='center'><t size='1'>" +(localize "STR_Cop_VehSpeed"),round  _speed];
        };

        case (_speed > 120): {
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#FF0000'><t align='center'><t size='1'>" +(localize "STR_Cop_VehSpeed"),round  _speed];
        };
    };
};
