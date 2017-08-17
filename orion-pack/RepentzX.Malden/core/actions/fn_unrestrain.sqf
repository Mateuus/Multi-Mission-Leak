#include "..\..\script_macros.hpp"
/*
    File: fn_unrestrain.sqf
    Author:

    Description:

*/
private ["_unit"];
_unit = param [0,objNull,[objNull]];
if(!([false,"keys",1] call life_fnc_handleInv)) exitWith { ["You dont have Handcuff key's",false,"slow"] call life_fnc_notificationSystem; };
[true,"keys",1] call life_fnc_handleInv; 
if (isNull _unit || !(_unit getVariable ["restrained",false])) exitWith {}; //Error check?

_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["tied", false, true];
_unit setVariable ["gagged",false,true];
_unit setVariable ["blindfolded", nil, true];
detach _unit;

_player = player;

[player,"handcuffsoff"] remoteexeccall ["say3D",0];


[0,"STR_NOTF_Unrestrain",true,[_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];