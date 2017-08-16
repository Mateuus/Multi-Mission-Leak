#define VITEMMACRO(NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON) class NAME { \
		variable = VARNAME; \
		weight = WEIGHT; \
		displayName = DISPLAYNAME; \
		buyPrice = BUYPRICE; \
		sellPrice = SELLPRICE; \
		illegal = ILLEGAL; \
		edible = EDIBLE; \
		icon = ICON; \
	};
#define LICENSEMACRO(NAME,DISPLAYNAME,VARNAME,PRICE,ILLEGAL,SIDE) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
	};
#define true 1
#define false 0
class ANL_Settings {
	ANL_saveweapons = true;
	ANL_savevItems = true;
	ANL_SaveItem[] = { "pickaxe", "fuelE", "fuelF", "lockpick", "defusekit", "storagesmall", "storagebig", "battery", "zipties", "nitro", "speedbomb", "underwatercharge", "scalpel", "gpstracker", "cigarette", "cle", "cb", "excavator", "multipass", "couteau", "sacpatate", "redgull", "coffee", "water", "apple", "peach", "tbacon", "donuts", "salemap", "ornatep", "mackerelp", "tunap", "mulletp", "catsharkp", "turtleSoup","henrawp","roosterrawp","sheeprawp","goatrawp","rabbitrawp", "oilp", "copperr", "ironr", "saltr", "glass", "diamondr", "cement", "lingotor", "platinep", "skullp", "goldbarp", "goldbar", "heroinp", "marijuana", "cokep", "meth97", "kidney", "uranium", "puranium", "bottledshine", "bottledbeer", "bottledwhiskey", "wine", "mur", "sac", "cone", "barre", "lightr", "lightg", "lighty", "flecheg", "fleched", "tente1", "tente2", "feucamp", "spikestrip", "defib", "bloodbag", "painkillers", "marijuanam", "organkit", "camisole", "poudre", "kit", "tissu", "electro", "smoothies", "redburger", "sprite", "pepsi", "frite","gagkit","aiguille","bijoux","opium","sechouse","projecteur","projecteur2"};
	ANL_Location[] = {"B_MRAP_01_hmg_F"};
	ANL_sellArray[] = {
		{"arifle_MX_GL_Black_F",0},
		{"1Rnd_SmokeBlue_Grenade_shell",0},
		{"30Rnd_65x39_caseless_mag",0},
		{"arifle_MXM_Black_F",0},
		{"30Rnd_65x39_caseless_mag",0},
		{"arifle_MX_SW_Black_F",0},
		{"100Rnd_65x39_caseless_mag",0},
		{"arifle_MXC_Black_F",0},
		{"30Rnd_65x39_caseless_mag",0},
		{"arifle_MX_Black_F",0},
		{"30Rnd_65x39_caseless_mag",0},
		{"SMG_01_F",0},
		{"30Rnd_45ACP_Mag_SMG_01",0},
		{"arifle_sdar_F",0},
		{"20Rnd_556x45_UW_mag",0},
		{"hgun_P07_snds_F",0},
		{"16Rnd_9x21_Mag",0},
		{"muzzle_snds_acp",0},
		{"muzzle_snds_L",0},
		{"muzzle_snds_H",0},
		{"muzzle_snds_H_MG",0},
		{"muzzle_snds_B",0},
		{"acc_flashlight",0},
		{"acc_pointer_IR",0},
		{"optic_Holosight_smg",0},
		{"optic_Aco",0},
		{"optic_Arco",0},
		{"optic_Hamr",0},
		{"optic_MRCO",0},
		{"optic_DMS",0},
		{"optic_SOS",0},
		{"optic_LRPS",0},
		{"optic_NVS",0},
		{"SmokeShellBlue",0},
		{"HandGrenade_Stone",0},
		{"SatchelCharge_Remote_Mag",0},
		{"Chemlight_red",0},
		{"Chemlight_yellow",0},
		{"Chemlight_green",0},
		{"Chemlight_blue",0},
		{"ItemRadio",0},
		{"ItemCompass",0},
		{"ItemGPS",0},
		{"ItemMap",0},
		{"MineDetector",0},
		{"Rangefinder",0},
		{"Binocular",0},
		{"Toolkit",0},
		{"Medikit",0},
		{"FirstAidKit",0},
		{"NVGoggles_OPFOR",0}
	};
};
class ANL_VItems {
//DIVERS
	VITEMMACRO(pickaxe, "STR_Item_pickaxe", "pickaxe", 2, 100, 75, false, -1, "images\icons\pickaxe.paa")
	VITEMMACRO(fuelE, "STR_Item_fuelE", "fuelE", 2, 10, 5, false, -1, "images\icons\fuel.paa")
	VITEMMACRO(fuelF, "STR_Item_fuelF", "fuelF", 5, 60, 50, false, -1, "images\icons\fuel.paa")
	VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 20, 10, true, -1, "images\icons\lockpick.paa")
	VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingcharge", 15, 3000, 2000, true, -1, "images\icons\blastingcharge.paa")
	VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltcutter", 5, 500, 400, true, -1, "images\icons\boltcutter.paa")
	VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defusekit", 2, 200, 100, false, -1, "images\icons\defusekit.paa")
	VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storagesmall", 5, 5000, 3000, false, -1, "images\icons\storagesmall.paa")
	VITEMMACRO(storagebig, "STR_Item_StorageBL", "storagebig", 10, 15000, 10000, false, -1, "images\icons\storagebig.paa")
	VITEMMACRO(battery, "STR_Item_battery", "battery", 1, 100, 50, false, -1, "images\icons\battery.paa")
	VITEMMACRO(zipties, "STR_Item_zipties", "zipties", 1, 50, 40, true, -1, "images\icons\menottes.paa")
	VITEMMACRO(nitro, "STR_Item_nitro", "nitro", 5, 2000, 1000, false, -1, "images\icons\nitro.paa")
	VITEMMACRO(speedbomb, "STR_Item_speedbomb", "speedbomb", 5, 50000, 25000, true, -1, "images\icons\speed.paa")
	VITEMMACRO(underwatercharge, "STR_Item_underwatercharge", "underwatercharge", 5, 5000, 2500, true, -1, "images\icons\blastingcharge.paa")
	VITEMMACRO(scalpel, "STR_Item_scalpel", "scalpel", 1, 500, 300, true, -1, "images\icons\scalpel.paa")
	VITEMMACRO(gpstracker, "STR_Item_gpstracker", "gpstracker", 1, 1000, 500, true, -1, "images\icons\gps.paa")
	VITEMMACRO(cigarette, "STR_Item_cigarette", "cigarette", 1, 5, 5, false, -1, "images\icons\cigarette.paa")
	VITEMMACRO(cle, "STR_Item_cle", "cle", 1, 50, 30, false, -1, "images\icons\cle.paa")
	VITEMMACRO(cb, "STR_Item_cb", "cb", 1, 1000, 500, false, -1, "images\icons\cb.paa")
	VITEMMACRO(excavator, "STR_Item_excavator", "excavator", 20, 1000, 500, false, -1, "images\icons\excavator.paa")
	VITEMMACRO(multipass, "STR_Item_multipass", "multipass", 1, 500, 200, false, -1, "images\icons\lockpick.paa")
	VITEMMACRO(couteau, "STR_Item_couteau", "couteau", 1, 2000, 1000, false, -1, "images\icons\couteau.paa")
	VITEMMACRO(sacpatate, "STR_Item_sacpatate", "sacpatate", 1, 1000, 500, false, -1, "images\icons\sacpatate.paa")
	VITEMMACRO(gagkit, "STR_Item_GagKit", "gagkit", 10, 7500, -1, false, -1, "images\icons\baillon.paa")
	VITEMMACRO(sechouse, "STR_Item_sechouse", "sechouse", 4, 100000, 80000, false, -1, "images\icons\sechouse.paa")
	VITEMMACRO(brancard, "STR_Item_brancard", "brancard", 4, 500, 300, false, -1, "images\icons\sechouse.paa")	
