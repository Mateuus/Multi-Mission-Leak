/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Markt",["apple","peach","banana","pear","lemon","cherry","obstsalat","water","tbacon","rabbit","redgull"]]};
	//extra
	case "rebmarket": {["Waffenschieber-Markt",["water","rabbit","apple","banana","redgull","tbacon","lockpick","pickaxe","axt","battery","hasenfalle","handcuffs","boltcutter","blastingcharge","almanach","aktex","jutesack"], ["reb"]]};
	case "VIPmarket": {["VIP Markt",["water","rabbit","apple","banana","redgull","tbacon","lockpick","pickaxe","axt","hasenfalle","pumpe","handcuffs","battery","almanach","aktex"], ["VIP"]]};
	case "VIPzub": {["VIP Gemischtwaren",["lockpick","pickaxe","axt","hasenfalle","pumpe","handcuffs","battery","almanach","aktex","gpsscanner"], ["VIP"]]};
	case "furniture": {["Altis Möbelhaus",["urkunde_q216","furniture_01", "furniture_02", "furniture_03", "furniture_04", "furniture_05", "edelholz", "bretter"]]};
	case "feuerwehr" : {["Feuerwehr Kantine",["water","rabbit","apple","redgull","tbacon","banana"],["med"]]};
	case "feuerwehrzub" : {["Feuerwehr Zubehör",["mauer","kegel","battery","lockpick","gpstracker","gpsscanner","fuelcan_super","fuelcan_superplus","fuelcan_diesel","fuelcan_biodiesel","fuelcan_kerosin"],["med"]]};
	case "wongs": {["Mr. Fongs Schildkrötenfleisch",["turtle"]]};
	case "coffee": {["Kaffeebar Altis",["coffee","donuts"]]};
	case "heroin": {["Drogendealer",["cocainep","heroinp","marijuana","flush","joints"]]};
	case "fishmarket": {["Altis Fischmarkt",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glashändler",["glass"]]};
	case "iron": {["Altis Metallhändler",["iron_r","copper_r"]]};
	case "diamond": {["Altis Schmuckhändler",["diamondc","silverr","rolex","beryll","aquamarin","bernstein","koenigsbernstein","nephrit","jade","opal","zwielichtopal","peridot","tiefenperidot","zirkon","fuerstenzirkon","saphir","himmelssaphir","smaragd","traumsmaragd","achat","amethyst","malachit","obsidian","rubin","tigerauge","blutstein","blutdiamant"]]};
	case "salt": {["Salzhändler Altis",["salt_r"]]};
	case "cop": {["Altis Polizei - Kantine",["donuts","coffee","water","rabbit","apple","redgull"], ["cop"]]};
	case "cop_g": {["Altis Polizei - Zubehör",["spikeStrip","lockpick","defusekit","mauer","kegel","battery","gpstracker","gpsscanner","fuelcan_super","fuelcan_superplus","fuelcan_diesel","fuelcan_biodiesel","fuelcan_kerosin"], ["cop"]]};
	case "cement": {["Zementhändler Altiis",["cement"]]};
	case "tankstellenshop": {["Tankstellenshop Altis",["water","banana","redgull","tbacon","battery","fuelcan_super","fuelcan_superplus","fuelcan_diesel","fuelcan_biodiesel","fuelcan_kerosin"]]};
	case "bar": {["Getränkehändler",["bottledbeer","bottledwhiskey"]]};
	case "speakeasy": {["Absinth Dealer",["bottledwhiskey","bottledshine","bottledbeer","flush"]]};
	case "crafting": {["Crafting Zubehör",["fahrzeugteile","craftingtool_01","elektroschrott","papier","edelmetall","fuelcan_super","fuelcan_superplus","fuelcan_diesel","fuelcan_biodiesel","fuelcan_kerosin"]]};
	case "gemischtwaren": {["Gemischtwaren Händler",["cornmeal","bottles","pickaxe","axt","pumpe","hasenfalle","battery","gpsscanner"]]};
	case "jva": {["JVA Shop",["water","tbacon"]]};
	case "baumwollemarket": {["Stoffhändler",["stoff","faser"]]};
	case "apotheker": {["Apotheker",["acetylsalicylsaeure","aspirin","hypromellose"]]};
	case "jet_dopinglabor": {["Dopinglabor",["viagra"]]};
	case "tabacco": {["Tabakhändler",["zigarette","feinschnitt"]]};
	case "tutorial": {["Tutorial Händler",["bs_offroad"]]};
	case "AaM": {["AaM Shop",["fahrzeugteile","bp_sting","bp_vermin","bp_trg21","bp_mxc","bp_mx","bp_katiba","bp_rahim","bp_mk20","bp_mxm","bp_ghillie","bp_humm_civ","bs_humm_civ","bs_zamak_i","bs_zamak_ii","bs_zamak_r_i","bs_zamak_r_ii","bs_zamak_f_i","bs_zamak_f_ii","bs_offroad","bs_suv","craftingtool_01","elektroschrott","papier","edelmetall"]]};
	
	//Gruppierungen
	case "gruppen_market":
	{
		if((["ps"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "psbase") < 60)) exitWith {["PS Warenhändler",["water","rabbit","apple","banana","redgull","tbacon"]]};
		if((["soa"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "soa_maker") < 60)) exitWith {["SoA Warenhändler",["water","rabbit","apple","banana","redgull","tbacon"]]};
		if((["ff"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "ff_marker") < 60)) exitWith {["FF Warenhändler",["water","rabbit","apple","banana","redgull","tbacon","bp_furniture_05"]]};
		if((["ksk"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "SOG") < 60)) exitWith {["SOG Warenhändler",["water","rabbit","apple","banana","redgull","tbacon"]]};
		if((["dm"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "dm_base") < 60)) exitWith {["DM Warenhändler",["water","rabbit","apple","banana","redgull","tbacon"]]};
		if((["bwa"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "bwa_marker") < 60)) exitWith {["BWA Warenhändler",["water","rabbit","apple","banana","redgull","tbacon"]]};
	};
	case "gruppen_waffenschmied":
	{
		if((["ps"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "psbase") < 60)) exitWith {["PS Waffenschmiede",["bp_tazer","bp_mx_ps","bp_sting","bp_vermin","bp_trg21","bp_vestclblack_grp","bp_vestcrgreen_grp"]]};
		if((["soa"] call EMonkeys_fnc_permLevel) < 3 && (player distance (getMarkerPos "soa_maker") < 60)) exitWith {["SoA Waffenschmied",[]]};
		if((["soa"] call EMonkeys_fnc_permLevel) > 2 && (player distance (getMarkerPos "soa_maker") < 60)) exitWith {["SoA Waffenschmied",["bp_sting","bp_vermin","bp_trg21","bp_mxm_grp","bp_vestclblack2_grp"]]};
		if((["ff"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "ff_marker") < 60)) exitWith {["FF Waffenschmied",["bp_sting","bp_vermin","bp_trg21"]]};
		if((["ksk"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "SOG") < 60)) exitWith {["SOG Waffenschmied",["bp_sting","bp_vermin","bp_trg21","bp_mx_gl_sog","bp_mxm_grp","bp_tazer","bp_vestpcl_ctrg","bp_vestpch_ctrg"]]};
		if((["dm"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "dm_base") < 60)) exitWith {["DM Waffenschmied",["bp_mxm_grp"]]};
		if((["bwa"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "bwa_marker") < 60)) exitWith {["gruppe_fail"]};
	};
	case "ap": {["AP Markt",["water","rabbit","apple","redgull","tbacon","pickaxe","axt","hasenfalle","banana","battery"],["ap"]]};
}; 