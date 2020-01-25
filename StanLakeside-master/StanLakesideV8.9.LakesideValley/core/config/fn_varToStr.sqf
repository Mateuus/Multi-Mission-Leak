/*
	File: fn_varToStr.sqf
	
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/

params [["_var", "", [""]]];

if(_var isEqualTo "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items 
	case "life_inv_emerald": {"Pierscionki ze szmaragdem"};
	case "life_inv_sapphire": {"Szafirowa bizuteria"};
	case "life_inv_ruby": {"Rubinowy naszyjnik"};
	case "life_inv_nos": {"Nitro do samochodu"};
	case "life_inv_weddingring": {(localize "STR_Item_WeddingRing")};
	case "life_inv_bandage": {(localize "STR_Item_Bandage")};
	case "life_inv_stitches": {(localize "STR_Item_Stitches")};
	case "life_inv_splint": {(localize "STR_Item_Splint")};
	case "life_inv_epipen": {(localize "STR_Item_Epipen")};
	case "life_inv_bec": {"Jajecznica z kawa"};
	case "life_inv_tierope": {"Mocna lina"};
	case "life_inv_airkit": {"Tlen do podania"};
	case "life_inv_mobilephone": {"Telefon"};
	case "life_inv_panicbutton": {"Panic Button"};
	case "life_inv_MDMAu": {"Czyste MDMA"};
	case "life_inv_cleankit": {"Dezodorant"};
	case "life_inv_medkit": {"Zestaw Pierwszej Pomocy"};
	case "life_inv_condom": {"Kondom"};
	case "life_inv_MDMAp": {"Czyste tabletki MDMA"};
	case "life_inv_methu": {"Metamfetamina"};
	case "life_inv_methp": {"Czysta metamfetamina"};
	case "life_inv_cokeu": {"Niespakowana kokaina"};
	case "life_inv_cokep": {"Bryly kokainy"};
	case "life_inv_oilu": {(localize "STR_Item_OilU")};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_salt": {(localize "STR_Item_Salt")};
	case "life_inv_saltr": {(localize "STR_Item_SaltR")};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_rock": {(localize "STR_Item_Rock")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_hackingtool": {(localize "STR_Item_HTool")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_wheat": {(localize "STR_Item_wheat")};
	case "life_inv_sunflower": {(localize "STR_Item_sunflower")};
	case "life_inv_corn": {(localize "STR_Item_corn")};
	case "life_inv_bean": {(localize "STR_Item_bean")};
	case "life_inv_cotton": {(localize "STR_Item_cotton")};
	case "life_inv_olive": {(localize "STR_Item_olive")};
	case "life_inv_opium": {(localize "STR_Item_opium")};
	case "life_inv_cannabis": {(localize "STR_Item_cannabis")};
	case "life_inv_pumpkin": {(localize "STR_Item_Pumpkin")};
	case "life_inv_wheatseeds": {(localize "STR_Item_wheatseeds")};
	case "life_inv_sunflowerseeds": {(localize "STR_Item_sunflowerseeds")};
	case "life_inv_cornseeds": {(localize "STR_Item_cornseeds")};
	case "life_inv_beanseeds": {(localize "STR_Item_beanseeds")};
	case "life_inv_cottonseeds": {(localize "STR_Item_cottonseeds")};
	case "life_inv_oliveseeds": {(localize "STR_Item_oliveseeds")};
	case "life_inv_opiumseeds": {(localize "STR_Item_opiumseeds")};
	case "life_inv_cannabisseeds": {(localize "STR_Item_cannabisseeds")};
	case "life_inv_pumpkinseeds": {(localize "STR_Item_Pumpkinseeds")};
	case "life_inv_rawgoatmeat": {(localize "STR_Item_rawgoatmeat")};
	case "life_inv_rawchicken": {(localize "STR_Item_rawchicken")};
	case "life_inv_rawsheepmeat": {(localize "STR_Item_rawsheepmeat")};
	case "life_inv_rawrabbit": {(localize "STR_Item_rawrabbit")};
	//Additions
	case "life_inv_zoobeer": {"Piwo"}; 
	case "life_inv_zoobeer2": {"Mocne piwo"}; 
	case "life_inv_jackdaniels": {"Whisky"};
	case "life_inv_vodka": {"Kieliszek wodki"};
	case "life_inv_jagerbomb": {"Jagerbomb"};
	case "life_inv_absinthe": {"Absynt"};
	case "life_inv_redwine": {"Czerwone wino"};
	case "life_inv_whitewine": {"Biale wino"};
	case "life_inv_whiterussian": {"Czysta rosyjska"};
	case "life_inv_sexonthebeach": {"Sex on the Beach"};
	case "life_inv_tequila": {"Tequila"};
	case "life_inv_jackdanielsandcoke": {"Whisky z cola"};
	case "life_inv_RoadConeStripB": {"Swiecace pacholki"};
	case "life_inv_RoadConeB": {"Swiecacy pacholek"};
	case "life_inv_RoadConeStrip": {"Pacholki"};
	case "life_inv_RoadCone": {"Pacholek"};
	case "life_inv_RoadBlockWood": {"Blokada drogowa (Drewniana)"};
	case "life_inv_RoadBlockConc": {"Blokada drogowa (Wzmocniona)"};
	case "life_inv_RoadBlockRebel": {"Blokada drogowa (Rebeliancka)"};
	case "life_inv_BarGate": {"Szlaban"};
	case "life_inv_cigarette": {"Papieros"};
	case "life_inv_raxsrum": {"Rum Gordona Robersona"};
	
	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_MDMA": {(localize "STR_License_MDMA")};
	case "license_civ_meth": {(localize "STR_License_Meth")};
	case "license_civ_rifle": {"Pozwolenie na bron dluga"};
	case "license_civ_donator1": {"Donator 1"};
	case "license_civ_donator2": {"Donator 2"};
	case "license_civ_donator3": {"Donator 3"};
	case "license_civ_IAD": {"Internal Affairs Departament"};
	
};
