
/*
    File : fn_storageBox.sqf
    Author: NiiRoZz
    Description:
    Create Storage and attachto player;
*/
private["_object","_attachPos"];
params [
    ["_size",false,[false]]
];
if (!(nearestObject [player, "House"] in lhm_vehicles)) exitWith {hint "Kann nur im Haus aufgestellt werden!";};

lhm_container_active = true;
closeDialog 0;

if (_size) then {
    _object = "B_supplyCrate_F" createVehicle [0,0,0];
} else {
    _object = "Box_IND_Grenades_F" createVehicle [0,0,0];
};

lhm_container_activeObj = _object;
_attachPos = [0.16, 3, ((boundingBoxReal _object) select 1) select 2];
//[_object] remoteExecCall ["lhm_fnc_simDisable",RANY];
[[_object],"lhm_fnc_simDisable",true,false,true] call LHM_fnc_MP;
_object attachTo[player, _attachPos];

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;

titleText [localize "STR_NOTF_PlaceContainer", "PLAIN"];