//MINABLE
	VITEMMACRO(oilu, "STR_Item_OilU", "oilu", 6, -1, -1, false, -1, "images\icons\oil_unprocessed.paa")
	VITEMMACRO(oilp, "STR_Item_OilP", "oilp", 5, -1, 800, false, -1, "images\icons\oil_processed.paa")
	VITEMMACRO(copperore, "STR_Item_CopperOre", "copperore", 4, -1, -1, false, -1, "images\icons\copper_ore.paa")
	VITEMMACRO(copperr, "STR_Item_CopperIngot", "copperr", 3, -1, 150, false, -1, "images\icons\copper.paa")
	VITEMMACRO(ironore, "STR_Item_IronOre", "ironore", 5, -1, -1, false, -1, "images\icons\iron_ore.paa")
	VITEMMACRO(ironr, "STR_Item_IronIngot", "ironr", 3, -1, 320, false, -1, "images\icons\iron.paa")
	VITEMMACRO(salt, "STR_Item_Salt", "salt", 3, -1, -1, false, -1, "images\icons\salt_unprocessed.paa")
	VITEMMACRO(saltr, "STR_Item_SaltR", "saltr", 1, -1, 250, false, -1, "images\icons\saltr.paa")
	VITEMMACRO(sand, "STR_Item_Sand", "sand", 3, -1, -1, false, -1, "images\icons\sand.paa")
	VITEMMACRO(glass, "STR_Item_Glass", "glass", 1, -1, 200, false, -1, "images\icons\glass.paa")
	VITEMMACRO(diamond, "STR_Item_DiamondU", "diamond", 4, -1, 200, false, -1, "images\icons\diamond.paa")
	VITEMMACRO(diamondr, "STR_Item_DiamondC", "diamondr", 2, -1, 600, false, -1, "images\icons\diamondr.paa")
	VITEMMACRO(rock, "STR_Item_Rock", "rock", 6, -1, -1, false, -1, "images\icons\rock.paa")
	VITEMMACRO(cement, "STR_Item_CementBag", "cement", 5, -1, 195, false, -1, "images\icons\cement.paa")
	VITEMMACRO(orr, "STR_Item_orr", "orr", 6, -1, -1, false, -1, "images\icons\gold.paa")
	VITEMMACRO(lingotor, "STR_Item_lingotor", "lingotor", 5, -1, 1000, false, -1, "images\icons\goldbar.paa")
	VITEMMACRO(osmium, "STR_Item_osmium", "osmium", 3, -1, -1, false, -1, "images\icons\heroin_unprocessed.paa")
	VITEMMACRO(palladium, "STR_Item_palladium", "palladium", 3, -1, -1, false, -1, "images\icons\platine.paa")
	VITEMMACRO(platinep, "STR_Item_platinep", "platinep", 4, -1, 400, false, -1, "images\icons\iron.paa")
	VITEMMACRO(bijoux, "STR_Item_bijoux", "bijoux", 5, -1, 1600, false, -1, "images\icons\bijoux.paa")
	VITEMMACRO(eaudist, "STR_Item_eaud", "eaudist", 1, -1, 100, false, -1, "images\icons\eaudist.paa")
