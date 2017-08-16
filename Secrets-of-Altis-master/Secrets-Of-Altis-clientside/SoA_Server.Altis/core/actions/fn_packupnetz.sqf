/*
    File: fn_packupholzb.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: G00golplexian

    Description:
    Sammelt das ausgelegte Sperrmaterial wieder ein.
*/
private["_netz"];
_netz = nearestObjects[getPos player,["CamoNet_INDP_big_F"],8] select 0;
if(isNil "_netz") exitWith {};

if(([true,"netz",1] call life_fnc_handleInv)) then
{
    titleText["Du hast das Tarnnetz abgebaut.","PLAIN"];
    deleteVehicle _netz;
	life_netzaktiv = false;
};