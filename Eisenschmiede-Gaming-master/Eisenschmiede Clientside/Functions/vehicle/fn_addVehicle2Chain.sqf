/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	A short function for telling the player to add a vehicle to his keychain.
*/
private "_vehicle";
_vehicle = param [0,ObjNull,[ObjNull]];
if(!(_vehicle in ES_vehicles)) then {
	ES_vehicles pushBack _vehicle;
};