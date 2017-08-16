/*
 Author: Fuzz
 Description: Placeables for the cop\medic sides.
*/
if (!life_barrier_active) exitWith {}; //bad check?
deleteVehicle life_barrier_activeObj;
life_barrier_active = false;
life_barrier_activeObj = ObjNull;