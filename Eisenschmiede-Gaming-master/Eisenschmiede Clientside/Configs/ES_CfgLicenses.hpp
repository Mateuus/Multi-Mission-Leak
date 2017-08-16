#define LICENSEMACRO(NAME,DISPLAYNAME,VARNAME,PRICE,ILLEGAL,SIDE) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
	};

/*
	Licenses
	
	Params:
	CLASS ENTRY,DisplayName,VariableName,price,illegal,side indicator
*/
class Licenses {

	// Polizei
	LICENSEMACRO(cAir,"STR_License_Pilot","cAir",15000,false,"cop")
	LICENSEMACRO(cg,"STR_License_CG","cg",8000,false,"cop")
	LICENSEMACRO(cSO,"STR_License_CopSkinOrden","cSO",8000,false,"cop")
	LICENSEMACRO(ncis,"STR_License_NCIS","ncis",8000,false,"cop")

	// Feuerwehr
	LICENSEMACRO(mAir,"STR_License_Pilot","mAir",15000,false,"med")
	LICENSEMACRO(seuche,"STR_License_Seuche","seuche",15000,false,"med")

	// Zivilisten
	LICENSEMACRO(driver,"STR_License_Driver","driver",500,false,"civ")
	LICENSEMACRO(boat,"STR_License_Boat","boat",1000,false,"civ")
	LICENSEMACRO(pilot,"STR_License_Pilot","pilot",25000,false,"civ")
	LICENSEMACRO(gun,"STR_License_Firearm","gun",10000,false,"civ")
	LICENSEMACRO(dive,"STR_License_Diving","dive",2000,false,"civ")
	LICENSEMACRO(oil,"STR_License_Oil","oil",10000,false,"civ")
	LICENSEMACRO(heroin,"STR_License_Heroin","heroin",25000,false,"civ")
	LICENSEMACRO(marijuana,"STR_License_Marijuana","marijuana",19500,false,"civ")
	LICENSEMACRO(medmarijuana,"STR_License_Medmarijuana","medmarijuana",15000,false,"civ")
	LICENSEMACRO(rebel,"STR_License_Rebel","rebel",750000,false,"civ")
	LICENSEMACRO(trucking,"STR_License_Truck","trucking",20000,false,"civ")
	LICENSEMACRO(diamond,"STR_License_Diamond","diamond",35000,false,"civ")
	LICENSEMACRO(salt,"STR_License_Salt","salt",12000,false,"civ")
	LICENSEMACRO(cocaine,"STR_License_Cocaine","cocaine",30000,false,"civ")
	LICENSEMACRO(sand,"STR_License_Sand","sand",14500,false,"civ")
	LICENSEMACRO(iron,"STR_License_Iron","iron",9500,false,"civ")
	LICENSEMACRO(copper,"STR_License_Copper","copper",8000,false,"civ")
	LICENSEMACRO(cement,"STR_License_Cement","cement",6500,false,"civ")
	LICENSEMACRO(home,"STR_License_Home","home",7500000,false,"civ")
	LICENSEMACRO(pilze,"STR_License_pilze","pilze",85000,false,"civ")
	LICENSEMACRO(meth,"STR_License_meth","meth",75000,false,"civ")
	LICENSEMACRO(speed,"STR_License_speed","speed",75000,false,"civ")	
	LICENSEMACRO(illmed,"STR_License_illmed","illmed",175000,false,"civ")
	LICENSEMACRO(schwarz,"STR_License_schwarz","schwarz",75000,false,"civ")
	LICENSEMACRO(kohle,"STR_License_kohle","kohle",75000,false,"civ")	
	LICENSEMACRO(safter,"STR_License_safter","safter",5000,false,"civ")	
	LICENSEMACRO(peachs,"STR_License_peachs","peachs",5000,false,"civ")		
	LICENSEMACRO(wein,"STR_License_wein","wein",75000,false,"civ")	
	LICENSEMACRO(holz,"STR_License_holz","holz",125000,false,"civ")
	LICENSEMACRO(eisen,"STR_License_eisen","eisen",75000,false,"civ")	
	LICENSEMACRO(uran,"STR_License_uran","uran",1750000,false,"civ")
	LICENSEMACRO(stiller,"STR_License_Stiller","stiller",500000,false,"civ")
	LICENSEMACRO(liquor,"STR_License_Liquor","liquor",100000,false,"civ")
	LICENSEMACRO(beer,"STR_License_Beer","beer",100000,false,"civ")
	LICENSEMACRO(bottler,"STR_License_Bottler","bottler",100000,false,"civ")
	LICENSEMACRO(mash,"STR_License_Mash","mash",100000,false,"civ")	
	
