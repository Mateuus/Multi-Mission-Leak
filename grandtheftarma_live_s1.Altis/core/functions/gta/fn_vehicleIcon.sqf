/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [["_texture", "", [""]]];
private "_vehicleIcon";

_vehicleIcon = configFile >> "CfgVehicleIcons" >> _texture;
if (isText _vehicleIcon) then {
	_texture = getText _vehicleIcon;
};

_texture