// LOOTABLE
	VITEMMACRO(skull, "STR_Item_skull", "skull", 3, -1, -1, false, -1, "images\icons\skull.paa")
	VITEMMACRO(skullp, "STR_Item_skullp", "skullp", 2, -1, 150, false, -1, "images\icons\skull.paa")
	VITEMMACRO(doubloon, "STR_Item_doubloon", "doubloon", 2, -1, 150, false, -1, "images\icons\doublon.paa")
	VITEMMACRO(silverpiece, "STR_Item_silverpiece", "silverpiece", 2, -1, 100, false, -1, "images\icons\silver.paa")
	VITEMMACRO(ruby, "STR_Item_ruby", "ruby", 2, -1, 500, false, -1, "images\icons\ruby.paa")
	VITEMMACRO(pearl, "STR_Item_pearl", "pearl", 2, -1, 400, false, -1, "images\icons\pearl.paa")
	VITEMMACRO(diamondf, "STR_Item_diamondf", "diamondf", 3, -1, 4000, false, -1, "images\icons\diamondr.paa")
	VITEMMACRO(tobacco, "STR_Item_tobacco", "tobacco", 1, -1, -1, false, -1, "images\icons\tabac.paa")
	VITEMMACRO(uranium1, "STR_Item_uranium1", "uranium1", 2, -1, -1, false, -1, "images\icons\uranium.paa")
	VITEMMACRO(uranium2, "STR_Item_uranium2", "uranium2", 2, -1, -1, false, -1, "images\icons\uranium.paa")
	VITEMMACRO(uranium3, "STR_Item_uranium3", "uranium3", 4, -1, -1, false, -1, "images\icons\uranium.paa")
	VITEMMACRO(uranium4, "STR_Item_uranium4", "uranium4", 4, -1, -1, false, -1, "images\icons\uranium.paa")
	VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldbar", 12, -1, 9000, false, -1, "images\icons\goldbar.paa")
	VITEMMACRO(goldbarp, "STR_Item_goldbarp", "goldbarp", 12, -1, 7000, false, -1, "images\icons\goldbar.paa")
