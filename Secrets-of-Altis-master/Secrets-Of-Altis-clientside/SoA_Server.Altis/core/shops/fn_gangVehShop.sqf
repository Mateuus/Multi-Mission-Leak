
if(call life_donator == 0) exitWith {hint "Du bist nicht berechtigt auf Don Ator's wertvolle Garagen zuzugreifen!"};

//Lizenzen
if(license_civ_lud) exitWith {[0,0,0,["donator_gang",civilian,"donator_car","lud","Familie Ludolf's Garage"]] call life_fnc_vehicleShopMenu;};
if(license_civ_slg) exitWith {[0,0,0,["donator_gang",civilian,"donator_car","slg","Familie Ludolf's Garage"]] call life_fnc_vehicleShopMenu;};

hint "Du besitzt keine Gruppierungs-Garage, tut mir leid.";