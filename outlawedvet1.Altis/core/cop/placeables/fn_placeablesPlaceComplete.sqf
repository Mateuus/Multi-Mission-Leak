private["_federal","_policeHQ","_PoliceAthira","_PolicePygros","_jail","_spawn"];
disableSerialization;

_federal = getMarkerPos "fed_reserve";
_policeHQ = getMarkerPos "police_hq_1";
_PoliceAthira = getMarkerPos "police_hq_3";
_PolicePygros = getMarkerPos "police_hq_2";
_jail = getMarkerPos "Correctional Facility";
_spawn = getMarkerPos "respawn_civilian";

if(_federal distance player < 150) exitWith { hint "Can't use barricades so close to the federal reserve"};
if(_policeHQ distance player < 69) exitWith { hint "Can't use barricades so close to the Police HQ"};
if(_PoliceAthira distance player < 76) exitWith { hint "Can't use barricades so close to the Police HQ"};
if(_PolicePygros distance player < 86) exitWith { hint "Can't use barricades so close to the Police HQ"};
if(_jail distance player < 50) exitWith { hint "Can't use barricades so close to the jail"};
if(_spawn distance player < 170) exitWith { hint "Can't use barricades so close to spawn"};

if (!life_placeable_placing_active) exitWith {};
if (life_placeable_active_object == ObjNull) exitWith {};


_currentPos = getPosATL life_placeable_active_object;
detach life_placeable_active_object;


life_placeable_active_object setPos[(getPos life_placeable_active_object select 0), (getPos life_placeable_active_object select 1), 0];

life_placeable_active_object enableSimulationGlobal true;
life_placeable_active_object allowdamage false;

/*
if (life_placeable_active_object isequalto "") then {
} else {

};
*/

life_placeables_placed pushBack life_placeable_active_object;

life_placeable_placing_active = false;
life_placeable_active_object = ObjNull;