//DROGUES
	VITEMMACRO(heroinu, "STR_Item_heroinu", "heroinu", 4, -1, -1, true, -1, "images\icons\heroin_unprocessed.paa")
	VITEMMACRO(heroinp, "STR_Item_heroinp", "heroinp", 3, 1400, 800, true, -1, "images\icons\heroin_processed.paa")
	VITEMMACRO(cannabis, "STR_Item_cannabis", "cannabis", 3, -1, -1, true, -1, "images\icons\cannabis.paa")
	VITEMMACRO(marijuana, "STR_Item_marijuana", "marijuana", 2, 1000, 600, true, -1, "images\icons\marijuana.paa")
	VITEMMACRO(coke, "STR_Item_coke", "coke", 5, -1, -1, true, -1, "images\icons\cocain_unprocessed.paa")
	VITEMMACRO(cokep, "STR_Item_cokep", "cokep", 4, 1500, 900, true, -1, "images\icons\cocain_processed.paa")
	VITEMMACRO(meth97, "STR_Item_meth97", "meth97", 4, 9000, 6000, true, -1, "images\icons\meth.paa")
	VITEMMACRO(metylamine, "STR_Item_metylamine", "metylamine", 2, -1, -1, true, -1, "images\icons\cocain_unprocessed.paa")
	VITEMMACRO(ephedrine, "STR_Item_ephedrine", "ephedrine", 2, -1, -1, true, -1, "images\icons\salt_unprocessed.paa")
	VITEMMACRO(iode, "STR_Item_iode", "iode", 2, -1, -1, false, -1, "images\icons\salt_unprocessed.paa")
	VITEMMACRO(phosphore, "STR_Item_phosphore", "phosphore", 2, -1, -1, false, -1, "images\icons\gun.paa")
	VITEMMACRO(uranium, "STR_Item_uranium", "uranium", 4, -1, 5000, true, -1, "images\icons\uranium.paa")
	VITEMMACRO(puranium, "STR_Item_puranium", "puranium", 1, 100, -1, true, -1, "images\icons\uranium.paa")
	VITEMMACRO(kidney, "STR_Item_kidney", "kidney", 15, 10000, 7500, true, -1, "images\icons\kidney.paa")
	VITEMMACRO(opium, "STR_Item_opium", "opium", 4, 6000, 3000, true, -1, "images\icons\opium.paa")
	VITEMMACRO(fleur_opium, "STR_Item_fopium", "fleur_opium", 6, -1, 500, true, -1, "images\icons\pavot.paa")
	VITEMMACRO(opium_Ndiluer, "STR_Item_ndiluer", "opium_Ndiluer", 4, -1, 500, true, -1, "images\icons\gun.paa")
// ALCOOL
	VITEMMACRO(rye, "STR_Item_rye", "rye", 2, -1, -1, false, -1, "images\icons\salt_unprocessed.paa")
	VITEMMACRO(hops, "STR_Item_hops", "hops", 2, -1, -1, false, -1, "images\icons\heroin_unprocessed.paa")
	VITEMMACRO(yeast, "STR_Item_yeast", "yeast", 2, -1, -1, false, -1, "images\icons\oil_unprocessed.paa")
	VITEMMACRO(cornmeal, "STR_Item_cornmeal", "cornmeal", 1, 50, -1, false, -1, "images\icons\mais.paa")
	VITEMMACRO(moonshine, "STR_Item_moonshine", "moonshine", 4, -1, 500, false, -1, "images\icons\moonshine.paa")
	VITEMMACRO(bottles, "STR_Item_bottles", "bottles", 1, 5, -1, false, -1, "images\icons\bouteille.paa")
	VITEMMACRO(bottledshine, "STR_Item_bottledshine", "bottledshine", 5, 1000, 900, false, -1, "images\icons\moonshine.paa")
	VITEMMACRO(bottledbeer, "STR_Item_bottledbeer", "bottledbeer", 5, 600, 500, false, -1, "images\icons\beer.paa")
	VITEMMACRO(bottledwhiskey, "STR_Item_bottledwhiskey", "bottledwhiskey", 5, 700, 600, false, -1, "images\icons\whisky.paa")
	VITEMMACRO(beerp, "STR_Item_beerp", "beerp", 4, -1, -1, false, -1, "images\icons\beer.paa")
	VITEMMACRO(whiskey, "STR_Item_whiskey", "whiskey", 4, -1, -1, false, -1, "images\icons\whisky.paa")
	VITEMMACRO(mash, "STR_Item_mash", "mash", 1, -1, -1, false, -1, "images\icons\salt_unprocessed.paa")
	VITEMMACRO(wine, "STR_Item_wine", "wine", 2, 300, 200, false, -1, "images\icons\vin.paa")
	VITEMMACRO(grapes, "STR_Item_grapes", "grapes", 2, -1, 7, false, -1, "images\icons\grapes.paa")
