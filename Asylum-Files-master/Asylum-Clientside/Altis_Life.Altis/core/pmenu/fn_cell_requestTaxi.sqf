/*
	File: fn_cell_requestTaxi.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Sends a request for taxi pickup.
*/

if (!alive player) exitWith {};
if ((life_last_taxi > 0) && ((time - life_last_taxi) < 300)) exitWith{ hint "You may only call for a taxi once every 5 minutes."; };

life_last_taxi = time;
[player,"life_fnc_taxiRequest",civilian,FALSE] spawn life_fnc_MP;
[player,"life_fnc_taxiRequest",independent,FALSE] spawn life_fnc_MP;

hint "A taxi has been called.  Note that taxis are not always available.";