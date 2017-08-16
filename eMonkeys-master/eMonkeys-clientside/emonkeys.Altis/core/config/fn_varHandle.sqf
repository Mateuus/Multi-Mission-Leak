/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			//case "money": {"EMonkeys_c164"};
			case "oilu": {"EMonkeys_inv_oilu"};
			case "oilp": {"EMonkeys_inv_oilp"};
			case "heroinu": {"EMonkeys_inv_heroinu"};
			case "heroinp": {"EMonkeys_inv_heroinp"};
			case "cannabis": {"EMonkeys_inv_cannabis"};
			case "marijuana": {"EMonkeys_inv_marijuana"};
			case "apple": {"EMonkeys_inv_apple"};
			case "water": {"EMonkeys_inv_water"};
			case "rabbit": {"EMonkeys_inv_rabbit"};
			case "salema": {"EMonkeys_inv_salema"};
			case "ornate": {"EMonkeys_inv_ornate"};
			case "mackerel": {"EMonkeys_inv_mackerel"};
			case "tuna": {"EMonkeys_inv_tuna"};
			case "mullet": {"EMonkeys_inv_mullet"};
			case "catshark": {"EMonkeys_inv_catshark"};
			case "turtle": {"EMonkeys_inv_turtle"};
			case "fishing": {"EMonkeys_inv_fishingpoles"};
			case "coffee": {"EMonkeys_inv_coffee"};
			case "turtlesoup": {"EMonkeys_inv_turtlesoup"};
			case "donuts": {"EMonkeys_inv_donuts"};
			case "mash": {"EMonkeys_inv_mash"};
			case "fuelE": {"EMonkeys_inv_fuelE"};
			case "fuelF": {"EMonkeys_inv_fuelF"};
			case "fuelcan_super": {"EMonkeys_inv_fuelcan_super"};
			case "fuelcan_superplus": {"EMonkeys_inv_fuelcan_superplus"};
			case "fuelcan_diesel": {"EMonkeys_inv_fuelcan_diesel"};
			case "fuelcan_biodiesel": {"EMonkeys_inv_fuelcan_biodiesel"};
			case "fuelcan_kerosin": {"EMonkeys_inv_fuelcan_kerosin"};
			case "pickaxe": {"EMonkeys_inv_pickaxe"};
			case "pumpe": {"EMonkeys_inv_pumpe"};
			case "axt": {"EMonkeys_inv_axt"};
			case "hasenfalle": {"EMonkeys_inv_hasenfalle"};
			case "copperore": {"EMonkeys_inv_copperore"};
			case "ironore": {"EMonkeys_inv_ironore"};
			case "iron_r": {"EMonkeys_inv_ironr"};
			case "copper_r": {"EMonkeys_inv_copperr"};
			case "salt": {"EMonkeys_inv_salt"};
			case "salt_r": {"EMonkeys_inv_saltr"};
			case "sand": {"EMonkeys_inv_sand"};
			case "glass": {"EMonkeys_inv_glass"};
			case "tbacon": {"EMonkeys_inv_tbacon"};
			case "lockpick": {"EMonkeys_inv_lockpick"};
			case "redgull": {"EMonkeys_inv_redgull"};
			case "peach": {"EMonkeys_inv_peach"};
			case "diamond": {"EMonkeys_inv_diamond"};
			case "diamondc": {"EMonkeys_inv_diamondr"};
			case "cocaine": {"EMonkeys_inv_coke"};
			case "cocainep": {"EMonkeys_inv_cokep"};
			case "spikeStrip": {"EMonkeys_inv_spikeStrip"};
			case "cement": {"EMonkeys_inv_cement"};
			case "rock": {"EMonkeys_inv_rock"};
			case "goldbar": {"EMonkeys_inv_goldbar"};
			case "silver": {"EMonkeys_inv_silver"};
			case "silverr": {"EMonkeys_inv_silverr"};
			case "blastingcharge": {"EMonkeys_inv_blastingcharge"};
			case "boltcutter": {"EMonkeys_inv_boltcutter"};
			case "defusekit": {"EMonkeys_inv_defusekit"};
			case "handcuffs": {"EMonkeys_inv_handcuffs"};
			case "jutesack": {"EMonkeys_inv_jutesack"};
			case "battery": {"EMonkeys_inv_battery"};
			case "furniture_01": {"EMonkeys_inv_furniture_01"};
			case "furniture_02": {"EMonkeys_inv_furniture_02"};
			case "furniture_03": {"EMonkeys_inv_furniture_03"};
			case "furniture_04": {"EMonkeys_inv_furniture_04"};
			case "furniture_05": {"EMonkeys_inv_furniture_05"};
			case "mauer": {"EMonkeys_inv_mauer"};
			case "kegel": {"EMonkeys_inv_kegel"};
			case "rye": {"EMonkeys_inv_rye"};
			case "hops": {"EMonkeys_inv_hops"};
			case "yeast": {"EMonkeys_inv_yeast"};
			case "cornmeal": {"EMonkeys_inv_cornmeal"};
			case "moonshine": {"EMonkeys_inv_moonshine"};
			case "bottles": {"EMonkeys_inv_bottles"};
			case "bottledshine": {"EMonkeys_inv_bottledshine"};
			case "bottledbeer": {"EMonkeys_inv_bottledbeer"};
			case "bottledwhiskey": {"EMonkeys_inv_bottledwhiskey"};
			case "beerp": {"EMonkeys_inv_beerp"};
			case "whiskey": {"EMonkeys_inv_whiskey"};
			case "banana": {"EMonkeys_inv_banana"};
			case "pear": {"EMonkeys_inv_pear"};
			case "lemon": {"EMonkeys_inv_lemon"};
			case "cherry": {"EMonkeys_inv_cherry"};
			case "obstsalat": {"EMonkeys_inv_obstsalat"};
			
			case "goldener_pokal": {"EMonkeys_inv_goldener_pokal"};
			case "silberner_pokal": {"EMonkeys_inv_silberner_pokal"};
			case "bronzener_pokal": {"EMonkeys_inv_bronzener_pokal"};
			
			case "insurance_a": {"EMonkeys_inv_insurance_a"};
			case "insurance_b": {"EMonkeys_inv_insurance_b"};
			
			case "tabak": {"EMonkeys_inv_tabak"};
			case "feinschnitt": {"EMonkeys_inv_feinschnitt"};
			case "seawater": {"EMonkeys_inv_seawater"};
			case "diesel": {"EMonkeys_inv_diesel"};
			case "diesel_gestreckt": {"EMonkeys_inv_diesel_gestreckt"};
			case "biodiesel": {"EMonkeys_inv_biodiesel"};
			case "super": {"EMonkeys_inv_super"};
			case "superplus": {"EMonkeys_inv_superplus"};
			case "zigarette": {"EMonkeys_inv_zigarette"};
			case "raps": {"EMonkeys_inv_raps"};
			case "tabakblatt": {"EMonkeys_inv_tabakblatt"};
			case "zigarre": {"EMonkeys_inv_zigarre"};
			case "edelzigarre": {"EMonkeys_inv_edelzigarre"};
			case "joints": {"EMonkeys_inv_joints"};
			case "pornoheft": {"EMonkeys_pornoheft"};
			
			//Jetmining
			case "cellulosepulver": {"EMonkeys_inv_cellulosepulver"};
			case "maisstaerke": {"EMonkeys_inv_maisstaerke"};
			case "mischmittel": {"EMonkeys_inv_mischmittel"};
			case "natriumchlorid": {"EMonkeys_inv_natriumchlorid"};
			case "tablettenrohling": {"EMonkeys_inv_tablettenrohling"};
			case "acetylsalicylsaeure": {"EMonkeys_inv_acetylsalicylsaeure"};
			case "aspirin": {"EMonkeys_inv_aspirin"};
			case "sildenafil": {"EMonkeys_inv_sildenafil"};
			case "viagra": {"EMonkeys_inv_viagra"};
			case "hypromellose": {"EMonkeys_inv_hypromellose"};
			case "casanovil": {"EMonkeys_inv_casanovil"};
			
			case "defibrillator" : {"EMonkeys_inv_defibrillator"};
			case "bandage" : {"EMonkeys_inv_bandage"};
			case "morphine" : {"EMonkeys_inv_morphine"};
			
			//Crafting
			case "craftingtool_01": {"EMonkeys_inv_craftingtool_01"};
			case "bp_sting": {"EMonkeys_inv_bp_sting"};
			case "bp_vermin": {"EMonkeys_inv_bp_vermin"};
			case "bp_trg21": {"EMonkeys_inv_bp_trg21"};
			case "bp_mxc": {"EMonkeys_inv_bp_mxc"};
			case "bp_mx": {"EMonkeys_inv_bp_mx"};
			case "bp_mx_gl_sog": {"EMonkeys_inv_bp_mx_gl_sog"};
			case "bp_mx_ps": {"EMonkeys_inv_bp_mx_ps"};
			case "bp_mxm_lz": {"EMonkeys_inv_bp_mxm_lz"};
			case "bp_mxm_sog": {"EMonkeys_inv_bp_mxm_sog"};
			case "bp_mxm_soa": {"EMonkeys_inv_bp_mxm_soa"};
			case "bp_mxm_grp": {"EMonkeys_inv_bp_mxm_grp"};
			case "bp_katiba": {"EMonkeys_inv_bp_katiba"};
			case "bp_lynx": {"EMonkeys_inv_bp_lynx"};
			case "bp_rahim": {"EMonkeys_inv_bp_rahim"};
			case "bp_sln9mm": {"EMonkeys_inv_bp_sln9mm"};
			case "bp_sln556": {"EMonkeys_inv_bp_sln556"};
			case "bp_sln65": {"EMonkeys_inv_bp_sln65"};
			case "bp_sln762": {"EMonkeys_inv_bp_sln762"};
			case "bp_sln338": {"EMonkeys_inv_bp_sln338"};
			case "bp_slnacp": {"EMonkeys_inv_bp_slnacp"};
			case "bp_bipod": {"EMonkeys_inv_bp_bipod"};
			case "bp_fatvest": {"EMonkeys_inv_bp_fatvest"};
			case "bp_vestclblack_grp": {"EMonkeys_inv_bp_vestclblack_grp"};
			case "bp_vestcrgreen_grp": {"EMonkeys_inv_bp_vestcrgreen_grp"};
			case "bp_vestpcl_ctrg": {"EMonkeys_inv_bp_vestpcl_ctrg"};
			case "bp_vestpch_ctrg": {"EMonkeys_inv_bp_vestpch_ctrg"};
			case "bp_tacvestblack_grp": {"EMonkeys_inv_bp_tacvestblack_grp"};
			case "bp_vestclblack2_grp": {"EMonkeys_inv_bp_vestclblack2_grp"};
			case "bp_tazer": {"EMonkeys_inv_bp_tazer"};
			
			case "bp_sniperoptic": {"EMonkeys_inv_bp_sniperoptic"};
			case "bp_rolex": {"EMonkeys_inv_bp_rolex"};
			case "bp_furniture_05": {"EMonkeys_inv_bp_furniture_05"};
			case "rolex": {"EMonkeys_inv_rolex"};
			case "maut_pkw": {"EMonkeys_inv_maut_pkw"};
			case "maut_lkw": {"EMonkeys_inv_maut_lkw"};
			case "carbonfaser": {"EMonkeys_inv_carbonfaser"};
			case "kohlenstoff": {"EMonkeys_inv_kohlenstoff"};
			case "plastik": {"EMonkeys_inv_plastik"};
			case "goldarmierung": {"EMonkeys_inv_goldarmierung"};
			case "uhrwerk": {"EMonkeys_inv_uhrwerk"};
			case "ziffernblatt": {"EMonkeys_inv_ziffernblatt"};
			case "kupferteile": {"EMonkeys_inv_kupferteile"};
			case "zahnrad": {"EMonkeys_inv_zahnrad"};
			case "alup": {"EMonkeys_inv_alup"};
			case "alufaser": {"EMonkeys_inv_alufaser"};
			case "aluunrein": {"EMonkeys_inv_aluunrein"};
			case "papier": {"EMonkeys_inv_papier"};
			case "elektroschrott": {"EMonkeys_inv_elektroschrott"};
			case "edelmetall": {"EMonkeys_inv_edelmetall"};
			case "flush": {"EMonkeys_inv_flush"};
			case "phosphor": {"EMonkeys_inv_phosphor"};
			
			case "almanach": {"EMonkeys_inv_almanach"};
			case "aktex": {"EMonkeys_inv_aktex"};
	
			case "aktex1": {"EMonkeys_inv_aktex1"};
			case "aktex2": {"EMonkeys_inv_aktex2"};
			case "aktex3": {"EMonkeys_inv_aktex3"};
			case "aktex4": {"EMonkeys_inv_aktex4"};
			case "aktex5": {"EMonkeys_inv_aktex5"};
			case "aktex6": {"EMonkeys_inv_aktex6"};
			case "aktex7": {"EMonkeys_inv_aktex7"};
			case "aktex8": {"EMonkeys_inv_aktex8"};
			case "aktex9": {"EMonkeys_inv_aktex9"};
			
			case "bp_almanach": {"EMonkeys_inv_bp_almanach"};
			case "bp_aktex": {"EMonkeys_inv_bp_aktex"};
			
			case "bp_mk20": {"EMonkeys_inv_bp_mk20"};
			case "bp_mxm": {"EMonkeys_inv_bp_mxm"};
			case "bp_mk200mg": {"EMonkeys_inv_bp_mk200mg"};
			
			case "bp_mar10": {"EMonkeys_inv_bp_mar10"};
			case "bp_mk1": {"EMonkeys_inv_bp_mk1"};
			case "bp_mk14": {"EMonkeys_inv_bp_mk14"};
			case "bp_mk18": {"EMonkeys_inv_bp_mk18"};
			case "bp_zafir": {"EMonkeys_inv_bp_zafir"};
			
			case "bp_titan_aa": {"EMonkeys_inv_bp_titan_aa"};
			case "bp_launch_RPG32": {"EMonkeys_inv_bp_launch_RPG32"};
			
			case "bp_titanr_aa": {"EMonkeys_inv_bp_titanr_aa"};
			case "bp_RPG32": {"EMonkeys_inv_bp_RPG32"};
			
			case "bp_ghillie": {"EMonkeys_inv_bp_ghillie"};
			case "bp_lz_vest": {"EMonkeys_inv_bp_lz_vest"};
			
			case "holz": {"EMonkeys_inv_holz"};
			case "bretter": {"EMonkeys_inv_bretter"};
			case "edelholz": {"EMonkeys_inv_edelholz"};
			
			case "felle": {"EMonkeys_inv_felle"};
			case "unv_leder": {"EMonkeys_inv_unv_leder"};
			case "leder": {"EMonkeys_inv_leder"};
			
			case "baumwolle": {"EMonkeys_inv_baumwolle"};
			case "faser": {"EMonkeys_inv_faser"};
			case "stoff": {"EMonkeys_inv_stoff"};
			
			case "dreck": {"EMonkeys_inv_dreck"};
			case "dreckhaufen": {"EMonkeys_inv_dreckhaufen"};
			
			case "schutt": {"EMonkeys_inv_schutt"};
			case "schutthaufen": {"EMonkeys_inv_schutthaufen"};
			
			case "fahrzeugteile": {"EMonkeys_inv_fahrzeugteile"};
			case "bp_humm_civ": {"EMonkeys_inv_bp_humm_civ"};
			case "bs_humm_civ": {"EMonkeys_inv_bs_humm_civ"};
			case "bs_zamak_i": {"EMonkeys_inv_bs_zamak_i"};
			case "bs_zamak_ii": {"EMonkeys_inv_bs_zamak_ii"};
			
			case "bs_zamak_r_i": {"EMonkeys_inv_bs_zamak_r_i"};
			case "bs_zamak_r_ii": {"EMonkeys_inv_bs_zamak_r_ii"};
			
			case "bs_zamak_f_i": {"EMonkeys_inv_bs_zamak_f_i"};
			case "bs_zamak_f_ii": {"EMonkeys_inv_bs_zamak_f_ii"};
			
			case "bs_offroad": {"EMonkeys_inv_bs_offroad"};
			case "bs_suv": {"EMonkeys_inv_bs_suv"};
			
			case "eventitem_1": {"EMonkeys_inv_eventitem_1"};
			case "eventitem_2": {"EMonkeys_inv_eventitem_2"};
			case "eventitem_3": {"EMonkeys_inv_eventitem_3"};
			
			case "titanore": {"EMonkeys_inv_titanore"};
			case "titaneisen": {"EMonkeys_inv_titaneisen"};
			case "titanmantel": {"EMonkeys_inv_titanmantel"};
			
			case "urkunde_q315": {"EMonkeys_inv_urkunde_q315"};
            case "urkunde_q415": {"EMonkeys_inv_urkunde_q415"};
			case "urkunde_q116": {"EMonkeys_inv_urkunde_q116"};
			case "urkunde_q216": {"EMonkeys_inv_urkunde_q216"};
			
			case "gpstracker": {"EMonkeys_inv_gpstracker"};
			case "gpsscanner": {"EMonkeys_inv_gpsscanner"};
			case "gpsremover": {"EMonkeys_inv_gpsremover"};
			
			case "beryll": {"EMonkeys_inv_beryll"};
			case "aquamarin": {"EMonkeys_inv_aquamarin"};
			case "bernstein": {"EMonkeys_inv_bernstein"};
			case "koenigsbernstein": {"EMonkeys_inv_koenigsbernstein"};
			case "royal_bracelet": {"EMonkeys_inv_royal_bracelet"};
	
			case "nephrit": {"EMonkeys_inv_nephrit"};
			case "jade": {"EMonkeys_inv_jade"};
			case "opal": {"EMonkeys_inv_opal"};
			case "zwielichtopal": {"EMonkeys_inv_zwielichtopal"};
			case "royal_necklace": {"EMonkeys_inv_royal_necklace"};
	
			case "peridot": {"EMonkeys_inv_peridot"};
			case "tiefenperidot": {"EMonkeys_inv_tiefenperidot"};
			case "zirkon": {"EMonkeys_inv_zirkon"};
			case "fuerstenzirkon": {"EMonkeys_inv_fuerstenzirkon"};
			case "royal_scepter": {"EMonkeys_inv_royal_scepter"};
	
			case "saphir": {"EMonkeys_inv_saphir"};
			case "himmelssaphir": {"EMonkeys_inv_himmelssaphir"};
			case "smaragd": {"EMonkeys_inv_smaragd"};
			case "traumsmaragd": {"EMonkeys_inv_traumsmaragd"};
			case "royal_ring": {"EMonkeys_inv_royal_ring"};
	
			case "fossilgestein": {"EMonkeys_inv_fossilgestein"};
			case "rfossilgestein": {"EMonkeys_inv_rfossilgestein"};
			case "achat": {"EMonkeys_inv_achat"};
			case "amethyst": {"EMonkeys_inv_amethyst"};
			case "malachit": {"EMonkeys_inv_malachit"};
			case "quarz": {"EMonkeys_inv_quarz"};
			case "rquarz": {"EMonkeys_inv_rquarz"};
			case "obsidian": {"EMonkeys_inv_obsidian"};
			case "rubin": {"EMonkeys_inv_rubin"};
			case "tigerauge": {"EMonkeys_inv_tigerauge"};
			case "royal_crown": {"EMonkeys_inv_royal_crown"};
	
			case "blutstein": {"EMonkeys_inv_blutstein"};
			case "blutdiamant": {"EMonkeys_inv_blutdiamant"};
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "EMonkeys_inv_oilu": {"oilu"};
			case "EMonkeys_inv_oilp": {"oilp"};
			case "EMonkeys_inv_heroinu": {"heroinu"};
			case "EMonkeys_inv_heroinp": {"heroinp"};
			case "EMonkeys_inv_cannabis": {"cannabis"};
			case "EMonkeys_inv_marijuana": {"marijuana"};
			case "EMonkeys_inv_apple": {"apple"};
			case "EMonkeys_inv_water": {"water"};
			case "EMonkeys_inv_rabbit": {"rabbit"};
			case "EMonkeys_inv_salema": {"salema"};
			case "EMonkeys_inv_ornate": {"ornate"};
			case "EMonkeys_inv_mackerel": {"mackerel"};
			case "EMonkeys_inv_tuna": {"tuna"};
			case "EMonkeys_inv_mullet": {"mullet"};
			case "EMonkeys_inv_catshark": {"catshark"};
			case "EMonkeys_inv_turtle": {"turtle"};
			case "EMonkeys_inv_fishingpoles": {"fishing"};
			case "EMonkeys_inv_coffee": {"coffee"};
			case "EMonkeys_inv_turtlesoup": {"turtlesoup"};
			case "EMonkeys_inv_donuts": {"donuts"};
			case "EMonkeys_inv_fuelE": {"fuelE"};
			case "EMonkeys_inv_fuelF": {"fuelF"};
			case "EMonkeys_inv_fuelcan_super": {"fuelcan_super"};
			case "EMonkeys_inv_fuelcan_superplus": {"fuelcan_superplus"};
			case "EMonkeys_inv_fuelcan_diesel": {"fuelcan_diesel"};
			case "EMonkeys_inv_fuelcan_biodiesel": {"fuelcan_biodiesel"};
			case "EMonkeys_inv_fuelcan_kerosin": {"fuelcan_kerosin"};
			//case "EMonkeys_c164": {"money"};
			case "EMonkeys_inv_pickaxe": {"pickaxe"};
			case "EMonkeys_inv_pumpe": {"pumpe"};
			case "EMonkeys_inv_axt": {"axt"};
			case "EMonkeys_inv_hasenfalle": {"hasenfalle"};
			case "EMonkeys_inv_copperore": {"copperore"};
			case "EMonkeys_inv_ironore": {"ironore"};
			case "EMonkeys_inv_ironr": {"iron_r"};
			case "EMonkeys_inv_copperr": {"copper_r"};
			case "EMonkeys_inv_sand": {"sand"};
			case "EMonkeys_inv_salt": {"salt"};
			case "EMonkeys_inv_glass": {"glass"};
			case "EMonkeys_inv_redgull": {"redgull"};
			case "EMonkeys_inv_lockpick": {"lockpick"};
			case "EMonkeys_inv_tbacon": {"tbacon"};
			case "EMonkeys_inv_peach": {"peach"};
			case "EMonkeys_inv_diamond": {"diamond"};
			case "EMonkeys_inv_diamondr": {"diamondc"};
			case "EMonkeys_inv_saltr": {"salt_r"};
			case "EMonkeys_inv_coke": {"cocaine"};
			case "EMonkeys_inv_cokep": {"cocainep"};
			case "EMonkeys_inv_spikeStrip": {"spikeStrip"};
			case "EMonkeys_inv_cement": {"cement"};
			case "EMonkeys_inv_rock": {"rock"};
			case "EMonkeys_inv_goldbar": {"goldbar"};
			case "EMonkeys_inv_silver": {"silver"}; //##10 ##11 ##12
			case "EMonkeys_inv_silverr": {"silverr"};
			case "EMonkeys_inv_blastingcharge": {"blastingcharge"};
			case "EMonkeys_inv_boltcutter": {"boltcutter"};
			case "EMonkeys_inv_defusekit": {"defusekit"};
			case "EMonkeys_inv_handcuffs": {"handcuffs"};
			case "EMonkeys_inv_jutesack": {"jutesack"};
			case "EMonkeys_inv_battery": {"battery"};
			case "EMonkeys_inv_furniture_01": {"furniture_01"};
			case "EMonkeys_inv_furniture_02": {"furniture_02"};
			case "EMonkeys_inv_furniture_03": {"furniture_03"};
			case "EMonkeys_inv_furniture_04": {"furniture_04"};
			case "EMonkeys_inv_furniture_05": {"furniture_05"};
			case "EMonkeys_inv_mauer": {"mauer"};
			case "EMonkeys_inv_kegel": {"kegel"};
			case "EMonkeys_inv_mash": {"mash"};
			case "EMonkeys_inv_yeast": {"yeast"};
			case "EMonkeys_inv_rye": {"rye"};
			case "EMonkeys_inv_hops": {"hops"};
			case "EMonkeys_inv_whiskey": {"whiskey"};
			case "EMonkeys_inv_beerp": {"beerp"};
			case "EMonkeys_inv_bottles": {"bottles"};
			case "EMonkeys_inv_cornmeal": {"cornmeal"};
			case "EMonkeys_inv_bottledwhiskey": {"bottledwhiskey"};
			case "EMonkeys_inv_bottledbeer": {"bottledbeer"};
			case "EMonkeys_inv_bottledshine": {"bottledshine"};
			case "EMonkeys_inv_moonshine": {"moonshine"};
			case "EMonkeys_inv_banana": {"banana"};
			case "EMonkeys_inv_pear": {"pear"};
			case "EMonkeys_inv_lemon": {"lemon"};
			case "EMonkeys_inv_cherry": {"cherry"};
			case "EMonkeys_inv_obstsalat": {"obstsalat"};
			
			case "EMonkeys_inv_goldener_pokal": {"goldener_pokal"};
			case "EMonkeys_inv_silberner_pokal": {"silberner_pokal"};
			case "EMonkeys_inv_bronzener_pokal": {"bronzener_pokal"};
			
			case "EMonkeys_inv_insurance_a": {"insurance_a"};
			case "EMonkeys_inv_insurance_b": {"insurance_b"};
			
			case "EMonkeys_inv_tabak": {"tabak"};
			case "EMonkeys_inv_feinschnitt": {"feinschnitt"};
			case "EMonkeys_inv_seawater": {"seawater"};
			case "EMonkeys_inv_diesel": {"diesel"};
			case "EMonkeys_inv_diesel_gestreckt": {"diesel_gestreckt"};
			case "EMonkeys_inv_biodiesel": {"biodiesel"};
			case "EMonkeys_inv_super": {"super"};
			case "EMonkeys_inv_superplus": {"superplus"};
			case "EMonkeys_inv_zigarette": {"zigarette"};
			case "EMonkeys_inv_raps": {"raps"};
			case "EMonkeys_inv_tabakblatt": {"tabakblatt"};
			case "EMonkeys_inv_zigarre": {"zigarre"};
			case "EMonkeys_inv_edelzigarre": {"edelzigarre"};
			case "EMonkeys_inv_joints": {"joints"};
			case "EMonkeys_inv_pornoheft": {"pornoheft"};
			
			//Jetmining
			case "EMonkeys_inv_cellulosepulver": {"cellulosepulver"};
			case "EMonkeys_inv_maisstaerke": {"maisstaerke"};
			case "EMonkeys_inv_mischmittel": {"mischmittel"};
			case "EMonkeys_inv_natriumchlorid": {"natriumchlorid"};
			case "EMonkeys_inv_tablettenrohling": {"tablettenrohling"};
			case "EMonkeys_inv_acetylsalicylsaeure": {"acetylsalicylsaeure"};
			case "EMonkeys_inv_aspirin": {"aspirin"};
			case "EMonkeys_inv_sildenafil": {"sildenafil"};
			case "EMonkeys_inv_viagra": {"viagra"};
			case "EMonkeys_inv_hypromellose": {"hypromellose"};
			case "EMonkeys_inv_casanovil": {"casanovil"};
			
			
			case "EMonkeys_inv_defibrillator" : {"defibrillator"};
			case "EMonkeys_inv_bandage" : {"bandage"};
			case "EMonkeys_inv_morphine" : {"morphine"};
			case "EMonkeys_c164" : {"money"};
			
			//Crafting
			case "EMonkeys_inv_craftingtool_01": {"craftingtool_01"};
			case "EMonkeys_inv_bp_sting": {"bp_sting"};
			case "EMonkeys_inv_bp_vermin": {"bp_vermin"};
			case "EMonkeys_inv_bp_trg21": {"bp_trg21"};
			case "EMonkeys_inv_bp_mxc": {"bp_mxc"};
			case "EMonkeys_inv_bp_mx": {"bp_mx"};
			case "EMonkeys_inv_bp_mx_gl_sog": {"bp_mx_gl_sog"};
			case "EMonkeys_inv_bp_mx_ps": {"bp_mx_ps"};
			case "EMonkeys_inv_bp_mxm_lz": {"bp_mxm_lz"};
			case "EMonkeys_inv_bp_mxm_sog": {"bp_mxm_sog"};
			case "EMonkeys_inv_bp_mxm_soa": {"bp_mxm_soa"};
			case "EMonkeys_inv_bp_mxm_grp": {"bp_mxm_grp"};
			case "EMonkeys_inv_bp_katiba": {"bp_katiba"};
			case "EMonkeys_inv_bp_lynx": {"bp_lynx"};
			case "EMonkeys_inv_bp_zafir": {"bp_zafir"};
			case "EMonkeys_inv_bp_rahim": {"bp_rahim"};
			case "EMonkeys_inv_bp_sln9mm": {"bp_sln9mm"};
			case "EMonkeys_inv_bp_sln556": {"bp_sln556"};
			case "EMonkeys_inv_bp_sln65": {"bp_sln65"};
			case "EMonkeys_inv_bp_sln762": {"bp_sln762"};
			case "EMonkeys_inv_bp_sln338": {"bp_sln338"};
			case "EMonkeys_inv_bp_slnacp": {"bp_slnacp"};
			case "EMonkeys_inv_bp_bipod": {"bp_bipod"};
			case "EMonkeys_inv_bp_fatvest": {"bp_fatvest"};
			case "EMonkeys_inv_bp_vestclblack_grp": {"bp_vestclblack_grp"};
			case "EMonkeys_inv_bp_vestcrgreen_grp": {"bp_vestcrgreen_grp"};
			case "EMonkeys_inv_bp_tacvestblack_grp": {"bp_tacvestblack_grp"};
			case "EMonkeys_inv_bp_vestpcl_ctrg": {"bp_vestpcl_ctrg"};
			case "EMonkeys_inv_bp_vestpch_ctrg": {"bp_vestpch_ctrg"};
			case "EMonkeys_inv_bp_vestclblack2_grp": {"bp_vestclblack2_grp"};
			case "EMonkeys_inv_bp_tazer": {"bp_tazer"};
			
			case "EMonkeys_inv_bp_sniperoptic": {"bp_sniperoptic"};
			case "EMonkeys_inv_bp_rolex": {"bp_rolex"};
			case "EMonkeys_inv_bp_furniture_05": {"bp_furniture_05"};
			case "EMonkeys_inv_rolex": {"rolex"};
			case "EMonkeys_inv_maut_pkw": {"maut_pkw"};
			case "EMonkeys_inv_maut_lkw": {"maut_lkw"};
			case "EMonkeys_inv_carbonfaser": {"carbonfaser"};
			case "EMonkeys_inv_kohlenstoff": {"kohlenstoff"};
			case "EMonkeys_inv_plastik": {"plastik"};
			case "EMonkeys_inv_goldarmierung": {"goldarmierung"};
			case "EMonkeys_inv_uhrwerk": {"uhrwerk"};
			case "EMonkeys_inv_ziffernblatt": {"ziffernblatt"};
			case "EMonkeys_inv_kupferteile": {"kupferteile"};
			case "EMonkeys_inv_zahnrad": {"zahnrad"};
			case "EMonkeys_inv_alup": {"alup"};
			case "EMonkeys_inv_alufaser": {"alufaser"};
			case "EMonkeys_inv_aluunrein": {"aluunrein"};
			case "EMonkeys_inv_papier": {"papier"};
			case "EMonkeys_inv_elektroschrott": {"elektroschrott"};
			case "EMonkeys_inv_edelmetall": {"edelmetall"};
			case "EMonkeys_inv_flush": {"flush"};
			case "EMonkeys_inv_phosphor": {"phosphor"};
			
			case "EMonkeys_inv_almanach": {"almanach"};
			case "EMonkeys_inv_aktex": {"aktex"};
	
			case "EMonkeys_inv_aktex1": {"aktex1"};
			case "EMonkeys_inv_aktex2": {"aktex2"};
			case "EMonkeys_inv_aktex3": {"aktex3"};
			case "EMonkeys_inv_aktex4": {"aktex4"};
			case "EMonkeys_inv_aktex5": {"aktex5"};
			case "EMonkeys_inv_aktex6": {"aktex6"};
			case "EMonkeys_inv_aktex7": {"aktex7"};
			case "EMonkeys_inv_aktex8": {"aktex8"};
			case "EMonkeys_inv_aktex9": {"aktex9"};
			
			case "EMonkeys_inv_bp_almanach": {"bp_almanach"};
			case "EMonkeys_inv_bp_aktex": {"bp_aktex"};
			
			case "EMonkeys_inv_bp_mk20": {"bp_mk20"};
			case "EMonkeys_inv_bp_mxm": {"bp_mxm"};
			case "EMonkeys_inv_bp_mk200mg": {"bp_mk200mg"};
			
			case "EMonkeys_inv_bp_mar10": {"bp_mar10"};
			case "EMonkeys_inv_bp_mk1": {"bp_mk1"};
			case "EMonkeys_inv_bp_mk14": {"bp_mk14"};
			case "EMonkeys_inv_bp_mk18": {"bp_mk18"};
			
			case "EMonkeys_inv_bp_titan_aa": {"bp_titan_aa"};
			case "EMonkeys_inv_bp_launch_RPG32": {"bp_launch_RPG32"};
			
			case "EMonkeys_inv_bp_titanr_aa": {"bp_titanr_aa"};
			case "EMonkeys_inv_bp_RPG32": {"bp_RPG32"};
			
			case "EMonkeys_inv_bp_ghillie": {"bp_ghillie"};
			case "EMonkeys_inv_bp_lz_vest": {"bp_lz_vest"};
			
			case "EMonkeys_inv_holz": {"holz"};
			case "EMonkeys_inv_bretter": {"bretter"};
			case "EMonkeys_inv_edelholz": {"edelholz"};
			
			case "EMonkeys_inv_felle": {"felle"};
			case "EMonkeys_inv_unv_leder": {"unv_leder"};
			case "EMonkeys_inv_leder": {"leder"};
			
			case "EMonkeys_inv_baumwolle": {"baumwolle"};
			case "EMonkeys_inv_faser": {"faser"};
			case "EMonkeys_inv_stoff": {"stoff"};
			
			case "EMonkeys_inv_dreck": {"dreck"};
			case "EMonkeys_inv_dreckhaufen": {"dreckhaufen"};
			
			case "EMonkeys_inv_fahrzeugteile": {"fahrzeugteile"};
			case "EMonkeys_inv_bp_humm_civ": {"bp_humm_civ"};
			case "EMonkeys_inv_bs_zamak_i": {"bs_zamak_i"};
			case "EMonkeys_inv_bs_zamak_ii": {"bs_zamak_ii"};
			
			case "EMonkeys_inv_bs_zamak_r_i": {"bs_zamak_r_i"};
			case "EMonkeys_inv_bs_zamak_r_ii": {"bs_zamak_r_ii"};
			
			case "EMonkeys_inv_bs_zamak_f_i": {"bs_zamak_f_i"};
			case "EMonkeys_inv_bs_zamak_f_ii": {"bs_zamak_f_ii"};
			
			case "EMonkeys_inv_bs_humm_civ": {"bs_humm_civ"};
			case "EMonkeys_inv_bs_offroad": {"bs_offroad"};
			case "EMonkeys_inv_bs_suv": {"bs_suv"};

			case "EMonkeys_inv_eventitem_1": {"eventitem_1"};
			case "EMonkeys_inv_eventitem_2": {"eventitem_2"};
			case "EMonkeys_inv_eventitem_3": {"eventitem_3"};
						
			case "EMonkeys_inv_titaneisen": {"titaneisen"};
			case "EMonkeys_inv_titanore": {"titanore"};
			case "EMonkeys_inv_titanmantel": {"titanmantel"};
			case "EMonkeys_inv_schutt": {"schutt"};
			case "EMonkeys_inv_schutthaufen": {"schutthaufen"};
			case "EMonkeys_inv_urkunde_q315": {"urkunde_q315"};
            case "EMonkeys_inv_urkunde_q415": {"urkunde_q415"};
			case "EMonkeys_inv_urkunde_q116": {"urkunde_q116"};
			case "EMonkeys_inv_urkunde_q216": {"urkunde_q216"};
			case "EMonkeys_inv_gpstracker": {"gpstracker"}; 
			case "EMonkeys_inv_gpsscanner": {"gpsscanner"};
			case "EMonkeys_inv_gpsremover": {"gpsremover"};
			
			case "EMonkeys_inv_beryll": {"beryll"};
			case "EMonkeys_inv_aquamarin": {"aquamarin"};
			case "EMonkeys_inv_bernstein": {"bernstein"};
			case "EMonkeys_inv_koenigsbernstein": {"koenigsbernstein"};
			case "EMonkeys_inv_royal_bracelet": {"royal_bracelet"};
	
			case "EMonkeys_inv_nephrit": {"nephrit"};
			case "EMonkeys_inv_jade": {"jade"};
			case "EMonkeys_inv_opal": {"opal"};
			case "EMonkeys_inv_zwielichtopal": {"zwielichtopal"};
			case "EMonkeys_inv_royal_necklace": {"royal_necklace"};
	
			case "EMonkeys_inv_peridot": {"peridot"};
			case "EMonkeys_inv_tiefenperidot": {"tiefenperidot"};
			case "EMonkeys_inv_zirkon": {"zirkon"};
			case "EMonkeys_inv_fuerstenzirkon": {"fuerstenzirkon"};
			case "EMonkeys_inv_royal_scepter": {"royal_scepter"};
	
			case "EMonkeys_inv_saphir": {"saphir"};
			case "EMonkeys_inv_himmelssaphir": {"himmelssaphir"};
			case "EMonkeys_inv_smaragd": {"smaragd"};
			case "EMonkeys_inv_traumsmaragd": {"traumsmaragd"};
			case "EMonkeys_inv_royal_ring": {"royal_ring"};
	
			case "EMonkeys_inv_fossilgestein": {"fossilgestein"};
			case "EMonkeys_inv_rfossilgestein": {"rfossilgestein"};
			case "EMonkeys_inv_achat": {"achat"};
			case "EMonkeys_inv_amethyst": {"amethyst"};
			case "EMonkeys_inv_malachit": {"malachit"};
			case "EMonkeys_inv_quarz": {"quarz"};
			case "EMonkeys_inv_rquarz": {"rquarz"};
			case "EMonkeys_inv_obsidian": {"obsidian"};
			case "EMonkeys_inv_rubin": {"rubin"};
			case "EMonkeys_inv_tigerauge": {"tigerauge"};
			case "EMonkeys_inv_royal_crown": {"royal_crown"};
	
			case "EMonkeys_inv_blutstein": {"blutstein"};
			case "EMonkeys_inv_blutdiamant": {"blutdiamant"};
		};
	};
};
