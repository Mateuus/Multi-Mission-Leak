/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var","_val"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {"Rohöl"};
	case "life_inv_oilp": {"Verarbeitetes Öl"};
	case "life_inv_kerosin": {"Kerosin"};
	case "life_inv_heroinu": {"Frisches Heroin"};
	case "life_inv_heroinp": {"Reines Heroin"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marihuana"};
	case "life_inv_zucker": {"Zucker"};
	case "life_inv_mais": {"Mais"};
	case "life_inv_apple": {"Apfel"};
	case "life_inv_rabbit": {"Hasenfleisch"};
	case "life_inv_scalpel": {"Skalpell"};
	case "life_inv_salema": {"Goldstrieme"};
	case "life_inv_ornate": {"Kaiserfisch"};
	case "life_inv_mackerel": {"Makrele"};
	case "life_inv_tuna": {"Thunfisch"};
	case "life_inv_mullet": {"Meerbarbe"};
	case "life_inv_bleiu": {"Blei"};
	case "life_inv_bleigp": {"Blei-Glas"};
	case "life_inv_bleilp": {"Blei-Legierung"};
	case "life_inv_catshark": {"Katzenfisch"};
	case "life_inv_turtle": {"Schildkröte"};
	case "life_inv_brenn": {"Brennkessel"};
	case "life_inv_bauma": {(localize "STR_Item_Moon")};
	case "life_inv_schnaps": {"Moonshine"};
	case "life_inv_fishingpoles": {"Angelrute"};
	case "life_inv_water": {"Sprite"}; // edit...
//	case "life_inv_bier": {"Bier"};
//	case "life_inv_doner": {"Currywurst"}; // edit...
	case "life_inv_bier": {"Cocktail"};
	case "life_inv_doner": {"Bratwurst"}; // edit...
	case "life_inv_coffee": {"Kaffee"}; // edit...
	case "life_inv_turtlesoup": {"Schildkrötensuppe"};
	case "life_inv_donuts": {"Muffin"}; // edit...
	case "life_inv_fuelE": {"Leerer Kanister"};
	case "life_inv_fuelF": {"Voller Benzinkanister"};
	case "life_inv_pickaxe": {"Spitzhacke"};
	case "life_inv_copperore": {"Kupfererz"};
	case "life_inv_silberu": {"Silbererz"};
	case "life_inv_ironore": {"Eisenerz"};
	case "life_inv_ironr": {"Eisenbarren"};
	case "life_inv_copperr": {"Kupferbarren"};
	case "life_inv_silberp": {"Silberbarren"};
	case "life_inv_sand": {"Sand"};
	case "life_inv_salt": {"Salz"};
	case "life_inv_saltr": {"Verarbeitetes Salz"};
	case "life_inv_glass": {"Glass"};
	case "life_inv_diamond": {"Diamond ungeschliffen"};
	case "life_inv_diamondr": {"Diamond geschliffen"};
	case "life_inv_tbacon": {"Baguette"}; // edit...
	case "life_inv_redgull": {"Monster Energy"};
	case "life_inv_lockpick": {"Dietrich"};
	case "life_inv_peach": {"Pfirsich"};
	case "life_inv_coke": {"Frisches Kokain"};
	case "life_inv_cokep": {"Reines Kokain"};
	case "life_inv_radioaktivu": {"Radioaktive Elemente"};
	case "life_inv_radioaktivp": {"Versiegelte Elemente"};
	case "life_inv_muschelu": {"Muscheln"};
	case "life_inv_muschelp": {"Perlen"};
	case "life_inv_pilsu": {"Hopfen"};
	case "life_inv_sperre": {"Barriere"};
	case "life_inv_dixi": {"Toilette"};
	case "life_inv_tisch": {"Tisch"};
	case "life_inv_generator": {"Generator"};
	case "life_inv_pilsp": {"LoP Bier Export"};
	case "life_inv_schmuck": {"Schmuck"};
	case "life_inv_badcocaine": {"Gestrecktes Kokain"};
	case "life_inv_krokodile": {"Krokodile"};
	case "life_inv_methu": {"Frische Methamphetamine"};
	case "life_inv_methp": {"Reine Methamphetamine"};
	case "life_inv_pille": {"Ibuprophet"};
	case "life_inv_goldu": {"Golderz"};
	case "life_inv_goldp": {"Goldbarren"};
	case "life_inv_frogu": {"Frosch"};
	case "life_inv_frogp": {"LSD"};
	case "life_inv_brennstabu": {"Brennstäbe"};
	case "life_inv_brennstabp": {"Uran"};
	case "life_inv_atomwaffe": {"Uran Munition"};
	case "life_inv_spikeStrip": {"Nagelbrett"};
	case "life_inv_rock": {"Stein"};
	case "life_inv_cement": {"Zement"};
	case "life_inv_kidney": {"Niere"}; 
	case "life_inv_goldbar": {"Bank-Gold"};
	case "life_inv_mauer": {"Pylone"};
	case "life_inv_matratze": {"Matratze"};
	case "life_inv_zelt": {"Pavillon"};
	case "life_inv_wand": {"Mauer"};
	case "life_inv_schranke": {"Schranke"};
	case "life_inv_geld": {"Falschgeld"};
	case "life_inv_lampe": {"Strahler"};
	case "life_inv_blastingcharge": {"Sprengladung"};
	case "life_inv_boltcutter": {"Bolzenschneider"};
	case "life_inv_defusekit": {"Entschärfungskit"};
	case "life_inv_storagesmall": {"Kleine Lagerkiste"};
	case "life_inv_storagebig": {"Große Lagerkiste"};
	case "life_inv_henraw": {"Rohes Hünchenfleisch"};
	case "life_inv_roosterraw": {"Rohes Hähnchenfleisch"};
	case "life_inv_goatraw": {"Rohes Ziegenfleisch"};
	case "life_inv_sheepraw": {"Rohes Schaffleisch"};
	case "life_inv_rabbitraw": {"Rohes Hasenfleisch"};
	case "life_inv_wolfraw": {"Rohes Wolfsfleisch"};
	case "life_inv_wolf1raw": {"Rohes Wolfsfleisch"};
	
	//License Block
	case "license_civ_driver": {"Führerschein"};
	case "license_civ_air": {"Pilotenschein"};
	case "license_civ_heroin": {"Heroin Lizenz"};
	case "license_civ_gang": {"Gang Lizenz"};
	case "license_civ_oil": {"Öl Lizenz"};
	case "license_civ_kerosin": {"Kerosin Lizenz"};
	case "license_civ_dive": {"Taucher Lizenz"};
	case "license_civ_boat": {"Bootführerschein"};
	case "license_civ_gun": {"Waffenschein"};
	case "license_cop_air": {"Pilotenschein"};
	case "license_cop_swat": {"SWAT Lizenz"};
	case "license_cop_admin2": {"Admin Lizenz"};
	case "license_cop_zoll": {"Zoll Lizenz"};
	case "license_cop_cg": {"Küstenwache"};
	case "license_civ_rebel": {"Rebellen Lizenz"};
	case "license_civ_truck": {"LKW Führerschein"};
	case "license_civ_diamond": {"Diamant Lizenz"};
	case "license_civ_copper": {"Kupfer Lizenz"};
	case "license_civ_silber": {"Silber Lizenz"};
	case "license_civ_iron": {"Eisen Lizenz"};
	case "license_civ_sand": {"Sand Lizenz"};
	case "license_civ_salt": {"Salz Lizenz"};
	case "license_civ_coke": {"Kokain Lizenz"};
	case "license_civ_muschel": {"Muschel Lizenz"};
	case "license_civ_pils": {"Bier Lizenz"};
	case "license_civ_radioaktiv": {"Atom Lizenz"};
	case "license_civ_legierung": {"Legierungs Lizenz"};
	case "license_civ_bleiglas": {"Blei-Glas Lizenz"};
	case "license_civ_schmuck": {"Schmuck Lizenz"};
	case "license_civ_badcocaine": {"Kokain strecken Lizenz"};
	case "license_civ_krokodile": {"Krokodile Lizenz"};
	case "license_civ_meth": {"Meth Lizenz"};
	case "license_civ_gold": {"Gold Lizenz"};
	case "license_civ_frog": {"LSD Lizenz"};
	case "license_civ_marijuana": {"Mariuhana Lizenz"};
	case "license_civ_cement": {"Zement Lizenz"};
	case "license_civ_uran": {"Uran Lizenz"};
	case "license_civ_bhc": {"BHC Lizenz"};
	case "license_civ_atomwaffe": {"Uran Munition Lizenz"};
	case "license_civ_admin1": {"Admin Lizenz"};
	case "license_civ_donator1": {"VIP Lizenz"};
	case "license_civ_dm": {"Dithmarscher Lizenz"};
	case "license_civ_leer": {"AR Lizenz"};
	case "license_civ_ssg": {"SSG Lizenz"};
	case "license_civ_x": {"eXecute Lizenz"};
	case "license_civ_kartell": {"Kartell Lizenz"};
	case "license_civ_presse": {"Priester Lizenz"};
	case "license_med_air": {"Piloten Lizenz"};
	case "license_civ_home": {"Grundbuch Eintrag"};
};
