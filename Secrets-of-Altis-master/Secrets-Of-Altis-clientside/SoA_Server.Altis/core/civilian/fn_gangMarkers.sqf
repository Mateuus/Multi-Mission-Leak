#include <macro.h>
/*
File: fn_gangMarkers.sqf
Author: Bryan "Tonic" Boardwine
Edited by: Siro @ LinkD.Gaming
*/
private["_markers","_gangMembers"];
_markers = [];
_gangMembers = [];

sleep 0.5;
if(visibleMap) then {
_gangMembers = units grpPlayer;
{
_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTypeLocal "Mil_dot";
_marker setMarkerTextLocal format["%1", name _x];

_markers set[count _markers,[_marker,_x]];

} foreach _gangMembers;
while {visibleMap} do
{
{
private["_marker","_unit"];
_marker = _x select 0;
_unit = _x select 1;
if(!isNil "_unit") then
{
if(!isNull _unit) then
{
_marker setMarkerPosLocal (visiblePosition _unit);
};
};
} foreach _markers;
if(!visibleMap) exitWith {};
sleep 0.02;
};

{deleteMarkerLocal (_x select 0);} foreach _markers;
_markers = [];
_gangMembers = [];
};