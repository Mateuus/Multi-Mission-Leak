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
	case "market": {["Supermarkt",["toiletpaper","water","rabbit","apple","redgull","tbacon","peach","eis","cornmeal","joghurt","bratwurst","pizza","kakao","salat","tomate","gsalat","turtlesoup","banane"]]};
	case "werkzeug": {["Werkzeuge",["pickaxe","axt","pumpe","fishing","fuelF","boltcutter"]]};
	case "elektro": {["Elektronikartikel",["detektor","battery","gpsTracker","guthaben","guthabenplus","guthabenpremium"]]};
	case "italiener": {["Dimitris Pizza",["pizza","eis","schokolade","donuts","coffee","kakao","water"]]};
	case "latino": {["Hula Bar",["water","bobby","bottledwhiskey","bottledshine","bottledbeer","bratwurst"]]};
	case "party": {["Partyshop",["party","feuerwerkr","feuerwerkb","feuerwerkg","feuerwerkw","feuerwerk"]]};
	case "rebel": {["Rebellenmarkt",["water","rabbit","apple","redgull","tbacon","lockpick","kabelbinder","pickaxe","axt","pumpe","fuelF","peach","longbox","boltcutter","blastingcharge","scalpel","gpsTracker","protestschild","feuer","klappstuhl","toiletpaper"]]};
	case "gang": {["Gangshop", ["water","rabbit","apple","redgull","tbacon","lockpick","kabelbinder","pickaxe","axt","pumpe","fuelF","peach","boltcutter","gpsTracker","protestschild","feuer","klappstuhl"]]};
	case "coffee": {["Kaffeeclub Altis",["coffee","kakao","donuts","eis","schokolade"]]};
	case "heroin": {["Drogenhändler",["cocainep","heroinp","marijuana","joint"]]};
	case "oil": {["Schaich Abd-El-Faggot",["oilp","pumpe"]]};
	case "fishmarket": {["Fischmarkt Altis",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Glaserei Altis",["glass","bottles"]]};
	case "iron": {["Metallhandel",["iron_r","copper_r"]]};
	case "diamond": {["Juwelier",["diamond","diamondc","perlen","schmuck"]]};
	case "antik": {["Antiquitätenhändler Altis",["reichtum","dublonen"]]};
	case "salt": {["Salzhandel",["salt_r"]]};
	case "cop": {["Polizeifachhandel",["donuts","coffee","gsalat","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit","lockpick","holzb","sperre","hut","band","battery","gpsTracker","klappstuhl","verband","toiletpaper"]]};
	case "med": {["Ärztefachhandel",["donuts","coffee","redgull","fuelF","lockpick","hut","holzb","sperre","band","battery","tablette","tablette2","tablette3","verband","toiletpaper","gegengift","kidney","krankmeldung","ahwcart","klappstuhl","rollator","gpsTracker","medizin_p","schrott_p"]]};	
	case "cement": {["Baustoffhandel",["cement","plastik"]]};
	case "gold": {["Briefgold e.V.",["goldbar"]]};
	case "organ": {["Organhändler",["kidney","scalpel"]]};
	case "bar": {["Anonymer Alkoholiker",["bottledbeer","bottledwhiskey","bottledshine"]]};
	case "speakeasy": {["Anonymer Alkoholiker",["bottledwhiskey","bottledshine","bottledbeer"]]};
	case "donator": {["Don Ator's Werkzeugkasten",["laterne", "timemachine"]]};
	case "metzger": {["Altis Fleischereifachverkauf",["henmeat","roostermeat","goatmeat","sheepmeat","rabbit","bratwurst"]]};
	case "jagd": {["Altis Jagdbedarf",["jagdmeister","jagdmesser","jagdhorn"]]};
	case "labor": {["Illegaler Chemiefrachter",["plutonium"]]};
	case "moebel": {["Roco Domäne",["mahagoni","laminat","bauholz","storagebig","storagesmall"]]};
	case "schneider": {["Das tapfere Schneiderlein",["nadel"]]};
	case "apotheke": {["Altis Apotheke",["ahwcart","tablette","tablette2","tablette3","gegengift","verband","rollator","toiletpaper","defibrillator"]]};
	case "konditorei": {["Konditorei Kindt",["schokolade","praline","coffee","kakao"]]};
	case "tabak": {["Tabakwarenladen CoolKidz",["zigarre","zschachtel_voll"]]};
	case "serverpoints": {["Altis Wunderkiste",["timemachine","darkorb","storagesmall","storagebig","gpsTracker","guthabenpremium","feuerwerkr","feuerwerkg","feuerwerkb","feuerwerkw","feuerwerk","defibrillator","blueprintscooter"]]};
	case "museum": {["Museum Altis",["goetzi","bertram","momphred","ron","john"]]};
	case "gebrauchtwaren": {["Gebrauchtwarenhandel",["skelett","alterschuh","bananenschale","buegeleisen","dose","altesocke","fischdose","pizzaschachtel","spielzeugpuppe","trinkpack"]]};
	
	//Halloween
	case "darktrader": {["Dark Trader (Lukes Vater)",["darkorb"]]};

	//Weihnachten
	case "weihnachtsmarkt1": {["Harrys Bude",["bratwurst","gmandeln"]]};
	case "weihnachtsmarkt2": {["Gerd's Glühweinstand",["kakao","coffee","gwein"]]};
};