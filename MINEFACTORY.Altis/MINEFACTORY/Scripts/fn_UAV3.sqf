/*
	Zeon, MineFactory.eu
*/
private["_vehicle","_veh"];
_vehicle = typeOf cursorTarget;
if (_vehicle == "B_Truck_01_transport_F") then {
			_veh = createVehicle ["B_UAV_02_F",  position player , [], 0, "NONE"];
			createVehicleCrew _veh;
			if (!isNull _veh) then {
            life_vehicles set[count life_vehicles,_veh];
			} else {hint "FAILED: Your _veh returned nothing.";};
			{   diag_log [_x, faction _x, side _x, side group _x];  } forEach crew _veh; {unassignVehicle_x} forEach units NamederGruppe;
			_veh setVehicleAmmo 0;
			[_veh] call life_fnc_clearVehicleAmmo;
} else 
{hint "Es ist kein UAV im Fahrzeug verhanden";};