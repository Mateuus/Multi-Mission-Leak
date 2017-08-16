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

//Virtual Items
class VirtualItems {
	//Misc
	VITEMMACRO(pickaxe, "STR_Item_Pickaxe", "pickaxe", 2, 750, 350, false, -1, "Images\Icons\ico_pickaxe.paa")
	VITEMMACRO(fuelEmpty, "STR_Item_FuelE", "fuelEmpty", 2, -1, -1, false, -1, "Images\Icons\ico_fuelempty.paa")
	VITEMMACRO(fuelFull, "STR_Item_FuelF", "fuelFull", 5, 850, 500, false, -1, "Images\Icons\ico_fuel.paa")
	VITEMMACRO(spikeStrip, "STR_Item_SpikeStrip", "spikeStrip", 15, 2500, 1200, true, -1, "Images\Icons\ico_spikestrip.paa")
	VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 1500, 75, false, -1, "Images\Icons\ico_lockpick.paa")
	VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldBar", 12, -1, 75000, false, -1, "")
	VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingCharge", 15, 100000, -1, true, -1, "Images\Icons\ico_blastingCharge.paa")
	VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltCutter", 5, 7500, 1000, true, -1, "Images\Icons\ico_boltcutters.paa")
	VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defuseKit", 2, 2500, -1, false, -1, "Images\Icons\ico_defusekit.paa")
	VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storageSmall", 5, 75000, -1, false, -1, "Images\Icons\ico_storageSmall.paa")
	VITEMMACRO(storagebig, "STR_Item_StorageBL", "storageBig", 10, 150000, -1, false, -1, "Images\Icons\ico_storageBig.paa")

	//Mined Items
	VITEMMACRO(oil_unprocessed, "STR_Item_OilU", "oilUnprocessed", 7, -1, -1, false, -1, "Images\Icons\oil_unprocessed.paa")
	VITEMMACRO(oil_processed, "STR_Item_OilP", "oilProcessed", 6, -1, 3200, false, -1, "Images\Icons\oil_processed.paa")
	VITEMMACRO(copper_unrefined, "STR_Item_CopperOre", "copperUnrefined", 4, -1, -1, false, -1, "Images\Icons\copper_ore.paa")
	VITEMMACRO(copper_refined, "STR_Item_CopperIngot", "copperRefined", 3, -1, 2500, false, -1, "Images\Icons\copper.paa")
	VITEMMACRO(iron_unrefined, "STR_Item_IronOre", "ironUnrefined", 5, -1, -1, false, -1, "Images\Icons\iron_ore.paa")
	VITEMMACRO(iron_refined, "STR_Item_IronIngot", "ironRefined", 3, -1, 3200, false, -1, "Images\Icons\iron.paa")
	VITEMMACRO(salt_unrefined, "STR_Item_Salt", "saltUnrefined", 3, -1, -1, false, -1, "Images\Icons\salt_unprocessed.paa")
	VITEMMACRO(salt_refined, "STR_Item_SaltR", "saltRefined", 1, -1, 2450, false, -1, "Images\Icons\salt.paa")
	VITEMMACRO(sand, "STR_Item_Sand", "sand", 3, -1, -1, false, -1, "")
	VITEMMACRO(glass, "STR_Item_Glass", "glass", 1, -1, 2250, false, -1, "Images\Icons\glass.paa")
	VITEMMACRO(diamond_uncut, "STR_Item_DiamondU", "diamondUncut", 4, -1, 750, false, -1, "Images\Icons\diamond_unprocessed.paa")
	VITEMMACRO(diamond_cut, "STR_Item_DiamondC", "diamondCut", 2, -1, 4150, false, -1, "Images\Icons\diamond.paa")
	VITEMMACRO(rock, "STR_Item_Rock", "rock", 6, -1, -1, false, -1, "")
	VITEMMACRO(cement, "STR_Item_CementBag", "cement", 5, -1, 2950, false, -1, "Images\Icons\cement.paa")
	
	//Absperrmaterial
	VITEMMACRO(licht, "STR_Item_licht", "licht", 3, 3500, -1, true, -1, "Images\Icons\ico_storageBig.paa")
	VITEMMACRO(pylone, "STR_Item_pylone", "pylone", 3, 3500, -1, true, -1, "Images\Icons\pylon.paa")
	VITEMMACRO(schranke, "STR_Item_schranke", "schranke", 6, 3500, -1, true, -1, "Images\Icons\schranke.paa")
	VITEMMACRO(barriere, "STR_Item_barriere", "barriere", 6, 3500, -1, true, -1, "Images\Icons\absperrung.paa")
	VITEMMACRO(tape, "STR_Item_tape", "tape", 2, 1500, -1, true, -1, "Images\Icons\absperrband.paa")
	
	//stuff
	VITEMMACRO(head, "STR_Item_head", "head", 3, 3500000, -1, true, -1, "Images\Icons\ico_storageBig.paa")
	VITEMMACRO(lappi, "STR_Item_lappi", "lappi", 3, 150000, -1, true, -1, "Images\Icons\Laptop.paa")
	VITEMMACRO(gpstracker, "STR_Item_GPSTracker", "gpstracker", 1, 80000, -1, true, -1,"Images\Icons\gps.paa")
	VITEMMACRO(blindfold, "STR_Item_blindfold", "blindfold", 3, 15000, -1, true, -1,"Images\Icons\eimer.paa")
	VITEMMACRO(schildp, "STR_Item_schildp", "schildp", 12, 425000, -1, true, -1,"Images\Icons\eimer.paa")
	VITEMMACRO(speedbomb, "STR_Item_speedbomb", "speedbomb", 12, 1500000, -1, true, -1,"Images\Icons\Speedbomb.paa")

	//Drugs
	VITEMMACRO(heroin_unprocessed, "STR_Item_HeroinU", "heroinUnprocessed", 6, -1, -1, true, -1, "Images\Icons\heroin_unprocessed.paa")
	VITEMMACRO(heroin_processed, "STR_Item_HeroinP", "heroinProcessed", 4, 5560, 5460, true, -1, "Images\Icons\heroin_processed.paa")
	VITEMMACRO(cannabis, "STR_Item_Cannabis", "cannabis", 4, -1, -1, true, -1, "Images\Icons\cannabis.paa")
	VITEMMACRO(marijuana, "STR_Item_Marijuana", "marijuana", 3, 4550, 4500, true, -1, "Images\Icons\ico_marijuana.paa")
	VITEMMACRO(cocaine_unprocessed, "STR_Item_CocaineU", "cocaineUnprocessed", 6, -1, 3000, true, -1, "Images\Icons\cocain_unprocessed.paa")
	VITEMMACRO(cocaine_processed, "STR_Item_CocaineP", "cocaineProcessed", 4, -1, 6800, true, -1, "Images\Icons\cocain_processed.paa")

	//Drink
	VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 1500, 200, false, 100, "Images\Icons\ico_redgull.paa")
	VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 10, 5, false, 100, "Images\Icons\ico_coffee.paa")
	VITEMMACRO(waterBottle, "STR_Item_WaterBottle", "waterBottle", 1, 10, 5, false, 100, "Images\Icons\ico_waterBottle.paa")

	//Food
	VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, 65, 50, false, 10, "Images\Icons\ico_apple.paa")
	VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, 68, 55, false, 10, "Images\Icons\ico_peach.paa")
	VITEMMACRO(tbacon, "STR_Item_TBacon", "tbacon", 1, 75, 25, false, 40, "Images\Icons\ico_tbacon.paa")
	VITEMMACRO(donuts, "STR_Item_Donuts", "donuts", 1, 120, 60, false, 30, "Images\Icons\ico_donuts.paa")
	VITEMMACRO(rabbit_raw, "STR_Item_Rabbitraw", "rabbitRaw", 2, 95, 65, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(rabbit, "STR_Item_Rabbit", "rabbit", 1, 150, 115, false, 20, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(salema_raw, "STR_Item_Salema", "salemaRaw", 2, -1, 45, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(salema, "STR_Item_Salema", "salema", 1, 75, 55, false, 30, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(ornate_raw, "STR_Item_OrnateMeat", "ornateRaw", 2, -1, 40, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(ornate, "STR_Item_Ornate", "ornate", 1, 175, 150, false, 25, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(mackerel_raw, "STR_Item_MackerelMeat", "mackerelRaw", 4, -1, 175, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(mackerel, "STR_Item_Mackerel", "mackerel", 2, 250, 200, false, 30, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(tuna_raw, "STR_Item_TunaMeat", "tunaRaw", 6, -1, 700, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(tuna, "STR_Item_Tuna", "tuna", 3, 1250, 1000, false, 100, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(mullet_raw, "STR_Item_MulletMeat", "mulletRaw", 4, -1, 250, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(mullet, "STR_Item_Mullet", "mullet", 2, 600, 400, false, 80, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(catshark_raw, "STR_Item_CatSharkMeat", "catsharkRaw", 6, -1, 300, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(catshark, "STR_Item_CatShark", "catshark", 3, 750, 500, false, 100, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(turtle_raw, "STR_Item_TurtleMeat", "turtleRaw", 6, 15000, 9500, true, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(turtle_soup, "STR_Item_TurtleSoup", "turtleSoup", 2, 2500, 1000, false, 100, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(hen_raw, "STR_Item_HenRaw", "henRaw", 1, -1, 3500, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(hen, "STR_Item_Hen", "hen", 1, 3150, 3140, false, 65, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(rooster_raw, "STR_Item_RoosterRaw", "roosterRaw", 1, -1, 3500, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(rooster, "STR_Item_RoosterGrilled", "rooster", 115, 85, false, 45, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(sheep_raw, "STR_Item_SheepRaw", "sheepRaw", 2, -1, 5000, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(sheep, "STR_Item_SheepGrilled", "sheep", 2, 8500, 7500, false, 100, "Images\Icons\ico_cookedMeat.paa")
	VITEMMACRO(goat_raw, "STR_Item_GoatRaw", "goatRaw", 2, -1, 7500, false, -1, "Images\Icons\ico_meat.paa")
	VITEMMACRO(goat, "STR_Item_GoatGrilled", "goat", 2, 8500, 7500, false, 100, "Images\Icons\ico_cookedMeat.paa")
	
	//neu
	VITEMMACRO(kohle_unrefined, "STR_Item_kohleU", "kohleUnrefined", 5, -1, -1, false, -1, "Images\icons\kohleu.paa")
	VITEMMACRO(kohle_refined, "STR_Item_kohleP", "kohleRefined", 3, -1, 3050, false, -1, "Images\icons\kohlep.paa")	
	VITEMMACRO(wein_unrefined, "STR_Item_weinU", "weinUnrefined", 5, -1, -1, false, -1, "Images\icons\wine.paa")
	VITEMMACRO(wein_refined, "STR_Item_weinP", "weinRefined", 3, -1, 3300, false, -1, "Images\icons\wine.paa")
	VITEMMACRO(apfels, "STR_Item_apfelsP", "apfelsRefined", 3, -1, 760, false, -1, "Images\icons\pilzep.paa")
	VITEMMACRO(peachs, "STR_Item_peachP", "peachRefined", 3, -1, 760, false, -1, "Images\icons\pilzep.paa")
	VITEMMACRO(pilze_unrefined, "STR_Item_pilzeU", "pilzeUnrefined", 5, -1, -1, true, -1, "Images\icons\pilze.paa")
	VITEMMACRO(pilze_refined, "STR_Item_pilzeP", "pilzeRefined", 3, -1, 4650, true, -1, "Images\icons\pilzep.paa")	
	VITEMMACRO(meth_unrefined, "STR_Item_methU", "methUnrefined", 5, -1, -1, true, -1, "Images\icons\methu.paa")
	VITEMMACRO(meth_refined, "STR_Item_methP", "methRefined", 3, -1, 4800, true, -1, "Images\icons\methp.paa")
	VITEMMACRO(speed_unrefined, "STR_Item_speedU", "speedUnrefined", 5, -1, -1, true, -1, "Images\icons\speedu.paa")
	VITEMMACRO(speed_refined, "STR_Item_speedP", "speedRefined", 3, -1, 5100, true, -1, "Images\icons\speedp.paa")
	VITEMMACRO(schwarz_unrefined, "STR_Item_schwarzU", "schwarzUnrefined", 5, -1, -1, true, -1, "Images\icons\schwarzpulveru.paa")
	VITEMMACRO(schwarz_refined, "STR_Item_schwarzP", "schwarzRefined", 3, -1, 5400, true, -1, "Images\icons\schwarzpulverp.paa")
	VITEMMACRO(illmed_unrefined, "STR_Item_illmed", "illmedUnrefined", 5, -1, -1, true, -1, "Images\icons\illmedu.paa")
	VITEMMACRO(illmed_refined, "STR_Item_illmedp", "illmedRefined", 3, -1, 5600, true, -1, "Images\icons\illmedp.paa")
	
	VITEMMACRO(holz_unrefined, "STR_Item_holzU", "holzUnrefined", 5, -1, -1, false, -1, "Images\icons\schwarzpulveru.paa")
	VITEMMACRO(holz_refined, "STR_Item_holzP", "holzRefined", 3, -1, 3500, false, -1, "Images\icons\schwarzpulverp.paa")
	VITEMMACRO(eisen_unrefined, "STR_Item_eisenu", "eisenUnrefined", 5, -1, -1, false, -1, "Images\icons\iron_ore.paa")
	VITEMMACRO(eisen_refined, "STR_Item_eisenp", "eisenRefined", 3, -1, 5000, false, -1, "Images\icons\iron.paa")
	
	VITEMMACRO(uran_unrefined, "STR_Item_uranu", "uranUnrefined", 5, -1, -1, true, -1, "Images\icons\uranium.paa")
	VITEMMACRO(uran_refined, "STR_Item_uranp", "uranRefined", 3, -1, 4200, true, -1, "Images\icons\uranium1.paa")
	VITEMMACRO(uran1_refined, "STR_Item_uran1", "uran1Refined", 3, -1, 6200, true, -1, "Images\icons\uranium2.paa")
	VITEMMACRO(uran2_refined, "STR_Item_uran2", "uran2Refined", 3, -1, 9200, true, -1, "Images\icons\uranium3.paa")
	
	//neu neu neu neu neu
	VITEMMACRO(kakaou, "STR_Item_kakaoU", "kakaou", 5, -1, -1, false, -1, "Images\icons\Kakaou.paa")
	VITEMMACRO(kakaop, "STR_Item_kakaoP", "kakaop", 3, -1, 3200, false, -1, "Images\icons\Kakaop.paa")
	VITEMMACRO(kokosu, "STR_Item_kokosU", "kokosu", 5, -1, -1, false, -1, "Images\icons\Kakaou.paa")
	VITEMMACRO(zuckeru, "STR_Item_zuckeru", "zuckeru", 5, -1, -1, false, -1, "Images\icons\Zuckerruebeu.paa")
	VITEMMACRO(zuckerp, "STR_Item_zuckerp", "zuckerp", 3, -1, 4000, false, -1, "Images\icons\Zuckerp.paa")
	VITEMMACRO(schoko, "STR_Item_schoko", "schoko", 3, -1, 5000, false, -1, "Images\icons\Schokolade.paa")
	VITEMMACRO(olivenu, "STR_Item_olivenu", "olivenu", 3, -1, 700, false, -1, "Images\icons\Olivenu.paa")
	VITEMMACRO(olivenp, "STR_Item_olivenp", "olivenp", 3, -1, 2800, false, -1, "Images\icons\Olivenp.paa")
	
	VITEMMACRO(bananen, "STR_Item_bananen", "bananen", 3, -1, 900, false, -1, "Images\icons\Bananen.paa")	
	VITEMMACRO(muscheln, "STR_Item_muscheln", "muscheln", 5, -1, 1400, true, -1, "Images\icons\Muschel.paa")
	VITEMMACRO(muschelfleis, "STR_Item_muschelfleis", "muschelfleis", 5, -1, 900, true, -1, "Images\icons\Muschel.paa")
	VITEMMACRO(perlen, "STR_Item_perlen", "perlen", 3, -1, 7500, true, -1, "Images\icons\Perle.paa")	
	VITEMMACRO(korallen, "STR_Item_korallen", "korallen", 4, -1, 2200, true, -1, "Images\icons\Koralle.paa")
	
	
	VITEMMACRO(bottledshine, "STR_Item_BottledShine","bottledshine",2,7500,6000,true,-1, "Images\icons\bottledshine.paa")
	VITEMMACRO(bottledwhiskey, "STR_Item_BottledWhiskey","bottledwhiskey",2,6900,5000,false,-1, "Images\icons\bottledwhiskey.paa")
	VITEMMACRO(bottledbeer, "STR_Item_BottledBeer","bottledbeer",2,5500,4900,false,-1, "Images\icons\bottledbeer.paa")
	VITEMMACRO(moonshine, "STR_Item_Moonshine","moonshine",2,6000,5000,true,-1, "Images\icons\moonshine.paa")
	VITEMMACRO(whiskey, "STR_Item_Whiskey","whiskey",2,4500,4300,false,-1, "Images\icons\whiskey.paa")
	VITEMMACRO(beerp, "STR_Item_Beerp","beerp",2,4000,3500,true,-1, "Images\icons\bottledbeer.paa")
	VITEMMACRO(mash, "STR_Item_Mash","mash",2,2000,1500,true,-1, "Images\icons\hops.paa")
	VITEMMACRO(rye, "STR_Item_Rye","rye",2,1100,1000,false,-1, "Images\icons\rye.paa")
	VITEMMACRO(hops, "STR_Item_Hops","hops",2,800,600,false,-1, "Images\icons\hops.paa")
	VITEMMACRO(yeast, "STR_Item_Yeast","yeast",2,1800,1200,false,-1, "Images\icons\yeast.paa")
	VITEMMACRO(cornmeal, "STR_Item_Cornmeal","cornmeal",2,500,200,false,-1, "Images\icons\cornmeal.paa")
	VITEMMACRO(bottles, "STR_Item_Bottles","bottles",2,100,75,false,-1, "Images\icons\bottles.paa")
	VITEMMACRO(kidney, "STR_Item_kidney","kidney",2,21000,20000,false,-1, "Images\icons\kidney.paa")
	VITEMMACRO(scalpel, "STR_Item_scalpel","scalpel",2,10000,5000,true,-1, "Images\icons\scalpel.paa")
	VITEMMACRO(zipties, "STR_Item_zipties","zipties",2,5000,3000,false,-1, "Images\icons\zipties.paa")
	VITEMMACRO(akkuschrauber, "STR_Item_Akkuschrauber", "akkuschrauber", 1, 4500, 75, true, -1, "Images\icons\akkuschrauber.paa")
	VITEMMACRO(painkiller, "STR_Item_painkiller", "painkiller", 2,2000, 135, false, 100, "Images\icons\painkiller.paa")
	VITEMMACRO(Epinephrin, "STR_Item_Epinephrin", "Epinephrin", 8, 3500, 135, false, 100, "Images\icons\epinephrin.paa")
	
	VITEMMACRO(hund1, "STR_Item_hund1","hund1",8,20000,10000,false,-1, "")
	VITEMMACRO(hund2, "STR_Item_hund2","hund2",8,20000,10000,false,-1, "")
	VITEMMACRO(hund3, "STR_Item_hund3","hund3",8,20000,10000,false,-1, "")
	VITEMMACRO(hund4, "STR_Item_hund4", "hund4", 8, 20000, 10000, false, -1, "")
	VITEMMACRO(hund5, "STR_Item_hund5", "hund5", 8,20000, 10000, false, 100, "")
	VITEMMACRO(hund6, "STR_Item_hund6", "hund6", 8, 20000, 10000, false, 100, "")
	
	VITEMMACRO(hase, "STR_Item_hase","hase",8,20000,10000,false,-1, "")
	VITEMMACRO(ziege, "STR_Item_ziege", "ziege", 8, 20000, 10000, false, -1, "")
	VITEMMACRO(huhn, "STR_Item_huhn", "huhn", 8,20000, 10000, false, 100, "")
	VITEMMACRO(shaf, "STR_Item_sheepreal", "shaf", 8, 20000, 10000, false, 100, "")
	
	VITEMMACRO(feuerl, "STR_Item_feuerl", "feuerl", 8, 20000, 10000, false, 100, "")
	VITEMMACRO(schild, "STR_Item_schild", "schild", 8, 20000, 10000, false, 100, "Images\icons\schild_1.paa")
	VITEMMACRO(schildd, "STR_Item_schildd", "schildd", 8, 20000, 10000, false, 100, "Images\icons\schild_2.paa")
	
	VITEMMACRO(grafitti, "STR_Item_grafitti", "grafitti", 8, 2000, 1000, false, 100, "Images\icons\spraydose_1.paa")
	VITEMMACRO(grafitti2, "STR_Item_grafitti2", "grafitti2", 8, 2000, 1000, false, 100, "Images\icons\spraydose_2.paa")
	VITEMMACRO(grafitti3, "STR_Item_grafitti3", "grafitti3", 8, 2000, 1000, false, 100, "Images\icons\spraydose_3.paa")
	VITEMMACRO(grafitti4, "STR_Item_grafitti4", "grafitti4", 8, 2000, 1000, false, 100, "Images\icons\spraydose_4.paa")
	VITEMMACRO(grafitti5, "STR_Item_grafitti5", "grafitti5", 8, 2000, 1000, false, 100, "Images\icons\spraydose_5.paa")
	VITEMMACRO(grafittid, "STR_Item_grafittid", "grafittid", 8, 2000, 1000, false, 100, "Images\icons\spraydose_6.paa")
	VITEMMACRO(grafittidmit, "STR_Item_grafittidmit", "grafittidmit", 8, 2000, 1000, false, 100, "Images\icons\spraydose_7.paa")
	VITEMMACRO(grafittidope, "STR_Item_grafittidope", "grafittidope", 8, 2000, 1000, false, 100, "Images\icons\spraydose_8.paa")	
	
	
	VITEMMACRO(grafittidfup, "STR_Item_grafittidfup", "grafittidfup", 8, 2000, 1000, false, 100, "Images\icons\spraydose_6.paa")
	VITEMMACRO(grafittidgo, "STR_Item_grafittidgo", "grafittidgo", 8, 2000, 1000, false, 100, "Images\icons\spraydose_7.paa")
	VITEMMACRO(grafittidbast, "STR_Item_grafittidbast", "grafittidbast", 8, 2000, 1000, false, 100, "Images\icons\spraydose_8.paa")	
	VITEMMACRO(grafittidfuckp, "STR_Item_grafittidfuckp", "grafittidfuckp", 8, 2000, 1000, false, 100, "Images\icons\spraydose_6.paa")
	VITEMMACRO(grafittidfuckp2, "STR_Item_grafittidfuckp2", "grafittidfuckp2", 8, 2000, 1000, false, 100, "Images\icons\spraydose_7.paa")
	
	//VITEMMACRO(saw, "STR_Item_saw", "saw", 8, 20000, 10000, false, 100, "")
	//VITEMMACRO(esaw, "STR_Item_esaw", "esaw", 8, 20000, 10000, false, 100, "")
	//VITEMMACRO(flakes, "STR_Item_flakes", "flakes", 8, 20000, 10000, false, 100, "")	
	//VITEMMACRO(rasenm, "STR_Item_rasenm", "rasenm", 8, 20000, 10000, false, 100, "")
	
	VITEMMACRO(blaulicht, "STR_Item_blaulicht", "blaulicht", 8, 20000, 10000, false, 100, "Images\icons\Blaulicht.paa")
	VITEMMACRO(tobacco, "STR_Item_tobacco", "tobacco", 8, 2000, 1000, false, 1000, "Images\icons\Zigarette.paa")
	VITEMMACRO(bagger, "STR_Item_bagger", "bagger", 8, 2000, 1000, false, 10000, "Images\icons\bagger.paa")
	VITEMMACRO(nitro, "STR_Item_nitro", "nitro", 8, 2000, 1000, false, 1000, "Images\icons\Zigarette.paa")
	VITEMMACRO(turbol, "STR_Item_turbol", "turbol", 8, 100000, 1000, false, 10000, "Images\icons\bagger.paa")
	VITEMMACRO(ring, "STR_Item_ring", "ring", 8, 100000, 1000, false, 10000, "Images\icons\Ring.paa")
	VITEMMACRO(card, "STR_Item_card", "card", 1, 100000, 1000, false, 10000, "Images\icons\bank_karte.paa")
	
};