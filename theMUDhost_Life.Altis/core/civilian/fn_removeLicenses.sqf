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
	//Death while being wanted
	case 0:
	{
		license_civ_rebel = false;
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_coke = false;
		license_civ_gun = false;
	};
	
	//Jail licenses
	case 1:
	{
		license_civ_driver = false;
		license_civ_truck = false;
		license_civ_taxi = false;
		license_civ_air = false;
		license_civ_boat = false;
		license_civ_gun = false;
		license_civ_rebel = false;
		license_civ_bh = false;
		license_civ_c3 = false;
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then {
			license_civ_driver = false;
			license_civ_air = false;
			license_civ_truck = false;
			license_civ_boat = false;
			hint localize "STR_Civ_LicenseRemove_1";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			license_civ_gun = false;
			hint localize "STR_Civ_LicenseRemove_2";
		};
	};

	case 4:
	{
		if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then {
			license_civ_driver = false;
			license_civ_truck = false;
			license_civ_taxi = false;
			systemChat localize "STR_Civ_LicenseRemove_1a";
		};
	};
	
	// Cop Interaction Revoking Licenses (Land Vehicles Only)
	case 5:
	{
		license_civ_driver = false;
		license_civ_truck = false;
		license_civ_taxi = false;
		hint localize "STR_Civ_LicenseRemove_3";
	};
	
	//Remove all licenses on death, New Life Rule
	case 6:
	{
		license_civ_driver = false;
		license_civ_boat = false;
		license_civ_air = false;
		license_civ_gun = false;
		license_civ_dive = false;
		license_civ_oil = false;
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_medmarijuana = false;
		license_civ_rebel = false;
		license_civ_truck = false;
		license_civ_diamond = false;
		license_civ_salt = false;
		license_civ_coke = false;
		license_civ_sand = false;
		license_civ_iron = false;
		license_civ_copper = false;
		license_civ_cement = false;
		license_civ_home = false;
		license_civ_liquor = false;
		license_civ_stiller = false;
		license_civ_bottler = false;
		license_civ_taxi = false;
	};
	
	// Revoking Licenses
	
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
		license_civ_taxi = false;
		hint localize "STR_Civ_RevokeLicense_Taxi";
	};
	// All Motor Vehicle
	case 16:
	{
		license_civ_passportEast = false;
		license_civ_passportWest = false;
		hint localize "STR_Civ_RevokeLicense_Passport";
	};
	// Firearms License
	case 17:
	{
		license_civ_gun = false;
		hint localize "STR_Civ_RevokeLicense_Firearm";
	};
	// Home License
	case 18:
	{
		license_civ_c3 = false;
		hint localize "STR_Civ_RevokeLicense_C3";
	};
};