// PLACABLES
	VITEMMACRO(mur, "STR_Item_mur", "mur", 10, 500, 200, false, -1, "images\icons\mur.paa")
	VITEMMACRO(sac, "STR_Item_sac", "sac", 5, 500, 200, false, -1, "images\icons\sac.paa")
	VITEMMACRO(cone, "STR_Item_cone", "cone", 1, 100, 50, false, -1, "images\icons\cone.paa")
	VITEMMACRO(barre, "STR_Item_barre", "barre", 5, 200, 100, false, -1, "images\icons\barre.paa")
	VITEMMACRO(lightr, "STR_Item_lightr", "lightr", 1, 20, 10, false, -1, "images\icons\lightr.paa")
	VITEMMACRO(lightg, "STR_Item_lightg", "lightg", 1, 20, 10, false, -1, "images\icons\lightg.paa")
	VITEMMACRO(lighty, "STR_Item_lighty", "lighty", 1, 20, 10, false, -1, "images\icons\lighty.paa")
	VITEMMACRO(flecheg, "STR_Item_flecheg", "flecheg", 4, 50, 20, false, -1, "images\icons\flecheg.paa")
	VITEMMACRO(fleched, "STR_Item_fleched", "fleched", 4, 50, 20, false, -1, "images\icons\fleched.paa")
	VITEMMACRO(tente1, "STR_Item_tente1", "tente1", 10, 8000, 4000, false, -1, "images\icons\tente1.paa")
	VITEMMACRO(tente2, "STR_Item_tente2", "tente2", 15, 1500, 1000, false, -1, "images\icons\tente2.paa")
	VITEMMACRO(feucamp, "STR_Item_feucamp", "feucamp", 5, 1000, 500, false, -1, "images\icons\feu.paa")
	VITEMMACRO(spikestrip, "STR_Item_SpikeStrip", "spikestrip", 15, 500, 400, false, -1, "images\icons\spikestrip.paa")
	VITEMMACRO(projecteur, "STR_Item_projecteur", "projecteur", 4, 400, 200, false, -1, "images\icons\lighty.paa")
	VITEMMACRO(projecteur2, "STR_Item_projecteur2", "projecteur2", 4, 600, 300, false, -1, "images\icons\lighty.paa")
// MEDECINE
	VITEMMACRO(defib, "STR_Item_defib", "defib", 20, 500, 200, false, -1, "images\icons\defib.paa")
	VITEMMACRO(bloodbag, "STR_Item_bloodbag", "bloodbag", 3, 200, 100, false, -1, "images\icons\bloodbag.paa")
	VITEMMACRO(painkillers, "STR_Item_painkillers", "painkillers", 1, 100, 50, false, -1, "images\icons\painkillers.paa")
	VITEMMACRO(marijuanam, "STR_Item_marijuanam", "marijuanam", 3, 200, 150, false, -1, "images\icons\medm.paa")
	VITEMMACRO(organkit, "STR_Item_organkit", "organkit", 5, 1000, 500, false, -1, "images\icons\organkit.paa")
	VITEMMACRO(camisole, "STR_Item_camisole", "camisole", 1, 500, 300, false, -1, "images\icons\camisole.paa")
// CRAFT
	VITEMMACRO(poudre, "STR_Item_poudre", "poudre", 1, 2, 1, false, -1, "images\icons\gun.paa")
	VITEMMACRO(kit, "STR_Item_kit", "kit", 1, 200, 100, false, -1, "images\icons\kit.paa")
	VITEMMACRO(tissu, "STR_Item_tissu", "tissu", 1, 20, 10, false, -1, "images\icons\tissu.paa")
	VITEMMACRO(electro, "STR_Item_electro", "electro", 1, 200, 100, false, -1, "images\icons\electro.paa")
	VITEMMACRO(aiguille, "STR_Item_aiguille", "aiguille", 1, 2, 1, false, -1, "images\icons\aiguille.paa")
