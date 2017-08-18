/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {("icons\items\oilu.paa")};
	case "life_inv_oilp": {("icons\items\oilp.paa")};
	case "life_inv_heroinu": {("icons\items\heroinu.paa")};
	case "life_inv_heroinp": {("icons\items\heroin.paa")};
	case "life_inv_cannabis": {("icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("icons\items\cannabis.paa")};
	case "life_inv_apple": {("icons\items\apple.paa")};
	case "life_inv_chicken_meat": {("icons\items\meat.paa")};
	case "life_inv_sheep_meat": {("icons\items\meat.paa")};
	case "life_inv_goat_meat": {("icons\items\meat.paa")};
	case "life_inv_rabbit_meat": {("icons\items\meat.paa")};
	case "life_inv_salema": {("icons\items\salema.paa")};
	case "life_inv_ornate": {("icons\items\ornate.paa")};
	case "life_inv_mackerel": {("icons\items\mackerel.paa")};
	case "life_inv_tuna": {("icons\items\tuna.paa")};
	case "life_inv_mullet": {("icons\items\mullet.paa")};
	case "life_inv_catshark": {("icons\items\catshark.paa")};
	case "life_inv_turtle": {("icons\items\turtle.paa")};
	case "life_inv_water": {("icons\items\water.paa")};
	case "life_inv_donuts": {("icons\items\donuts.paa")};
	case "life_inv_coffee": {("icons\items\coffee.paa")};
	case "life_inv_fuelF": {("icons\items\fuel.paa")};
	case "life_inv_fuelE": {("icons\items\fuel.paa")};
	case "life_inv_pickaxe": {("icons\items\pickaxe.paa")};
	case "life_inv_chainsaw": {("icons\items\chainsaw.paa")};
	case "life_inv_copperore": {("icons\items\copperore.paa")};
	case "life_inv_copperr": {("icons\items\copper.paa")};
	case "life_inv_ironore": {("icons\items\ironore.paa")};
	case "life_inv_ironr": {("icons\items\iron.paa")};
	case "life_inv_sand": {("icons\items\sand.paa")};
	case "life_inv_salt": {("icons\items\salt.paa")};
	case "life_inv_saltr": {("icons\items\saltr.paa")};
	case "life_inv_glass": {("icons\items\glass.paa")};
	case "life_inv_tbacon": {("icons\items\tbacon.paa")};
	case "life_inv_lockpick": {("icons\items\lockpick.paa")};
	case "life_inv_redgull": {("icons\items\redgull.paa")};
	case "life_inv_peach": {("icons\items\peach.paa")};
	case "life_inv_diamond": {("icons\items\diamond.paa")};
	case "life_inv_diamondr": {("icons\items\diamondr.paa")};
	case "life_inv_coke": {("icons\items\coke.paa")};
	case "life_inv_cokep": {("icons\items\cokep.paa")};
	case "life_inv_spikeStrip": {("icons\items\spikeStrip.paa")};
	case "life_inv_handCuffs": {("icons\items\handcuff.paa")};
	case "life_inv_handCuffKey": {("icons\items\handcuffkey.paa")};
	case "life_inv_rock": {("icons\items\rock.paa")};
	case "life_inv_cement": {("icons\items\cement.paa")};
	case "life_inv_goldbar": {("icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("icons\items\box.paa")};
	case "life_inv_storagebig": {("icons\items\box.paa")};
	case "life_inv_bombdetect": {("icons\items\bombdetect.paa")};
	case "life_inv_demolitioncharge": {("icons\items\demolitioncharge.paa")};
	case "life_inv_civdefusekit": {("icons\items\defusekit.paa")};
	case "life_inv_beerp": {("icons\items\barrel.paa")};
	case "life_inv_whiskey": {("icons\items\barrel.paa")};
	case "life_inv_moonshine": {("icons\items\barrel.paa")};
	case "life_inv_mash": {("icons\items\mash.paa")};
	case "life_inv_rye": {("icons\items\rye.paa")};
	case "life_inv_hops": {("icons\items\hops.paa")};
	case "life_inv_yeast": {("icons\items\yeast.paa")};
	case "life_inv_bottles": {("icons\items\bottle.paa")};
	case "life_inv_bottledshine": {("icons\items\bottledshine.paa")};
	case "life_inv_bottledbeer": {("icons\items\bottledbeer.paa")};
	case "life_inv_bottledwhiskey": {("icons\items\bottledwhiskey.paa")};
	case "life_inv_kidney": {("icons\items\kidney.paa")};
	case "life_inv_goldbarp": {("icons\items\goldscrap.paa")};
	case "life_inv_underwatercharge": {("icons\items\underwatercharge.paa")};
	case "life_inv_speedbomb": {("icons\items\speedbomb.paa")};
	case "life_inv_scalpel": {("icons\items\scalpel.paa")};
	case "life_inv_zip": {("icons\items\zip.paa")};
	case "life_inv_tentciv": {("icons\items\tent.paa")};
	case "life_inv_wood": {("icons\items\wood.paa")};
	case "life_inv_joint": {("icons\items\cannabis.paa")};
	case "life_inv_dogwhistle": {("icons\items\whistle.paa")};
	case "life_inv_gpstracker": {("icons\items\gps.paa")};
	case "life_inv_vehAmmo": {("icons\items\ammobox.paa")};
	case "life_inv_roadCone": {("icons\items\roadcone.paa")};
	case "life_inv_roadBarrier": {("icons\items\barrier.paa")};
	case "life_inv_blueBarrier": {("icons\items\barrier.paa")};
	case "life_inv_cncBarrier": {("icons\items\cbarrier.paa")};
	case "life_inv_cncBarrierL": {("icons\items\cbarrier.paa")};
	case "life_inv_barGate": {("icons\items\barrier.paa")};
	case "life_inv_mobileOutpost": {("icons\items\outpost.paa")};
	case "life_inv_floodLightSingle": {("icons\items\light.paa")};
	case "life_inv_floodLightDouble": {("icons\items\light.paa")};
	case "life_inv_outpostHMG": {("icons\items\hmg.paa")};
	case "life_inv_blindfold": {("icons\items\blindfold.paa")};
	case "life_inv_ammoBox": {("icons\items\cargobox.paa")};
	case "life_inv_ammoBoxS": {("icons\items\cargobox.paa")};
};