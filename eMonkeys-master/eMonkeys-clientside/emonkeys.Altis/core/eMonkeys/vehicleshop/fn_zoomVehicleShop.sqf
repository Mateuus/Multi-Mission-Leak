/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_switchVehColorShop.sqf
	Server: e-Monkeys.com
    
    Description: Change the Camera Zoom
*/
private["_zoom","_high"];
_zoom = [_this,0,5,[0]] call bis_fnc_param;
_zoom = 30 - (_zoom * 2.5);
_high = _zoom / 2;
_position = getArray(missionConfigFile >> "CfgVehicleShopPosition" >> "vehicleShopSpawn");

if(!(isNil "EMonkeys_ZoomOldVehicleShop")) then
{
	if(EMonkeys_ZoomOldVehicleShop == _zoom) exitWith {};
};

EMonkeys_EscRoundCam = true;
WaitUntil{!(isNil "EMonkeys_RoundCamDegre")};
[EMonkeys_VehicleShopCam, _position, _high, _zoom, 0.5, true, EMonkeys_RoundCamDegre] execFSM "core\fsm\cam_round.fsm";

EMonkeys_ZoomOldVehicleShop = _zoom;