private ["_vehicle", "_class", "_getInOut", "_centerOfMass", "_weapons"];
_vehicle = _this select 0;

clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
