/*
    File: fn_packuplaterne.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: G00golplexian

    Description:
    Entfernt die Laterne.
*/
private["_laterne"];
_laterne = _this select 3;

if(([true,"laterne",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Laterne entfernt.","PLAIN"];
    detach _laterne;
	deletevehicle _laterne;
};

life_laterne = false;
player removeAction life_action_laterne;