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
	case "life_inv_oilu": {("icons\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("icons\items\oil_processed.paa")};
	case "life_inv_heroinu": {("icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("icons\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("icons\items\marijuana.paa")};
	case "life_inv_apple": {("icons\items\apple.paa")};
	case "life_inv_rabbit": {("icons\items\meat.paa")};
	case "life_inv_salema": {("icons\items\fish.paa")};
	case "life_inv_ornate": {("icons\items\fish.paa")};
	case "life_inv_mackerel": {("icons\items\fish.paa")};
	case "life_inv_tuna": {("icons\items\fish.paa")};
	case "life_inv_mullet": {("icons\items\fish.paa")};
	case "life_inv_catshark": {("icons\items\fish.paa")};
	case "life_inv_turtle": {("icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("icons\items\fishingpoles.paa")};
	case "life_inv_water": {("icons\items\water.paa")};
	case "life_inv_coffee": {("icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("icons\items\donut.paa")};
	case "life_inv_fuelE": {("icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("icons\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("icons\items\iron.paa")};
	case "life_inv_silberu": {("icons\items\iron_ore.paa")};
	case "life_inv_silberp": {("icons\items\silberbarren.paa")};
	case "life_inv_copperr": {("icons\items\copper.paa")};
	case "life_inv_sand": {("icons\items\sand.paa")};
	case "life_inv_salt": {("icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("icons\items\salt.paa")};
	case "life_inv_glass": {("icons\items\glass.paa")};
	case "life_inv_diamond": {("icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("icons\items\diamond.paa")};
	case "life_inv_tbacon": {("icons\items\ico_tbacon.paa")};
	case "life_inv_redgull": {("icons\items\redgull.paa")};
	case "life_inv_lockpick": {("icons\items\lockpick.paa")};
	case "life_inv_peach": {("icons\items\peach.paa")};
	case "life_inv_coke": {("icons\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("icons\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("icons\items\spikestrip.paa")};
	case "life_inv_rock": {("icons\items\rock.paa")};
	case "life_inv_cement": {("icons\items\cement.paa")};
	case "life_inv_goldbar": {("icons\items\ico_Platinbarren.paa")};
	case "life_inv_blastingcharge": {("icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("icons\items\storagesmall.paa")};
	case "life_inv_storagebig": {("icons\items\storagebig.paa")};
	case "life_inv_zucker": {("icons\items\salt_unprocessed.paa")};
	case "life_inv_mais": {("icons\items\mais.paa")};
	case "life_inv_maische": {("icons\items\maische.paa")};
	case "life_inv_schnaps": {("icons\items\moonshine.paa")};
	case "life_inv_bauma": {("icons\items\netz.paa")};
	case "life_inv_brenn": {("icons\items\moonshine.paa")};
	case "life_inv_flasche": {("icons\items\water.paa")};
	case "life_inv_eisenkugel": {("icons\items\eisenkugel.paa")};
	case "life_inv_holzbrett": {("icons\items\holzbretter.paa")};
	case "life_inv_stein": {("icons\items\rock.paa")};
	case "life_inv_dose": {("icons\items\moonshine.paa")};
	case "life_inv_papier": {("icons\items\glass.paa")};
	case "life_inv_schaufel": {("icons\items\schaufel.paa")};
	case "life_inv_bauschaufel" : {("icons\items\schaufel.paa")};
	case "life_inv_muenze": {("icons\items\muenze.paa")};
	case "life_inv_schmuck": {("icons\items\schmuck.paa")};
	case "life_inv_vase": {("icons\items\vase.paa")};
	case "life_inv_weinp" : {("icons\items\ico_Weinflasche.paa")};
	case "life_inv_zigarrettep" : {("icons\items\zigaretten.paa")};
	case "life_inv_zigarrenp" : {("icons\items\ico_Zigarren.paa")};
	case "life_inv_goldp": {("icons\items\ico_Goldbarren.paa")};
	case "life_inv_goldu" : {("icons\items\ico_Golderz.paa")};
	case "life_inv_gschmuck" : {("icons\items\ico_Goldschmuck.paa")};
	case "life_inv_sschmuck" : {("icons\items\ico_Silberrschmuck.paa")};
	case "life_inv_lsdu" : {("icons\items\ico_Kröte.paa")};
	case "life_inv_lsdp" : {("icons\items\ico_LSD.paa")};
	case "life_inv_sprengstoffu" : {("icons\items\ico_schwarzpulver.paa")};
	case "life_inv_zigarettenu" : {("icons\items\ico_Tabak.paa")};
	case "life_inv_weinu" : {("icons\items\ico_Trauben.paa")};
	case "life_inv_weinp" : {("icons\items\wein.paa")};
	case "life_inv_kerosin" : {("icons\items\ico_Benzin.paa")};
	case "life_inv_sprengstoffp" : {("icons\items\ico_Dynamite.paa")};
	case "life_inv_methp" : {("icons\items\methp.paa")};
	case "life_inv_methu" : {("icons\items\methu.paa")};
	case "life_inv_bpzafir" : {("icons\items\blueprint.paa")};
	case "life_inv_bpmarten" : {("icons\items\blueprint.paa")};
	case "life_inv_bplrr" : {("icons\items\blueprint.paa")};
	case "life_inv_bplynx" : {("icons\items\blueprint.paa")};
	case "life_inv_bpmk1" : {("icons\items\blueprint.paa")};
	case "life_inv_bpmk14" : {("icons\items\blueprint.paa")};
	case "life_inv_bpmk18" : {("icons\items\blueprint.paa")};
	case "life_inv_bpakm" : {("icons\items\blueprint.paa")};
	case "life_inv_bpspar17" : {("icons\items\blueprint.paa")};
	case "life_inv_bpak17" : {("icons\items\blueprint.paa")};
	case "life_inv_schulterstuetze" : {("icons\items\schulterstuetze.paa")};
	case "life_inv_baumwolle" : {("icons\items\baumwolle.paa")};
	case "life_inv_kohle" : {("icons\items\coal.paa")};
	case "life_inv_stahl" : {("icons\items\stahl.paa")};
	case "life_inv_lagerkiste" : {("icons\items\lagerkiste.paa")};
	case "life_inv_kies" : {("icons\items\kies.paa")};
	case "life_inv_xtc" : {("icons\items\methu.paa")};
	case "life_inv_sense" : {("icons\items\methp.paa")};
	case "life_inv_calzone" : {("icons\items\salami.paa")};
	case "life_inv_margarita" : {("icons\items\margarita.paa")};
	case "life_inv_lauf" : {("icons\items\lauf.paa")};
	case "life_inv_mantel" : {("icons\items\mantel.paa")};
	case "life_inv_zipties" : {("icons\items\handschellen.paa")};
	case "life_inv_strahler" : {("icons\items\strahler.paa")};
	case "life_inv_zweibein" : {("icons\items\zweibein.paa")};
	case "life_inv_handgriff" : {("icons\items\handgriff.paa")};
	case "life_inv_presslufthammer" : {("icons\items\presslufthammer.paa")};
	case "life_inv_barrier" : {("icons\items\barrier.paa")};
	case "life_inv_barricade" : {("icons\items\barricade.paa")};
	case "life_inv_plastik" : {("icons\items\plastik.paa")};
	case "life_inv_verschluss" : {("icons\items\verschluss.paa")};
	case "life_inv_parkticket" : {("icons\items\parkticket.paa")};
	case "life_inv_usb" : {("icons\items\blueprint.paa")};
	case "life_inv_megaphone": {("icons\items\megaphone.paa")};
	
	
};