//NOURRITURE
	VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 100, 50, false, 10, "images\icons\redgull.paa")
	VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 2, 1, false, 5, "images\icons\coffee.paa")
	VITEMMACRO(cafe, "STR_Item_cafe", "cafe", 1, 2, 1, false, 5, "images\icons\coffee.paa")
	VITEMMACRO(water, "STR_Item_Eau", "water", 1, 1, 1, false, 5, "images\icons\water.paa")
	VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, 6, 5, false, 10, "images\icons\apple.paa")
	VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, 6, 5, false, 10, "images\icons\peach.paa")
	VITEMMACRO(tbacon, "STR_Item_tbacon", "tbacon", 1, 5, 1, false, 40, "images\icons\meat.paa")
	VITEMMACRO(donuts, "STR_Item_Donuts", "donuts", 1, 3, 1, false, 30, "images\icons\donut.paa")
	VITEMMACRO(smoothies, "STR_Item_Smoothies", "smoothies", 1, 5, 2, false, 10, "images\icons\smoothie.paa")
	VITEMMACRO(redburger, "STR_Item_redburger", "redburger", 1, 5, 2, false, 60, "images\icons\hamburger.paa")
	VITEMMACRO(sprite, "STR_Item_sprite", "sprite", 1, 2, 1, false, 5, "images\icons\sprite.paa")
	VITEMMACRO(pepsi, "STR_Item_pepsi", "pepsi", 1, 2, 1, false, 5, "images\icons\pepsi.paa")
	VITEMMACRO(frite, "STR_Item_frite", "frite", 1, 2, 1, false, 20, "images\icons\food.paa")
