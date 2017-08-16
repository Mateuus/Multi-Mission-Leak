/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	case "life_inv_oilu": {"Rohöl"};
	case "life_inv_oilp": {"Diesel"};
	case "life_inv_heroinu": {"Unverarbeitetes Heroin"};
	case "life_inv_heroinp": {"Verarbeitetes Heroin"};
	case "life_inv_cannabis": {"Kannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Apfel"};
	case "life_inv_rabbit": {"Hasenfleisch"};
	case "life_inv_salema": {"Salema Fleisch"};
	case "life_inv_ornate": {"Aufwendiges Fleisch"};
	case "life_inv_mackerel": {"Makrele"};
	case "life_inv_tuna": {"Thunfisch"};
	case "life_inv_mullet": {"Meeräsche"};
	case "life_inv_catshark": {"Katzenhai"};
	case "life_inv_turtle": {"Schildkrötenfleisch"};
	case "life_inv_fishingpoles": {"Angel"};
	case "life_inv_water": {"Wasserflasche"};
	case "life_inv_coffee": {"Kaffee"};
	case "life_inv_turtlesoup": {"Schildkrötensuppe"};
	case "life_inv_donuts": {"Donuts"};
	case "life_inv_fuelE": {"Benzinkanister (leer)"};
	case "life_inv_fuelF": {"Benzinkanister"};
	case "life_inv_pickaxe": {"Spitzhacke"};
	case "life_inv_copperore": {"Kupfererz"};
	case "life_inv_ironore": {"Eisenerz"};
	case "life_inv_ironr": {"Eisen Barren"};
	case "life_inv_copperr": {"Kupfer Barren"};
	case "life_inv_sand": {"Sand"};
	case "life_inv_salt": {"Salzerz"};
	case "life_inv_saltr": {"Salz"};
	case "life_inv_glass": {"Glas"};
	case "life_inv_diamond": {"Diamant Ungeschliffen"};
	case "life_inv_diamondr": {"Diamant Geschliffen"};
	case "life_inv_tbacon": {"Taktischer Speck"};
	case "life_inv_redgull": {"RedGull"};
	case "life_inv_lockpick": {"Dietrich"};
	case "life_inv_peach": {"Pfirsich"};
	case "life_inv_coke": {"Unverarbeitetes Kokain"};
	case "life_inv_cokep": {"Verarbeitetes Kokain"};
	case "life_inv_spikeStrip": {"Nagelband"};
	case "life_inv_rock": {"Stein"};
	case "life_inv_cement": {"Zementsack"};
	case "life_inv_goldbar": {"Goldbarren"};
	case "life_inv_wine": {"Wein"};
	case "life_inv_grapes": {"Trauben"};
	case "life_inv_methu": {"Unverarbeitetes Methamphetamin"};
	case "life_inv_methp": {"Pures Methamphetamin"};
	case "life_inv_storage1": {"Kiste (klein)"};
	case "life_inv_storage2": {"Kiste (groß)"};
	case "life_inv_battery": {"Batterie"};
	case "life_inv_blastingcharge": {"C4 Sprengstoff"};
	case "life_inv_boltcutter": {"Bolzenschneider"};
	case "life_inv_defusekit": {"C4 Entschärfungskit"};
	case "life_inv_painkillers": {"Schmerzmittel"};
	case "life_inv_morphium": {"Morphium"};
	case "life_inv_zipties": {"Handschellen"};
	case "life_inv_storagesmall": {"Kleine Lagerbox"};
	case "life_inv_storagebig": {"Große Lagerbox"};
	case "life_inv_mauer": {"Strassensperre"};
	case "life_inv_mash": {"Maische"};
	case "life_inv_yeast": {"Hefe"};
	case "life_inv_rye": {"Roggen"};
	case "life_inv_hops": {"Hopfen"};
	case "life_inv_whiskey": {"Destillierter Whiskey"};
	case "life_inv_beerp": {"Fermentiertes Bier"};
	case "life_inv_bottles": {"Glasflaschen"};
	case "life_inv_cornmeal": {"Maismehl"};
	case "life_inv_bottledwhiskey": {"Abgefüllter Whiskey"};
	case "life_inv_bottledbeer": {"Abgefülltes Bier"};
	case "life_inv_bottledshine": {"Abgefüllter Moonshine"};
	case "life_inv_moonshine": {"Destillierter Moonshine"};
	case "life_inv_brennstab": {"Brennstab"}; // Add This
    case "life_inv_sprengstoff": {"Sprengstoff"}; // Add This
    case "life_inv_uran": {"Uran"}; // Add This
	case "life_inv_kidney": {"Niere"}; 
	case "life_inv_scalpel": {"Skalpell"};
	case "life_inv_stelement": {"Stabiles Element"};
	case "life_inv_inelement": {"Instabiles Element"};
	case "life_inv_fuelK": {"Kerosin"};
	case "life_inv_einsatzschild": {"Einsatzschild"};
	case "life_inv_defibrilator": {"Defibrilator"};
	//Crafting
	case "life_inv_edelmetall": {"Edelmetall"};
	case "life_inv_edelholz": {"Edelholz"};
	case "life_inv_carbon": {"Carbon"};
	case "life_inv_plastik": {"Plastik"};
	case "life_inv_spezialglas": {"Spezialglas"};
	case "life_inv_stoff": {"Stoff"};
	case "life_inv_farbe": {"Farbe"};
	case "life_inv_messing": {"Messing"};
	case "life_inv_strohpuppe": {"Strohpuppe"};
	case "life_inv_schwarzpulver": {"Schwarzpulver"};
	case "life_inv_spezialfett": {"Spezialfett"};
	case "life_inv_lynx": {"Lynx Bauplan"};
	
	//License Block
	case "license_civ_driver": {"Führerschein"};
	case "license_civ_air": {"Pilotenschein"};
	case "license_civ_heroin": {"Heroinlizenz"};
	case "license_civ_gang": {"Ganglizenz"};
	case "license_civ_oil": {"Öl Verarbeitungslizenz"};
	case "license_civ_dive": {"Taucherschein"};
	case "license_civ_boat": {"Bootschein"};
	case "license_civ_gun": {"Waffenschein"};
	case "license_cop_air": {"Pilotenschein"};
	case "license_cop_swat": {"GSG9 Lizenz"};
	case "license_civ_schwarzmarkt": {"Schwarzmarkt Zugang"};
	case "license_cop_cg": {"Küstenwache"};
	case "license_civ_rebel": {"Rebellen Training"};
	case "license_civ_truck": {"LKW-Schein"};
	case "license_civ_diamond": {"Diamanten-Verarbeitungslizenz"};
	case "license_civ_copper": {"Kupfer-Verarbeitungslizenz"};
	case "license_civ_iron": {"Eisen-Verarbeitungslizenz"};
	case "license_civ_sand": {"Sand-Verarbeitungslizenz"};
	case "license_civ_salt": {"Salz-Verarbeitungslizenz"};
	case "license_civ_coke": {"Kokain Lizenz"};
	case "license_civ_marijuana": {"Marijuana Lizenz"};
	case "license_civ_cement": {"Zement Mix Lizenz"};
	case "license_civ_meth": {"Methamphetamin Lizenz"};
	case "license_civ_grapes": {"Wein-Verarbeitungslizenz"};
	case "license_civ_moonshine": {"Moonshine-Verarbeitungslizenz"};
	case "license_med_air": {"Medizin Ausbildung"};
	case "license_civ_home": {"Hauseigentümer-Lizenz"};
	case "license_med_adac": {"ADAC Lizenz"};
	case "license_civ_stiller": {"Destillier-Lizenz"};
	case "license_civ_liquor": {"Schnaps-Lizenz"};
	case "license_civ_bottler": {"Abfüll-Lizenz"};
	case "license_civ_uran": {"Uran-Lizenz"};
	case "license_civ_ielem": {"Physiker-Lizenz"};
	case "license_adac_car": {"Imperium Führerschein"};
    case "license_adac_air": {"Imperium Pilotenschein"};
	
	
	/*
	Tanoa Farming 2.0
	Made for TanoaRPG.de
	Author: Tim "cat24max" Vogler
	
	Copyright statement:
	You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
	*/
	//Items
	case "life_inv_woodlog": {"Holzstämme"};
	case "life_inv_woodplank": {"Holzbretter"};
	case "life_inv_woodfurniture": {"Möbelteile"};
	case "life_inv_sugarraw": {"Zuckerrüben"};
	case "life_inv_sugarprocessed": {"Zucker"};
	case "life_inv_waterspring": {"Quellwasser"};
	case "life_inv_waterclean": {"Gereinigtes Quellwasser"};
	case "life_inv_waterbottle": {"Mineralwasserflaschen"};
	case "life_inv_goldore": {"Golderz"};
	case "life_inv_goldcoins": {"Goldmünzen"};
	case "life_inv_oilraw": {"Rohöl"};
	case "life_inv_oilrefined": {"Raffiniertes Öl"};
	case "life_inv_oilheat": {"Heizöl"};
	case "life_inv_oildiesel": {"Diesel"};
	case "life_inv_oilkerosin": {"Kerosin"};
	case "life_inv_hmherbs": {"Kräutermischung"};
	case "life_inv_hmfiltrated": {"Jägermeister Filtrierung"};
	case "life_inv_hmbottled": {"Jägermeister Shots"};
	case "life_inv_hmillegal": {"Jägermeister Flasche (unversteuert)"};
	case "life_inv_coffeebeans": {"Kaffeebohnen"};
	case "life_inv_coffee1": {"Kaffee (Packung)"};
	case "life_inv_energydrink": {"Red Gull Sirup"};
	case "life_inv_angelstrumpetu": {"Engelstrompetenblüten"};
	case "life_inv_angelstrumpetp": {"Engelstrompeten"};
	case "life_inv_crack": {"Crack"};
	//Licenses
	case "license_civ_wood": {"Holzfäller"};
	case "license_civ_sugar": {"Zuckerextraktion"};
	case "license_civ_water": {"FiJi Water Company"};
	case "license_civ_gold": {"Goldgräberschein"};
	case "license_civ_oilrefined": {"Ölraffinierielizenz"};
	case "license_civ_oilheat": {"Heizölproduktion"};
	case "license_civ_oildiesel": {"Dieselproduktion"};
	case "license_civ_oilkerosin": {"Kerosinproduktion"};
	case "license_civ_huntermasterlegal": {"Jägermeister AG Keycard"};
	case "license_civ_huntermasterillegal": {"Jägermeister Prohibitionsexporteur"};
	case "license_civ_coffee": {"Kaffeelizenz"};
	case "license_civ_energydrink": {"EnergyDrink-Händler"};
	case "license_civ_angelstrump": {"Engelstrompetenherstellung"};
	
	
	//Shipwreck
	case "life_inv_uwsl": {"Unterwasser-Sprengsatz"};
};
