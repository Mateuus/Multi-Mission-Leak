/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	A short function for telling the player to add a vehicle to his keychain.
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];
if (isNil "DWEV_vehicles") then {DWEV_vehicles = []; diag_log "!!!!! ACHTUNG !!!!!! Die Variable DWEV_vehicles wurde nicht richtig Initialisiert";};
if(!(_vehicle in DWEV_vehicles)) then
{
	DWEV_vehicles pushBack _vehicle;
};