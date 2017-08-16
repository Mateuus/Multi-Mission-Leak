/*
    File: fn_packupklappstuhl.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: G00golplexian

    Description:
    Sammelt das ausgelegte Sperrmaterial wieder ein.
*/
private["_klappstuhl"];
_klappstuhl = nearestObjects[getPos player,["Land_CampingChair_V1_F"],8] select 0;
if(isNil "_klappstuhl") exitWith {};

if(([true,"klappstuhl",1] call life_fnc_handleInv)) then
{
    titleText["Du hast den Klappstuhl eingepackt.","PLAIN"];
    deleteVehicle _klappstuhl;
	life_klappstuhlaktiv = false;
};