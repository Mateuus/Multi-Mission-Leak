/*
    File: fn_packupContainer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: demiced

    Description:
    Packs up a deployed container.
*/
private["_container"];
if((call lhm_medicLevel) > 2) then
{
	_container = nearestObjects[getPos player,["Land_Pod_Heli_Transport_04_medevac_F"],8] select 0;
	if(isNil "_container") exitWith {};

	if(([true,"container",1] call lhm_fnc_handleInv)) then
	{
	    titleText["Du hast den Container aufgehoben.","PLAIN DOWN"];
	    deleteVehicle _container;
	};
}
else
{
	hint "Du bist kein Facharzt!";
};