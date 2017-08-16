/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
_container = param [1,ObjNull,[ObjNull]];
if(isNull _container) exitWith {};
call life_fnc_kecedretr;
