/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	// Drivers License
	case 10:
	{
		license_civ_driver = false;
		hint localize "STR_Civ_RevokeLicense_Driver";
	};
	// Truck License
	case 11:
	{
		license_civ_truck = false;
		hint localize "STR_Civ_RevokeLicense_Truck";
	};
	// Pilot License
	case 12:
	{
		license_civ_air = false;
		hint localize "STR_Civ_RevokeLicense_Pilot";
	};
	// Boating License
	case 13:
	{
		license_civ_boat = false;
		hint localize "STR_Civ_RevokeLicense_Boating";
	};
	// Diving License
	case 14:
	{
		license_civ_dive = false;
		hint localize "STR_Civ_RevokeLicense_Diving";
	};
	// Taxi License
	case 15:
	{
		license_civ_driver = false;
		hint localize "STR_Civ_RevokeLicense_Taxi";
	};
	// All Motor Vehicle
	case 16:
	{
		license_civ_driver = false;
		license_civ_truck = false;
		license_civ_air = false;
		license_civ_boat = false;
		license_civ_air = false;
		license_civ_dive = false;
		hint localize "STR_Civ_RevokeLicense_AllMotor";
	};
	// Firearms License
	case 17:
	{
		license_civ_gun = false;
		hint localize "STR_Civ_RevokeLicense_Firearm";
	};
};