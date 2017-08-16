#include <macro.h>
/*
    File: fn_ptoolsUse.sqf
    Author: blaster, Thanks to tonic for code model

    Description:
    Main functionality for prospecting tools in mining.
*/

closeDialog 0;
private["_mine","_mineName","_msg","_shovelLoot","_pickaxeLoot","_itemName","_markerName","_row"];
_mine = "";
_markerName = "";

for "_i" from 0 to ((count PGSERV_res_loot) - 1) do
{
    _markerName = SEL(PGSERV_res_loot, _i) select 0;

    _distanceToMarker = ((getMarkerPos _markerName) distance (vehicle player));

    if (_distanceToMarker < 40) exitWith
    {
        _mine = SEL(PGSERV_res_loot, _i); // select whole mine
    };
};

_mineName = SEL(_mine, 0);

//Mine check
if(EQUAL(_mineName,"")) exitWith {hint localize "STR_MS_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

uiSleep 2;

_msg = format["Gestein Analyse App 0.1\nMine: %1\n\nSchaufel:\n", _mineName];
_shovelLoot = _mine select 1;
_pickaxeLoot = _mine select 2;

for "_i" from 0 to ((count _shovelLoot) - 1) do
{
    _row = _shovelLoot select _i;
    _itemName = M_CONFIG(getText,"VirtualItems",(SEL(_shovelLoot, _i) select 0),"displayName");
    _msg = _msg + format["%1: %2%3\n", localize _itemName, (SEL(_shovelLoot, _i) select 1), "%"];
};

_msg = _msg + "\nSpitzhacke:\n";

for "_i" from 0 to ((count _pickaxeLoot) - 1) do
{
    _itemName = M_CONFIG(getText,"VirtualItems",(SEL(_pickaxeLoot, _i) select 0),"displayName");
    _msg = _msg + format["%1: %2%3\n", localize _itemName, (SEL(_pickaxeLoot, _i) select 1), "%"];
};

hint _msg;