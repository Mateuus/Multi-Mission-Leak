/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
life_veh_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_veh_cam;
showChat true;
/*
(findDisplay 2300) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 2300) displayRemoveAllEventHandlers "MouseButtonDown";
(findDisplay 2300) displayRemoveAllEventHandlers "MouseButtonUp";
(findDisplay 2300) displayRemoveAllEventHandlers "MouseMoving";
*/

if(!isNil "life_demoVehicle") then {
	if(!isNil "life_demoVehicleAttachment") then {
		{deleteVehicle _x;} forEach [life_vehicleLogic,life_demoVehicle,life_vehicleLight,life_demoVehicleAttachment];
	} else {
		{deleteVehicle _x;} forEach [life_vehicleLogic,life_demoVehicle,life_vehicleLight];
	};
}	else {
	{deleteVehicle _x;} forEach [life_vehicleLogic,life_vehicleLight];
};
life_veh_shop = nil;
closeDialog 0;
