#include "..\..\..\script_macros.hpp"
/*
 Created by repentz
*/

params [
    ["_vehicle",objNull,[objNull]]
];

private ["_payCheck"];

_payCheck = selectRandom [65000,70000,72500,75000,80000,85000,100000];

civRDM = civRDM + _payCheck;
hint format ["Congratulations, you have completed the transportation mission and recived the reward of $%1. Enjoy!", [_payCheck] call life_fnc_numberText];

["civMission"] spawn mav_ttm_fnc_addExp;
player removeAction life_collectMoneys;
player setVariable ["taskStartCiv",false,true];
