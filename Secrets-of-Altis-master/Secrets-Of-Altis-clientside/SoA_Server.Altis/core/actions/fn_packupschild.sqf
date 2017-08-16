/*
    File: fn_packupschild.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: G00golplexian

    Description:
    Entfernt das Schild.
*/
private["_schild"];
_schild = _this select 3;

if(([true,"protestschild",1] call life_fnc_handleInv)) then
{
    titleText["Du hast das Protestschild entfernt.","PLAIN"];
    detach _schild;
	deletevehicle _schild;
};

life_schild = false;
player removeAction life_action_schild;