	LICENSEMACRO(zucker,"STR_License_suger","zucker",100000,false,"civ")
	LICENSEMACRO(kakao,"STR_License_kakao","kakao",100000,false,"civ")
	LICENSEMACRO(oliven,"STR_License_oliven","oliven",100000,false,"civ")	
	
	//Mafia Lizenzen
	LICENSEMACRO(markt,"STR_License_markt","markt",35000000,false,"civ")
	//LICENSEMACRO(anwerter,"STR_License_anwerter","anwerter",2500000,false,"civ")
	//LICENSEMACRO(uboss,"STR_License_uboss","uboss",3500000,false,"civ")
	
	LICENSEMACRO(soeldner,"STR_License_soeldner","soeldner",10000000,false,"civ")
	LICENSEMACRO(millitear,"STR_License_millitear","millitear",20000000,false,"civ")
	LICENSEMACRO(unit,"STR_License_unit","unit",15000000,false,"civ")
	LICENSEMACRO(unitskin,"STR_License_unitskin","unitskin",75000,false,"civ")
	LICENSEMACRO(faa,"STR_License_faa","faa",15000000,false,"civ")
	LICENSEMACRO(faaskin,"STR_License_faaskin","faaskin",15000000,false,"civ")	
	LICENSEMACRO(ksk,"STR_License_ksk","ksk",5000000,false,"civ")
	LICENSEMACRO(kskskin,"STR_License_kskskin","kskskin",10000000,false,"civ")
	LICENSEMACRO(ai,"STR_License_ai","ai",2500000,false,"civ")
	LICENSEMACRO(aiskin,"STR_License_aiskin","aiskin",10000000,false,"civ")
	LICENSEMACRO(ffs,"STR_License_ffs","ffs",500000,false,"civ")
	

	LICENSEMACRO(sqskin,"STR_License_sqskin","sqskin",7000000,false,"civ")
	
	LICENSEMACRO(army,"STR_License_army","army",5000000,false,"civ")
	LICENSEMACRO(ir,"STR_License_ir","ir",1000000,false,"civ")
	LICENSEMACRO(twooneskin,"STR_License_twooneskin","twooneskin",1000000,false,"civ")
	LICENSEMACRO(tgs,"STR_License_tgs","tgs",1000000,false,"civ")
	LICENSEMACRO(sk,"STR_License_sk","sk",750000,false,"civ")
	LICENSEMACRO(skskins,"STR_License_skskins","skskins",5000000,false,"civ")
	LICENSEMACRO(fi,"STR_License_fi","fi",7500000,false,"civ")
	LICENSEMACRO(ac,"STR_License_ac","ac",1500000,false,"civ")
	LICENSEMACRO(acskin,"STR_License_acskin","acskin",1500000,false,"civ")
	LICENSEMACRO(mecaskin,"STR_License_mecaskin","mecaskin",7000000,false,"civ")
	LICENSEMACRO(armyskin,"STR_License_armyskin","armyskin",7000000,false,"civ")
	LICENSEMACRO(nobodyskins,"STR_License_nobodyskins","nobodyskins",7000000,false,"civ")
	LICENSEMACRO(rektskins,"STR_License_rektskins","rektskins",7000000,false,"civ")
	LICENSEMACRO(sasskins,"STR_License_sasskins","sasskins",7000000,false,"civ")
	LICENSEMACRO(gisskin,"STR_License_gisskin","gisskin",7000000,false,"civ")
	LICENSEMACRO(leskin,"STR_License_leskin","leskin",7000000,false,"civ")
	LICENSEMACRO(amwskins,"STR_License_amwskins","amwskins",7000000,false,"civ")
	LICENSEMACRO(kartellskin,"STR_License_kartellskin","kartellskin",7000000,false,"civ")
	LICENSEMACRO(tdf,"STR_License_tdf","tdf",100000,false,"civ")	

	// Muss so nei weisch :)
	LICENSEMACRO(StefanIstDerKing,"STR_License_StefanIstDerKing","StefanIstDerKing",9999999999,true,"civ")
};