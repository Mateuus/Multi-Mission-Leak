/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_vehicle";
_vehicle = [ _this, 0, Objnull, [Objnull] ] call GTA_fnc_param;
if( isNull _vehicle ) exitWith {};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
