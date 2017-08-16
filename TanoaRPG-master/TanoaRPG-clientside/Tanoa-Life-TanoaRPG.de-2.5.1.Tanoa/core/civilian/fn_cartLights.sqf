/*
    File: fn_cartLights.sqf
    Author: CooliMC
    
	Description:
    Light bla bla
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["C_Kart_01_F","C_Kart_01_Fuel_F","C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F"])) exitWith {};

if(_vehicle getVariable["lights",FALSE]) then
{
    _vehicle setVariable["lights",FALSE,TRUE];
} else {
    _vehicle setVariable["lights",TRUE,TRUE];
	[_vehicle,0.2] remoteExec ["tanoarpg_fnc_Lights", -2, false];
};