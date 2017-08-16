/*
    File: fn_dpFinish.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Finishes the DP Mission and calculates the money earned based
    on distance between A->B
*/

private _dp = param[0, objNull, [objNull]];

if( XY_lastAirVehicle > 0 && time - XY_lastAirVehicle < 600 ) exitWith {
    hint "Du hast in den letzten 10 Minuten einen Helikopter benutzt: Liefer-Missionen müssen über Landfahrzeuge erledigt werden!";
};

XY_deliveryInProgress = false;
XY_dpPoint = nil;

_dis = round((getPos XY_dpStart) distance (getPos _dp));
_price = round( (2 + ( random 10)) * _dis);

hint format[localize "STR_NOTF_Earned_1", [_price] call XY_fnc_numberText];

XY_currentTask setTaskState "Succeeded";
player removeSimpleTask XY_currentTask;

XY_CC = XY_CC + _price;
[0] call XY_fnc_updatePartial;