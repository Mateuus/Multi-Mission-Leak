#include <macro.h>
/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Cop Initialization file.
*/
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
[] spawn life_fnc_copMarkers;

if(life_blacklisted) exitWith
{
    endMission "Loser";
};

switch (true) do
{
    case (str(player) in ["Fed_1","Fed_2","Fed_3","Fed_4","Fed_5","_Fed_6"]):
    {
        if(__GETC__(life_adminlevel) < 1)then {endMission "Loser"; } else
        {
            private["_handle"];
            //_handle = player execVM "core\client\fed_init.sqf";
            //waitUntil{scriptDone _handle};
        };
    };
    
///////////////////////////////////MAATTIII////////////////////////////////////////////////    case (!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])):
    case (!(str(player) in ["cop_nil"])):
    {
        switch (true) do
        {
            case(__GETC__(life_coplevel) > 0) : {}; // Do nothing
            case (__GETC__(life_adminlevel) > 0) : {}; //Do nothing
            default {endMission "Loser";};
        };
    };
};

{_x setMarkerAlphaLocal 0} foreach ["meth_1","meth_2","sense_kueche","xtc_beladen","sprengstoff_1","sprengstoff_2","weed_1","Weed_2","coke_area","cocaine_2","cocaine_1","heroin_area","lsd_1","lsd_2","heroin_1","heroin_2","zigarren_2"];

//////////////MATIII////////////////
player setVariable["coplevel", __GETC__(life_coplevel), true]; // Rang Anzeige
player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

switch(__GETC__(life_coplevel)) do
{
	case 1: {life_paycheck = life_paycheck + 100;};
	case 2: {life_paycheck = life_paycheck + 250;};
	case 3: {life_paycheck = life_paycheck + 500;};
	case 4: {life_paycheck = life_paycheck + 750;};
	case 5: {life_paycheck = life_paycheck + 1500;};
	case 6: {life_paycheck = life_paycheck + 1500;};
	case 7: {life_paycheck = life_paycheck + 2500;};
	case 8: {life_paycheck = life_paycheck + 4000;};
	case 9: {life_paycheck = life_paycheck + 4500;};
	case 10: {life_paycheck = life_paycheck + 7000;};
	case 11: {life_paycheck = life_paycheck + 9500;};
	case 12: {life_paycheck = life_paycheck + 10000;};
};

license_civ_dive = true;
//uniform



