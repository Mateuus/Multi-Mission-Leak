diag_log "clean start";

if (isNil "carArray") then {
    carArray = [];
};

if (isNil "carPosition") then {
    carPosition = [];
};

{
    if (((count crew _x) == 0 && isNull driver vehicle _x && isNull attachedTo _x) || getdammage _x == 1) then {
		if(_x in carArray) then {
			_pia = cararray FIND _x;
			_location = carposition SELECT _pia;
			cararray deleteAT _pia; carposition deleteAT _pia;
			if(_x distance _location < 5) then { deleteVehicle _x; };
		} else {
			cararray pushback _x;
			carposition pushback getpos _x;	
		};
    };
} foreach vehicles;


_list = (allMissionObjects "WeaponHolder") +
    (allMissionObjects "GroundWeaponHolder") +
    (allMissionObjects "WeaponHolderSimulated") +
    (allMissionObjects "SmokeShell") +
    (allMissionObjects "CraterLong") +
    (allMissionObjects "CraterShort") +
    (allMissionObjects "StaticWeapon") +
    (allMissionObjects "test_EmptyObjectForFireBig") +
    (allMissionObjects "Default");

{
    _nearestc = _x nearEntities["man", 50];
    if (((count _nearestc) == 0)) then {
        deleteVehicle _x;
    };
}
forEach _list;

diag_log "clean end";