// CHASSE
	VITEMMACRO(rabbitraw, "STR_Item_Rabbit", "rabbitraw", 2, -1, 65, false, -1, "images\icons\food.paa")
	VITEMMACRO(rabbitrawp, "STR_Item_RabbitGrilled", "rabbitrawp", 1, 150, 115, false, 50, "images\icons\viande.paa")
	VITEMMACRO(salema, "STR_Item_Salema", "salema", 2, -1, 45, false, -1, "images\icons\fish.paa")
	VITEMMACRO(salemap, "STR_Item_SalemaGrilled", "salemap", 1, 75, 55, false, 50, "images\icons\viande.paa")
	VITEMMACRO(ornate, "STR_Item_OrnateMeat", "ornate", 2, -1, 40, false, -1, "images\icons\fish.paa")
	VITEMMACRO(ornatep, "STR_Item_OrnateGrilled", "ornatep", 1, 75, 50, false, 50, "images\icons\viande.paa")
	VITEMMACRO(mackerel, "STR_Item_MackerelMeat", "mackerel", 4, -1, 175, false, -1, "images\icons\fish.paa")
	VITEMMACRO(mackerelp, "STR_Item_MackerelGrilled", "mackerelp", 2, 250, 200, false, 50, "images\icons\viande.paa")
	VITEMMACRO(tuna, "STR_Item_TunaMeat", "tuna", 6, -1, 700, false, -1, "images\icons\fish.paa")
	VITEMMACRO(tunap, "STR_Item_TunaGrilled", "tunap", 3, 1250, 1000, false, 100, "images\icons\viande.paa")
	VITEMMACRO(mullet, "STR_Item_MulletMeat", "mullet", 4, -1, 250, false, -1, "images\icons\fish.paa")
	VITEMMACRO(mulletp, "STR_Item_MulletFried", "mulletp", 2, 600, 400, false, 80, "images\icons\viande.paa")
	VITEMMACRO(catshark, "STR_Item_CatSharkMeat", "catshark", 6, -1, 300, false, -1, "images\icons\fish.paa")
	VITEMMACRO(catsharkp, "STR_Item_CatSharkFried", "catsharkp", 3, 750, 500, false, 100, "images\icons\viande.paa")
	VITEMMACRO(turtle, "STR_Item_turtle", "turtle", 6, -1, 1000, true, -1, "images\icons\turtle.paa")
	VITEMMACRO(turtlesoup, "STR_Item_TurtleSoup", "turtlesoup", 2, 500, 400, false, 100, "images\icons\turtle_soup.paa")
	VITEMMACRO(henraw, "STR_Item_HenRaw", "henraw", 1, -1, 35, false, -1, "images\icons\food.paa")
	VITEMMACRO(henrawp, "STR_Item_HenFried", "henrawp", 1, 115, 85, false, 100, "images\icons\viande.paa")
	VITEMMACRO(roosterraw, "STR_Item_RoosterRaw", "roosterraw", 1, -1, 35, false, -1, "images\icons\food.paa")
	VITEMMACRO(roosterrawp, "STR_Item_RoosterGrilled", "roosterrawp", 1, 115, 85, false, 100, "images\icons\viande.paa")
	VITEMMACRO(sheepraw, "STR_Item_SheepRaw", "sheepraw", 2, -1, 50, false, -1, "images\icons\food.paa")
	VITEMMACRO(sheeprawp, "STR_Item_SheepGrilled", "sheeprawp", 2, 155, 115, false, 100, "images\icons\viande.paa")
	VITEMMACRO(goatraw, "STR_Item_GoatRaw", "goatraw", 2, -1, 75, false, -1, "images\icons\food.paa")
	VITEMMACRO(goatrawp, "STR_Item_GoatGrilled", "goatrawp", 2, 175, 135, false, 100, "images\icons\viande.paa")
};
class Licenses {
	LICENSEMACRO(driver,"STR_License_Driver","driver",50,false,"civ")
	LICENSEMACRO(boat,"STR_License_Boat","boat",100,false,"civ")
	LICENSEMACRO(pilot,"STR_License_Pilot","pilot",2500,false,"civ")
	LICENSEMACRO(gun,"STR_License_Firearm","gun",2000,false,"civ")
	LICENSEMACRO(dive,"STR_License_Diving","dive",200,false,"civ")
	LICENSEMACRO(oil,"STR_License_Oil","oil",3000,false,"civ")
	LICENSEMACRO(heroin,"STR_License_Heroin","heroin",12000,true,"civ")
	LICENSEMACRO(marijuana,"STR_License_Marijuana","marijuana",5000,true,"civ")
	LICENSEMACRO(medmarijuana,"STR_License_Medmarijuana","medmarijuana",500,false,"civ")
	LICENSEMACRO(rebel,"STR_License_Rebel","rebel",500000,true,"civ")
	LICENSEMACRO(truck,"STR_License_Truck","truck",2000,false,"civ")
	LICENSEMACRO(diamond,"STR_License_Diamond","diamond",10000,false,"civ")
	LICENSEMACRO(salt,"STR_License_Salt","salt",1500,false,"civ")
	LICENSEMACRO(cocaine,"STR_License_Cocaine","cocaine",15000,false,"civ")
	LICENSEMACRO(sand,"STR_License_Sand","sand",1500,false,"civ")
	LICENSEMACRO(iron,"STR_License_Iron","iron",1000,false,"civ")
	LICENSEMACRO(copper,"STR_License_Copper","copper",800,false,"civ")
	LICENSEMACRO(cement,"STR_License_Cement","cement",800,false,"civ")
	LICENSEMACRO(home,"STR_License_Home","home",7500,false,"civ")
	LICENSEMACRO(uranium,"STR_License_uranium","uranium",200000,false,"civ")
	LICENSEMACRO(skull,"STR_License_skull","skull",4000,false,"civ")
	LICENSEMACRO(meth97,"STR_License_meth97","meth97",50000,false,"civ")
	LICENSEMACRO(glass,"STR_License_glass","glass",1000,false,"civ")
	LICENSEMACRO(grapes,"STR_License_grapes","grapes",3000,false,"civ")
	LICENSEMACRO(stiller,"STR_License_stiller","stiller",5000,false,"civ")
	LICENSEMACRO(liquor,"STR_License_liquor","liquor",10000,false,"civ")
	LICENSEMACRO(bottler,"STR_License_bottler","bottler",10000,false,"civ")
	LICENSEMACRO(lingot,"STR_License_lingot","lingot",75000,false,"civ")
	LICENSEMACRO(mineralogiste,"STR_License_mineralogiste","mineralogiste",2500,false,"civ")
	LICENSEMACRO(chasse,"STR_License_chasse","chasse",1000,false,"civ")
	LICENSEMACRO(mair,"STR_License_Pilot","mair",1500,false,"med")
	LICENSEMACRO(cdriver,"STR_License_Driver","cdriver",500,false,"cop")
	LICENSEMACRO(cair,"STR_License_Pilot","cair",1500,false,"cop")
	LICENSEMACRO(cg,"STR_License_CG","cg",1000,false,"cop")
	LICENSEMACRO(swat,"STR_License_swat","swat",10000,false,"cop")
	LICENSEMACRO(sniper,"STR_License_sniper","sniper",10000,false,"cop")
	LICENSEMACRO(spy,"STR_License_spy","spy",10000,false,"cop")
	LICENSEMACRO(opium,"STR_License_opium","opium",20000,false,"civ")
};
class ANL_VShops {
	class market {
		name = "STR_Shops_Market";
		items[] = { "tbacon","water","redgull","apple","peach","cornmeal","cigarette","bottles","pickaxe","battery","cb","fuelF","lockpick","boltcutter","scalpel","storagesmall","storagebig","excavator","underwatercharge","kit","poudre","tissu","electro","painkillers","couteau","feucamp","tente1","aiguille","sechouse"};
	};
	class marketreb {
		name = "STR_Shops_Rebel";
		items[] = { "redburger","tbacon","water","sprite","pepsi","redgull","cafe","donuts","cigarette","cornmeal","bottles","battery","cb","fuelF","zipties","cle","lockpick","boltcutter","scalpel","blastingcharge","speedbomb","excavator","underwatercharge","gpstracker","kit","poudre","tissu","electro","aiguille","nitro","painkillers","couteau","feucamp","tente1","tente2","sacpatate","gagkit","sechouse","puranium"};
	};
	class markettaff {
		name = "STR_Shops_taff";
		items[] = { "redburger","tbacon","water","sprite","pepsi","redgull","cafe","donuts","cigarette","cornmeal","battery","cb","fuelF","zipties","cle","lockpick","gpstracker","nitro","painkillers","couteau","feucamp","tente1","tente2"};
	};
	class marketp {
		name = "STR_Shops_Market";
		items[] = { "redburger","water","pepsi","cafe","donuts","cigarette"};
	};
	class wongs {
		name = "STR_Shops_Wongs";
		items[] = { "turtlesoup","turtle" };
	};
	class speakeasy {
		name = "STR_Shops_speakeasy";
		items[] = { "bottledwhiskey","bottledshine","bottledbeer","wine" };
	};
	class hospital {
		name = "STR_Shops_hospital";
		items[] = { "defib","organkit","painkillers","bloodbag","redburger","tbacon","water","sprite","pepsi","redgull","cafe","donuts","camisole","cle","marijuanam","battery","cb","multipass","cone","barre","lightr","lightg","lighty","flecheg","fleched","projecteur","projecteur2"};
	};
	class heroin {
		name = "STR_Shops_DrugDealer";
		items[] = { "cokep","heroinp","marijuana","meth97","opium"};
	};
	class oil {
		name = "STR_Shops_Oil";
		items[] = { "oilp", "pickaxe", "fuelF" };
	};
	class fishmarket {
		name = "STR_Shops_FishMarket";
		items[] = { "salema", "salemap", "ornate", "ornatep", "mackerel", "mackerelp", "tuna", "tunap", "mullet", "mulletp", "catshark", "catsharkp" };
	};
	class glass {
		name = "STR_Shops_Glass";
		items[] = { "glass" };
	};
	class iron  {
		name = "STR_Shops_Minerals";
		items[] = { "ironr", "copperr" };
	};
	class diamond {
		name = "STR_Shops_Diamond";
		items[] = { "diamond","diamondr","diamondf","ruby","pearl","doubloon","silverpiece","platinep","pickaxe" };
	};
	class salt {
		name = "STR_Shops_Salt";
		items[] = { "saltr" };
	};
	class cop {
		name = "STR_Shops_Cop";
		items[] = { "redburger","tbacon","redgull","sprite","pepsi","water","donuts","coffee","apple","peach","cb","zipties","cle","cigarette","fuelF","defusekit","battery","multipass","spikeStrip","mur","sac","cone","barre","lightr","lightg","lighty","flecheg","fleched","projecteur","projecteur2","nitro","gpstracker","painkillers","gagkit","sacpatate" };
	};
	class skullp {
		name = "STR_Shops_skullp";
		items[] = { "skull","skullp" };
	};
	class redburger {
		name = "STR_Shops_redburger";
		items[] = { "redburger","frite","smoothies","donuts","sprite","pepsi","water","cafe" };
	};
	class bar {
		name = "STR_Shops_bar";
		items[] = { "bottledbeer","bottledwhiskey","wine","cigarette" };
	};
	class cement {
		name = "STR_Shops_Cement";
		items[] = { "cement" };
	};
	class organ {
		name = "STR_Shops_organ";
		items[] = { "kidney","scalpel" };
	};
	class uranium {
		name = "STR_Shops_uranium";
		items[] = { "uranium","puranium" };
	};
	class chasse {
		name = "STR_Shops_chasse";
		items[] = { "henraw","roosterraw","goatraw","sheepraw","rabbitraw","couteau","rabbitrawp","henrawp","roosterrawp","sheeprawp","goatrawp","feucamp","tente1" };
	};
	class or {
		name = "STR_Shops_Gold";
		items[] = { "goldbar","lingotor","goldbarp"};
	};
	class bijoux {
		name = "STR_Shops_bijoux";
		items[] = { "bijoux"};
	};
};