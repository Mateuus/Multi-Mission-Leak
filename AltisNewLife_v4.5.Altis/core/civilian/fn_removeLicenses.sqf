private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;
switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		liciv_driver = false;
		liciv_heroin = false;
		liciv_marijuana = false;
		liciv_coke = false;
	};	
	//Jail licenses
	case 1:
	{
		liciv_gun = false;
		liciv_driver = false;
		//liciv_rebel = false;	
        //liciv_bountyh = false;
	};	
	//Remove motor vehicle licenses
	case 2:
	{
		if(liciv_driver OR liciv_air OR liciv_truck OR liciv_boat) then {
			liciv_driver = false;
			//liciv_air = false;
			liciv_truck = false;
			//liciv_boat = false;
			hint "Vous avez perdu vos licences de vehicule terrestre.";
		};
	};	
	//Killing someone while owning a gun license
	case 3:
	{
		if(liciv_gun) then {
			liciv_gun = false;
			hint "Vous avez perdu votre permis de port d'arme.";
		};
	};
    // Drivers License
    case 10:
    {
        liciv_driver = false;
        hint "Votre permis de conduire a été retiré par la gendarmerie !";
    };
    // Truck License
    case 11:
    {
        liciv_truck = false;
        hint "Votre permis camion a été retiré par la gendarmerie !";
    };
    // Pilot License
    case 12:
    {
        liciv_air = false;
        hint "Votre permis de pilote a été retiré par la gendarmerie !";
    };
    // Boating License
    case 13:
    {
        liciv_boat = false;
        hint "Votre permis bateau a été retiré par la gendarmerie !";
    };
    // Diving License
    case 14:
    {
        liciv_dive = false;
        hint "Votre permis de plongé a été retiré par la gendarmerie !";
    };
    // Taxi License
    case 15:
    {
        liciv_chasse = false;
        hint "Votre permis de chasse a été retiré par la gendarmerie !";
    };
    // All Motor Vehicle
    case 16:
    {
        liciv_driver = false;
        liciv_truck = false;
        liciv_air = false;
        liciv_boat = false;
        liciv_air = false;
        liciv_dive = false;
        liciv_chasse = false;
		hint "Tous vos permis motorisés ont été retiré par la gendarmerie !";
    };
    // Firearms License
    case 17:
    {
        liciv_gun = false;
        hint "Votre permis de port d'arme a été retiré par la gendarmerie !";
    };	
    case 18:
    {
        liciv_rebel = false;
        hint "Votre licence rebelle a été retiré par la gendarmerie !";
    };		
};