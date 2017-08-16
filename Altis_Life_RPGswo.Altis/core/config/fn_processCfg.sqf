/*
	File: fn_processCfg.sqf
	Author: Firly
	
	Description:
	Master config for a Processing
*/
private["_type","_ret"];
_type = param [0,"",[""]];
if(_type == "") exitWith {[]};
_ret = [];

_ret = switch (_type) do
{
	case "oil": {["oilu","oilp",1200,"Verarbeite das Öl",false];};
	case "diamond": {["diamond","diamondc",1350,"Schleife die Diamanten",false]};
	case "heroin": {["heroinu","heroinp",1720,"Verfeinere das Heroin",false]};
	case "copper": {["copperore","copper_r",750,"Schmelze den Kupfer",false]};
	case "iron": {["ironore","iron_r",1120,"Schmelze das Eisen",false]};
	case "sand": {["sand","glass",650,"Blase das Glas",false]};
	case "salt": {["salt","salt_r",450,"Zerkrümel die Salzbrocken",false]};
	case "coke": {["cocaine","cocainep",1500,"Verfeinere das Kokain",false]};
	case "marijuana": {["cannabis","marijuana",500,"Verfeinere das Marijuana",false]};
	case "cement": {["rock","cement",350,"Mixe den Zement",false]}; 
	case "grapes": {["grapes","vodka",250,"Stampfe es zu Wein",false]};
	case "moonshine": {["grapes","moonshine",550,"Produziere Schwarzgebrannten Obstschnaps",false]};
	case "methkochen": {["methst","methpla",2250,"Produziere Methylamphetamin Platten",false]};
	case "methbruch": {["methpla","meth",2250,"Produziere Cystal Meth",false]};
	case "bufopro": {["kroete","bufo",2250,"Quäle Kröte",false]};
	case "dmtpro": {["bufo","dmt",2250,"Produziere Dimethyltryptamin",false]};
	case "schenkelpro": {["kroete","schenkel",3000,"Reiße Krötenbeine raus",false]};
	case "suppenpro": {["kroete","ksuppe",3000,"Produziere Kröten Suppe",false]};
	case "streckendmt": {["dmt","dmtge",4000,"Strecke das Dimethyltryptamin",false]};
	case "streckenmeth": {["meth","methge",4000,"Strecke das Cystal Meth",false]};
	case "streckenkoka": {["cocainep","cocainege",4000,"Strecke das Kokain",false]};
	case "streckenmari": {["marijuana","marijuanage",4000,"Strecke das Marijuana",false]};
	case "streckenhero": {["heroinp","heroinge",4000,"Strecke das Heroin",false]};
	case "pfeffer": {["pfeffer","pfefferp",450,"Zerbrösel die Körner",false]};
	case "pilzsu": {["pilz","pilzsuppe",1050,"Koche Pilzsuppe",false]};
	case "zpilz": {["zaupilz","zauberpilz",4000,"Reinige die Zauberpilze",false]};
	case "zpilzge": {["zauberpilz","zauberpilzge",4000,"Strecke die Zauberpilze",false]};
	case "apfelsa": {["apple","apfelsaft",300,"Stampfe die Äpfel",false]};
	case "pfirsa": {["peach","pfirsichsaft",300,"Stampfe die Pfirsiche",false]};
	case "goldsch": {["golderz","goldberuf",1000,"Schmelze das Gold",false]};
	case "silbersch": {["silbererz","silberbar",1000,"Schmelze das Silber",false]};
	case "ringsch": {["goldberuf","ring",2000,"Schmiede Ringe",true,"silberbar"]};
	case "uranium1": {["uranium1","uranium2",5000,"Filter das Uranium",false];};
	case "uranium2": {["uranium2","uranium3",7500,"Reinige das Uranium",true,"ipuranium"]};
	case "uranium3": {["uranium3","uranium4",10000,"Trenne das Uranium",false];};
	case "uranium4": {["uranium4","uranium5",15000,"Uranium wird getrocknet",false];};
	case "muschel": {["muschel","perlen",600,"Breche Muschel auf",false]};
	case "perlen": {["perlen","perlenk",1000,"Perlen werden verarbeitet",false]};
	case "kartoffel": {["kartoffel","kartoffelp",600,"Wasche die Kartoffeln",false]};
	case "pommes": {["kartoffelp","pommes",1000,"Schneide die Kartoffeln",false]};
	case "salat": {["salat","salatp",600,"Wasche den Salat",false]};
	case "salatblatt": {["salatp","salatb",1000,"Rupfe den Salat",false]};
	case "curry": {["curry","curryp",600,"Zerbrösel das Kraut",false]};
	case "zimt": {["zimt","zimtp",600,"Zerbrösel die Stangen",false]};
	case "heroinsp": {["heroinge","heroinsp",5000,"Fuelle die Spritzen",false]};
	case "joint": {["marijuanage","joint",5000,"Baue den Joint",false]};

	// Tanoa
	case "bananav": {["banana","bananap",30,"Fertige den Bananensaft",false]};
	case "melonv": {["melon","melonp",30,"Verarbeite Melonen zu Eis",false]};
	case "kokosv": {["kokos","kokosp",30,"Stelle Kokosmilch her",false]};
	case "kokosbananav": {["kokos","kokosbananamilk",100,"Stelle Kokos-Bananensaft her",true,"banana"]};
	case "kakaov": {["kakao","kakaop",1200,"Mahle die Kakaobohnen",false]};
	case "zuckerrohrv": {["zuckerrohr","zuckerrohrp",1200,"Stelle Zucker her",false]};
	case "kautschukv": {["kautschuk","kautschukp",1200,"Stelle Gummi her",false]};
	case "tabakv": {["tabak","tabakp",1200,"Trockne den Tabak",false]};
	case "lehmv": {["lehm","lehmp",1200,"Brenne die Ziegel",false]};
	case "kohlev": {["kohle","kohlep",1200,"Fertige die Briketts",false]};
	case "platinv": {["platin","platinp",1200,"Schmelze das Platin zu Platinfelgen",false]};
	case "magmav": {["magma","magmap",1200,"Schleife den Obsidian",false]};
	case "tropenholzv": {["tropenholz","tropenholzp",1200,"Stelle Balken her",false]};
	case "schlafmohnv": {["schlafmohn","schlafmohnp",1200,"Stelle Opium her",false]};
	case "reliktv": {["relikt","reliktp",3500,"Schätze die Relikte",false]};
	case "anakondav": {["anakonda","anakondap",2500,"Häute die Schlange",false]};
	case "kriegsschrottv": {["kriegsschrott","kriegsschrottp",3000,"Reinige die Waffen",false]};
	case "krokov": {["kroko","krokop",2500,"Brüte die Krokodileier",false]};
	case "krokostreckv": {["krokop","krokostreck",2500,"Fertige Krokodilleder an",false]};
	case "anakondastreckv": {["anakondap","anakondastreck",2500,"Stelle eine Schlangenhauttasche her",false]};
	case "schlafmohnstreckv": {["schlafmohnp","schlafmohnstreck",3000,"Strecke das Opium",false]};
	case "kriegsschrottstreckv": {["kriegsschrottp","kriegsschrottstreck",3000,"Verpacke die Waffen",false]};
	case "reliktstreckv": {["reliktp","reliktstreck",3000,"Verpacke das Relikt",false]};
	case "schokov": {["kakaop","schoko",2000,"Stelle Schokolade her",true,"zuckerrohrp"]};
	case "reifenv": {["kautschukp","reifen",2000,"Stelle Reifen her",true,"platinp"]};
	default {[]};
};

_ret;