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
	//Virtual Inventory Itemsmoney
	//case "EMonkeys_c164": {"Euro"};
	case "EMonkeys_inv_oilu": {"Erdöl"};
	case "EMonkeys_inv_oilp": {"Raffiniertes Erdöl"};
	case "EMonkeys_inv_heroinu": {"Mohn"};
	case "EMonkeys_inv_heroinp": {"Heroin"};
	case "EMonkeys_inv_cannabis": {"Cannabis"};
	case "EMonkeys_inv_marijuana": {"Marijuana"};
	case "EMonkeys_inv_apple": {"Apfel"};
	case "EMonkeys_inv_rabbit": {"Kaninchenfleisch"};
	case "EMonkeys_inv_salema": {"Goldstriemenfleisch"};
	case "EMonkeys_inv_ornate": {"Meerpfaufleisch"};
	case "EMonkeys_inv_mackerel": {"Makrelenfleisch"};
	case "EMonkeys_inv_tuna": {"Thunfischfleisch"};
	case "EMonkeys_inv_mullet": {"Meeräschenfleisch"};
	case "EMonkeys_inv_catshark": {"Katzenhaifleisch"};
	case "EMonkeys_inv_turtle": {"Schildkrötenfleisch"};
	case "EMonkeys_inv_fishingpoles": {"Angelroute"};
	case "EMonkeys_inv_water": {"Wasserflasche"};
	case "EMonkeys_inv_coffee": {"Kaffee"};
	case "EMonkeys_inv_turtlesoup": {"Schildkrötensuppe"};
	case "EMonkeys_inv_donuts": {"Donuts"};
	case "EMonkeys_inv_fuelE": {"Treibstoffkanister leer"};
	case "EMonkeys_inv_fuelF": {"Treibstoffkanister voll"};
	case "EMonkeys_inv_fuelcan_super": {"Super Benzinkanister"};
	case "EMonkeys_inv_fuelcan_superplus": {"SuperPlus Benzinkanister"};
	case "EMonkeys_inv_fuelcan_diesel": {"Diesel Kanister"};
	case "EMonkeys_inv_fuelcan_biodiesel": {"Biodiesel Kanister"};
	case "EMonkeys_inv_fuelcan_kerosin": {"Kerosin Kanister"};
	case "EMonkeys_inv_pickaxe": {"Klappspaten"};
	case "EMonkeys_inv_pumpe": {"Pumpe"};
	case "EMonkeys_inv_axt": {"Axt"};
	case "EMonkeys_inv_hasenfalle": {"Hasenfalle"};
	case "EMonkeys_inv_copperore": {"Kupfererz"};
	case "EMonkeys_inv_ironore": {"Eisenerz"};
	case "EMonkeys_inv_ironr": {"Eisenbarren"};
	case "EMonkeys_inv_copperr": {"Kupferbarren"};
	case "EMonkeys_inv_sand": {"Sand"};
	case "EMonkeys_inv_salt": {"Salz"};
	case "EMonkeys_inv_saltr": {"Raffiniertes Salz"};
	case "EMonkeys_inv_glass": {"Glas"};
	case "EMonkeys_inv_diamond": {"Rohdiamant"};
	case "EMonkeys_inv_diamondr": {"Geschl.Diamant"};
	case "EMonkeys_inv_tbacon": {"Pausenbrot"};
	case "EMonkeys_inv_redgull": {"Bananenshake"};
	case "EMonkeys_inv_lockpick": {"Dietrich"};
	case "EMonkeys_inv_peach": {"Pfirsich"};
	case "EMonkeys_inv_coke": {"Kokablätter"};
	case "EMonkeys_inv_cokep": {"Kokain"};
	case "EMonkeys_inv_spikeStrip": {"Nagelband"};
	case "EMonkeys_inv_rock": {"Stein"};
	case "EMonkeys_inv_cement": {"Zementsack"};
	case "EMonkeys_inv_goldbar": {"Goldbarren"};
	case "EMonkeys_inv_silver" : {"Silbererz"};
	case "EMonkeys_inv_silverr" : {"Silberbarren"};
	case "EMonkeys_inv_blastingcharge": {"Sprengladung"};
	case "EMonkeys_inv_boltcutter": {"Brecheisen"};
	case "EMonkeys_inv_defusekit": {"Entschärfungskit"};
	case "EMonkeys_inv_mauer": {"Warnbarke"};
	case "EMonkeys_inv_kegel": {"Kegel"};
	case "EMonkeys_inv_banana": {"Banane"};
	case "EMonkeys_inv_pear": {"Birne"};
	case "EMonkeys_inv_cherry": {"Kirsche"};
	case "EMonkeys_inv_lemon": {"Zitrone"};
	case "EMonkeys_inv_obstsalat": {"Obstsalat"};
	
	case "EMonkeys_inv_goldener_pokal": {"Goldener Pokal"};
	case "EMonkeys_inv_silberner_pokal": {"Silberner Pokal"};
	case "EMonkeys_inv_bronzener_pokal": {"Bronzener Pokal"};
	
	case "EMonkeys_inv_insurance_a": {"Versicherungsschein A"};
	case "EMonkeys_inv_insurance_b": {"Versicherungsschein B"};
	
	case "EMonkeys_inv_tabak": {"Tabak"};
	case "EMonkeys_inv_feinschnitt": {"Feinschnitt"};
	case "EMonkeys_inv_seawater": {"Brackwasser"};
	case "EMonkeys_inv_diesel": {"Diesel"};
	case "EMonkeys_inv_diesel_gestreckt": {"Diesel gestreckt"};
	case "EMonkeys_inv_biodiesel": {"Biodiesel"};
	case "EMonkeys_inv_super": {"Super"};
	case "EMonkeys_inv_superplus": {"Superplus"};
	case "EMonkeys_inv_zigarette": {"Zigaretten"};
	case "EMonkeys_inv_raps": {"Raps"};
	case "EMonkeys_inv_tabakblatt": {"Tabakblätter"};
	case "EMonkeys_inv_zigarre": {"Zigarren"};
	case "EMonkeys_inv_edelzigarre": {"Edelzigarren"};
	case "EMonkeys_inv_joints": {"Joints"};
	case "EMonkeys_inv_pornoheft": {"Verklebtes Pornoheft"};
	
	//Jetmining
	case "EMonkeys_inv_cellulosepulver": {"Cellulosepulver"};
	case "EMonkeys_inv_maisstaerke": {"Maisstaerke"};
	case "EMonkeys_inv_mischmittel": {"Mischmittel"};
	case "EMonkeys_inv_natriumchlorid": {"Natriumchlorid"};
	case "EMonkeys_inv_tablettenrohling": {"Tablettenrohling"};
	case "EMonkeys_inv_acetylsalicylsaeure": {"Acetylsalicylsaeure"};
	case "EMonkeys_inv_aspirin": {"Aspirin"};
	case "EMonkeys_inv_sildenafil": {"Sildenafil"};
	case "EMonkeys_inv_viagra": {"Viagra"};
	case "EMonkeys_inv_hypromellose": {"Hypromellose"};
	case "EMonkeys_inv_casanovil": {"Casanovil"};
	
	case "EMonkeys_inv_handcuffs": {"Kabelbinder"};
	case "EMonkeys_inv_jutesack": {"Jutesack"};
	case "EMonkeys_inv_battery": {"Handy Akku"};
	
	case "EMonkeys_inv_defibrillator": {"Defibrillator"};
	case "EMonkeys_inv_morphine" : {"Morphium"};
	case "EMonkeys_inv_bandage" : {"Bandage"};
	//house
	case "EMonkeys_inv_furniture_01": {"Korb (80)"};
	case "EMonkeys_inv_furniture_02": {"Schublade (100)"};
	case "EMonkeys_inv_furniture_03": {"Schrank (120)"};
	case "EMonkeys_inv_furniture_04": {"Holzregal (140)"};
	case "EMonkeys_inv_furniture_05": {"Metallregal (160)"};
	//house
	case "EMonkeys_inv_mash": {"Getreide-Brei"};
	case "EMonkeys_inv_yeast": {"Hefe"};
	case "EMonkeys_inv_rye": {"Roggen"};
	case "EMonkeys_inv_hops": {"Hopfen"};
	case "EMonkeys_inv_whiskey": {"destillierter Whiskey"};
	case "EMonkeys_inv_beerp": {"Bier"};
	case "EMonkeys_inv_bottles": {"Glasflasche"};
	case "EMonkeys_inv_cornmeal": {"Kräuter"};
	case "EMonkeys_inv_bottledwhiskey": {"Whiskeyflasche"};
	case "EMonkeys_inv_bottledbeer": {"Bierflasche"};
	case "EMonkeys_inv_bottledshine": {"Absinthflasche"};
	case "EMonkeys_inv_moonshine": {"destillierter Absinth"};
	
	//License Block
	case "license_civ_driver": {"Führerschein"};
	case "license_civ_air": {"Pilotenschein"};
	case "license_civ_heroin": {"Heroinverarbeitung"};
	case "license_civ_gang": {"Ganglizez"};
	case "license_civ_oil": {"Ölverarbeitung"};
	case "license_civ_dive": {"Tauchschein"};
	case "license_civ_boat": {"Bootschein"};
	case "license_civ_gun": {"Waffenschein"};
	case "license_cop_air": {"EMP-Berechtigung"};
	case "license_cop_swat": {"Swat License"};
	case "license_cop_cg": {"Küstenwache"};
	case "license_civ_rebel": {"Waffenschieberlizenz"};
	case "license_civ_truck": {"LKW Führerschein"};
	case "license_civ_diamond": {"Diamantenverarbeitung"};
	case "license_civ_copper": {"Kupferverarbeitung"};
	case "license_civ_iron": {"Eisenverarbeitung"};
	case "license_civ_sand": {"Sandverarbeitung"};
	case "license_civ_salt": {"Salzverarbeitung"};
	case "license_civ_coke": {"Kokainveredlung"};
	case "license_civ_marijuana": {"Marihuanaveredlung"};
	case "license_civ_cement": {"Zementverarbeitung"};
	case "license_civ_silver": {"Silberverarbeitung"};
	case "license_med_air": {"Pilotenschein"};
	//Custom
	case "license_civ_log": {"Logistiklizenz"};
	case "license_civ_home": {"Bausparvertrag"};
	//reb
	case "license_civ_PullOut": {"PullOut-Training"};
	case "license_civ_escort": {"Escorttraining"};
	case "license_civ_torture": {"Foltertraining"};
	case "license_civ_restrain": {"Festnahmetraining"};
	
	case "license_civ_stiller": {"Brennereilizenz"};
	case "license_civ_liquor": {"Braulizenz"};
	case "license_civ_bottler": {"Abfülllizenz"};
	case "license_civ_invisible": {"Vermummungstraining"};
	case "license_civ_jet": {"Jetpilotenschein"};
	
	//Crafting
	case "EMonkeys_inv_craftingtool_01": {"Craftingtool"};
	case "EMonkeys_inv_bp_sting": {"Bauplan: Sting"};
	case "EMonkeys_inv_bp_vermin": {"Bauplan: Vermin"};
	case "EMonkeys_inv_bp_trg21": {"Bauplan: TRG 21"};
	case "EMonkeys_inv_bp_mk20": {"Bauplan: MK20"};
	case "EMonkeys_inv_bp_mxc": {"Bauplan: MXC"};
	case "EMonkeys_inv_bp_mx": {"Bauplan: MX"};
	case "EMonkeys_inv_bp_mxm": {"Bauplan: MXM"};
	case "EMonkeys_inv_bp_mk200mg": {"Bauplan: MK200 MG"};
	case "EMonkeys_inv_bp_rahim": {"Bauplan: Rahim"};
	case "EMonkeys_inv_bp_mxm_lz": {"Bauplan: MXM [LZ]"};
	case "EMonkeys_inv_bp_mxm_sog": {"Bauplan: MXM [SOG]"};
	case "EMonkeys_inv_bp_mxm_soa": {"Bauplan: MXM [SoA]"};
	case "EMonkeys_inv_bp_mxm_grp": {"Bauplan: MXM [Exklusiv]"};
	case "EMonkeys_inv_bp_mx_gl_sog": {"Bauplan: MX GL [SOG]"};
	case "EMonkeys_inv_bp_mx_ps": {"Bauplan: MX [PS]"};
	case "EMonkeys_inv_bp_vestclblack_grp": {"Bauplan: CarrierLite Black"};
	case "EMonkeys_inv_bp_vestcrgreen_grp": {"Bauplan: CarrierRig Green"};
	case "EMonkeys_inv_bp_vestpcl_ctrg": {"Bauplan: PlateCarrierL CTRG"};
	case "EMonkeys_inv_bp_vestpch_ctrg": {"Bauplan: PlateCarrierH CTRG"};
	case "EMonkeys_inv_bp_tacvestblack_grp": {"Bauplan: Tactical Vest Black"};
	case "EMonkeys_inv_bp_vestclblack2_grp": {"Bauplan: CarrierRig Black"};
	
	case "EMonkeys_inv_bp_mar10": {"Bauplan: MAR-10"};
	case "EMonkeys_inv_bp_mk1": {"Bauplan: Mk-I"};
	case "EMonkeys_inv_bp_mk14": {"Bauplan: Mk14"};
	case "EMonkeys_inv_bp_mk18": {"Bauplan: Mk-18"};
	
	case "EMonkeys_inv_bp_titan_aa": {"Bauplan: Titan AA"};
	case "EMonkeys_inv_bp_launch_RPG32": {"Bauplan: Alamut"};
	
	case "EMonkeys_inv_bp_titanr_aa": {"Bauplan: Titan AA Rakete"};
	case "EMonkeys_inv_bp_RPG32": {"Bauplan: RPG Rakete"};
	
	case "EMonkeys_inv_bp_sln338": {"Bauplan: Schalli .338"};
	
	case "EMonkeys_inv_bp_ghillie": {"Bauplan: Ghillie Fashion"};
	case "EMonkeys_inv_bp_bipod": {"Bauplan: Bipod"};
	case "EMonkeys_inv_bp_fatvest": {"Bauplan: Schwere Weste"};
	case "EMonkeys_inv_bp_lz_vest": {"Bauplan: LosZaros Weste"};
	
	case "EMonkeys_inv_bp_katiba": {"Bauplan: Katiba"};
	case "EMonkeys_inv_bp_lynx": {"Bauplan: Lynx 12,7mm"};
	case "EMonkeys_inv_bp_zafir": {"Bauplan: Zafir 7,62mm MG"};
	case "EMonkeys_inv_bp_sln9mm": {"Bauplan: Schalli 9mm"};
	case "EMonkeys_inv_bp_sln556": {"Bauplan: Schalli 5.56mm"};
	case "EMonkeys_inv_bp_sln65": {"Bauplan: Schalli 6.5mm"};
	case "EMonkeys_inv_bp_sniperoptic": {"Bauplan: Sniper Visier"};
	case "EMonkeys_inv_bp_sln762": {"Bauplan: Schalli 7.62mm"};
	case "EMonkeys_inv_bp_slnacp": {"Bauplan: Schalli ACP"};
	
	case "EMonkeys_inv_bp_rolex": {"Bauplan: Rolex"};
	case "EMonkeys_inv_bp_almanach": {"Vorlage: Militär-Almanach"};
	case "EMonkeys_inv_bp_aktex": {"Vorlage: AkteX Kompendium "};
	case "EMonkeys_inv_bp_tazer": {"Bauplan: Taser"};
	
	case "EMonkeys_inv_bp_furniture_05": {"Bauplan: Metallregal"};
	
	case "EMonkeys_inv_rolex": {"Rolex"};
	case "EMonkeys_inv_almanach": {"Militär-Almanach"};
	case "EMonkeys_inv_aktex": {"Akte X"};
	
	case "EMonkeys_inv_aktex1": {"Akte I: Watergate"};
	case "EMonkeys_inv_aktex2": {"Akte II: Area 51"};
	case "EMonkeys_inv_aktex3": {"Akte III: Milzbrand"};
	case "EMonkeys_inv_aktex4": {"Akte IV: Kalte Fusion"};
	case "EMonkeys_inv_aktex5": {"Akte V: Mondlandung"};
	case "EMonkeys_inv_aktex6": {"Akte VI: 9/11"};
	case "EMonkeys_inv_aktex7": {"Akte VII: Freimaurer"};
	case "EMonkeys_inv_aktex8": {"Akte VIII: UFO's"};
	case "EMonkeys_inv_aktex9": {"Akte IX: Chemtrails"};	
	
	case "EMonkeys_inv_maut_pkw": {"Mautticket PKW"};
	case "EMonkeys_inv_maut_lkw": {"Mautticket LKW"};
	case "EMonkeys_inv_carbonfaser": {"Carbonfaser"};
	case "EMonkeys_inv_kohlenstoff": {"Kohlenstoff"};
	case "EMonkeys_inv_plastik": {"Plastik"};
	case "EMonkeys_inv_goldarmierung": {"Goldarmierung"};
	case "EMonkeys_inv_uhrwerk": {"Uhrwerk"};
	case "EMonkeys_inv_ziffernblatt": {"Ziffernblatt"};
	case "EMonkeys_inv_kupferteile": {"Kupferteile"};
	case "EMonkeys_inv_zahnrad": {"Zahnrad"};
	case "EMonkeys_inv_alup": {"Aluminiumteile"};
	case "EMonkeys_inv_alufaser": {"Aluminiumfaser"};
	case "EMonkeys_inv_aluunrein": {"Unreines Aluminium"};
	case "EMonkeys_inv_papier": {"Papier"};
	case "EMonkeys_inv_elektroschrott": {"Elektroschrott"};
	case "EMonkeys_inv_edelmetall": {"Edelmetall"};
	case "EMonkeys_inv_phosphor": {"Phosphor"};

	case "EMonkeys_inv_schutt": {"Schutt"};
	case "EMonkeys_inv_schutthaufen": {"Schutthaufen"};

	case "EMonkeys_inv_titanore": {"Titan Erz"};
	case "EMonkeys_inv_titaneisen": {"Titaneisen"};
	case "EMonkeys_inv_titanmantel": {"Titanmantel"};
	case "EMonkeys_inv_flush": {"Altis Flush"};
	
	case "EMonkeys_inv_holz": {"Holz"};
	case "EMonkeys_inv_bretter": {"Holzbretter"};
	case "EMonkeys_inv_edelholz": {"Edelholz"};
	
	case "EMonkeys_inv_baumwolle": {"Baumwolle"};
	case "EMonkeys_inv_faser": {"Wollfaser"};
	case "EMonkeys_inv_stoff": {"Stoff"};
	
	case "EMonkeys_inv_felle": {"Felle"};
	case "EMonkeys_inv_unv_leder": {"Rohleder"};
	case "EMonkeys_inv_leder": {"Leder"};
	
	case "EMonkeys_inv_fahrzeugteile": {"Fahrzeugteile"};
	case "EMonkeys_inv_bp_humm_civ": {"Bauplan: M-900 Helikopter"};
	case "EMonkeys_inv_bs_humm_civ": {"Bausatz: M-900 Helikopter"};
	case "EMonkeys_inv_bs_zamak_i": {"Bausatz: Zamak Teil 1/2"};
	case "EMonkeys_inv_bs_zamak_ii": {"Bausatz: Zamak Teil 2/2"};
	
	case "EMonkeys_inv_bs_zamak_f_i": {"Bausatz: Zamak Fuel Teil 1/2"};
	case "EMonkeys_inv_bs_zamak_f_ii": {"Bausatz: Zamak Fuel Teil 2/2"};
	
	case "EMonkeys_inv_bs_zamak_r_i": {"Bausatz: Zamak Repair Teil 1/2"};
	case "EMonkeys_inv_bs_zamak_r_ii": {"Bausatz: Zamak Repair Teil 2/2"};
	
	case "EMonkeys_inv_bs_offroad": {"Bausatz: Offroad"};
	case "EMonkeys_inv_bs_suv": {"Bausatz: SUV"};
	
	case "EMonkeys_inv_eventitem_1": {"Event-Item 1"};
	case "EMonkeys_inv_eventitem_2": {"Event-Item 2"};
	case "EMonkeys_inv_eventitem_3": {"Event-Item 3"};
	
	case "EMonkeys_inv_beryll": {"Beryll"};
	case "EMonkeys_inv_aquamarin": {"Aquamarin"};
	case "EMonkeys_inv_bernstein": {"Bernstein"};
	case "EMonkeys_inv_koenigsbernstein": {"Königsbernstein"};
	case "EMonkeys_inv_royal_bracelet": {"Königlicher Armreif"};
	
	case "EMonkeys_inv_nephrit": {"Nephrit"};
	case "EMonkeys_inv_jade": {"Jade"};
	case "EMonkeys_inv_opal": {"Opal"};
	case "EMonkeys_inv_zwielichtopal": {"Zwielichtopal"};
	case "EMonkeys_inv_royal_necklace": {"Königliche Halskette"};
	
	case "EMonkeys_inv_peridot": {"Peridot"};
	case "EMonkeys_inv_tiefenperidot": {"Tiefenperidot"};
	case "EMonkeys_inv_zirkon": {"Zirkon"};
	case "EMonkeys_inv_fuerstenzirkon": {"Fuerstenzirkon"};
	case "EMonkeys_inv_royal_scepter": {"Königliches Szepter"};
	
	case "EMonkeys_inv_saphir": {"Saphir"};
	case "EMonkeys_inv_himmelssaphir": {"Himmelssaphir"};
	case "EMonkeys_inv_smaragd": {"Smaragd"};
	case "EMonkeys_inv_traumsmaragd": {"Traumsmaragd"};
	case "EMonkeys_inv_royal_ring": {"Königlicher Ring"};
	
	case "EMonkeys_inv_fossilgestein": {"Fossilgestein"};
	case "EMonkeys_inv_rfossilgestein": {"Fossilgestein Elemente"};
	case "EMonkeys_inv_achat": {"Achat"};
	case "EMonkeys_inv_amethyst": {"Amethyst"};
	case "EMonkeys_inv_malachit": {"Malachit"};
	case "EMonkeys_inv_quarz": {"Quarz"};
	case "EMonkeys_inv_rquarz": {"Quarz Elemente"};
	case "EMonkeys_inv_obsidian": {"Obsidian"};
	case "EMonkeys_inv_rubin": {"Rubin"};
	case "EMonkeys_inv_tigerauge": {"Tigerauge"};
	case "EMonkeys_inv_royal_crown": {"Königliche Krone"};
	
	case "EMonkeys_inv_blutstein": {"Blutstein"};
	case "EMonkeys_inv_blutdiamant": {"Blutdiamant"};
	
	case "EMonkeys_inv_dreck": {"Dreck"};
	case "EMonkeys_inv_dreckhaufen": {"Dreckhaufen"};
	case "EMonkeys_inv_gpstracker": {"GPS Tracker"};
	case "EMonkeys_inv_gpsscanner": {"GPS Scanner"};
	case "EMonkeys_inv_gpsremover": {"GPS Entferner"};
	case "EMonkeys_inv_urkunde_q315": {"Besitzurkunde Q3/15"};
    case "EMonkeys_inv_urkunde_q415": {"Besitzurkunde Q4/15"};
	case "EMonkeys_inv_urkunde_q116": {"Besitzurkunde Q1/16"};
	case "EMonkeys_inv_urkunde_q216": {"Besitzurkunde Q2/16"};
};