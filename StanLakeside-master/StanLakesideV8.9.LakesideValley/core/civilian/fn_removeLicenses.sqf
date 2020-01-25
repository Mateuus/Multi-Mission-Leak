/*
	File: fn_removeLicenses.sqf
	
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/

params [["_state", 1, [0]]];

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		license_civ_rebel = false;
		license_civ_driver = false;
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_coke = false;
		license_civ_MDMA = false;
	};
	
	//Jail licenses
	case 1:
	{
		license_civ_gun = false;
		license_civ_donator1 = false;
        license_civ_donator2 = false;
        license_civ_donator3 = false;
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then {
			license_civ_driver = false;
			license_civ_air = false;
			license_civ_truck = false;
			license_civ_boat = false;
			[localize "STR_Civ_LicenseRemove_1", false] spawn domsg;
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			license_civ_gun = false;
			[localize "STR_Civ_LicenseRemove_2", false] spawn domsg;
		};
	};
	
	//Rifle training removal at PD
	case 4:
	{
		if(license_civ_rebel) then {
			license_civ_rebel = false;
			["Your Rifle Training has been removed.", false] spawn domsg;
		};
	};
	// Drivers License
	case 10:
	{
		license_civ_driver = false;
		[localize "STR_Civ_RevokeLicense_Driver", false] spawn domsg;
	};
	// Truck License
	case 11:
	{
		license_civ_truck = false;
		[localize "STR_Civ_RevokeLicense_Truck", false] spawn domsg;
	};
	// Pilot License
	case 12:
	{
		license_civ_air = false;
		[localize "STR_Civ_RevokeLicense_Pilot", false] spawn domsg;
	};
	// Boating License
	case 13:
	{
		license_civ_boat = false;
		[localize "STR_Civ_RevokeLicense_Boating", false] spawn domsg;
	};
	// Diving License
	case 14:
	{
		license_civ_dive = false;
		[localize "STR_Civ_RevokeLicense_Diving", false] spawn domsg;
	};
	// Taxi License
	case 15:
	{
		license_civ_taxi = false;
		[localize "STR_Civ_RevokeLicense_Taxi", false] spawn domsg;
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
		license_civ_taxi = false;
		[localize "STR_Civ_RevokeLicense_AllMotor", false] spawn domsg;
	};
	// Firearms License
	case 17:
	{
		license_civ_gun = false;
		[localize "STR_Civ_RevokeLicense_Firearm", false] spawn domsg;
	};
};
[2] call SOCK_fnc_updatePartial;