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
		license_civ_rebel = true;
		license_civ_driver = true;
		license_civ_heroin = true;
		license_civ_marijuana = true;
		license_civ_coke = true;
	};
	
	//Jail licenses
	case 1:
	{
		
		license_civ_aufenthalt = false;
		license_civ_arbeitsgenehmigung = false;
		
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then {
			license_civ_driver = true;

			hint localize "STR_Civ_LicenseRemove_1";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			license_civ_gun = true;
			hint localize "STR_Civ_LicenseRemove_2";
		};
	};
	
	// Revoking Licenses
    
    // Führerschein Lizenz
    case 10:
    {
        license_civ_driver = false;
        hint localize "STR_Civ_RevokeLicense_Driver";
    };
    // LKW Führerschein Lizenz
    case 11:
    {
        license_civ_truck = false;
        hint localize "STR_Civ_RevokeLicense_Truck";
    };
    // Pilotenschein Lizenz
    case 12:
    {
        license_civ_air = false;
        hint localize "STR_Civ_RevokeLicense_Pilot";
    };
    // Bootsschein Lizenz
    case 13:
    {
        license_civ_aufenthalt = false;
        hint localize "STR_Civ_RevokeLicense_Aufenthalt";
    };
    // Taucherschein Lizenz
    case 14:
    {
        license_civ_arbeitsgenehmigung = false;
        hint localize "STR_Civ_RevokeLicense_Arbeitsgenehmigung";
    };
    // Taxischein Lizenz
    case 15:
    {
        license_civ_gun = false;
        hint localize "STR_Civ_RevokeLicense_Waffe";
    };
    // Alle Scheine
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
};

