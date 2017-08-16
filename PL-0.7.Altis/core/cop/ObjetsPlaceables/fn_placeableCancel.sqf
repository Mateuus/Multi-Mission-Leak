/*---------------------------------------------------------------------------
	File: fn_placeableCancel.sqf
	Description:
		Action d'annuler la pose d'un objet
---------------------------------------------------------------------------*/
if (!life_barrier_active) exitWith {};
deleteVehicle life_barrier_activeObj;
life_barrier_active = false;
life_barrier_activeObj = ObjNull;
