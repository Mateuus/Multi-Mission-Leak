/*
- Unnützes: [0.6,0.6,0.6,1] | #999999
- Verbrauchsgegenstand: [1,1,1,1] | #ffffff
- Ungewöhnlich: [0,1,0,1] | #00FF00
- Selten: [0,0.4,1,1] | #0066FF
- Episch: [0.5,0.2,0.8,1] | #7F33CC
- Ultimativ: [1,0.5,0,1] | #FF7F00
*/

private["_classname"];
_classname = [_this,0,"",[""]] call BIS_Fnc_param;
if(_classname == "") exitWith {""};

_grau = ["turtle","quest1","quest2","quest3","skelett","alterschuh","bananenschale","buegeleisen","dose","altesocke","fischdose","pizzaschachtel","spielzeugpuppe","trinkpack"];

_weiss = ["apple","rabbit","salema","ornate","mackerel","tuna","water","turtlesoup","donuts","coffee","tbacon","lockpick","pickaxe","fishing","fuelF","peach","spikeStrip","longbox","boltcutter","storagesmall","holzb","sperre","hut","band","battery","scalpel","eis","party","bobby","moonshine","whiskey","beerp","cornmeal","mash","bottles","joghurt","pumpe","tablette","tablette2","tablette3","verband","henraw","roosterraw","sheepraw","goatraw","rabbitraw","henmeat","roostermeat","sheepmeat","seide","jagdmesser","axt","kabelbinder","kabelbinderkey","heroinp","cocainep","marijuana","indigo","nadel","pizza","guthaben","toiletpaper","schokolade","salat","tomate","gsalat","medizin","medizin_p","schrott","schrott_p","oilp","glass","bottles","iron_r","copper_r","diamond","diamondc","salt_r","cement","plastik","plutoniumu","bauholz","laminat","oilu","heroinu","cannabis","fuelE","copperore","ironore","salt","sand","cocaine","rock","rye","hops","yeast","holz","baumwolle","ticket","parkschein","kakaobohne","plastikmuell","papier","zschachtel_leer","schrauben","tabakblatt","zigarette","cable","reifen","schaufel","lupe","john"];

_gruen = ["catshark","redgull","blastingcharge","defusekit","storagebig","bottledbeer","gegengift","goatmeat","bratwurst","jagdhorn","jagdmeister","plutonium","ahwcart","feuer","klappstuhl","guthabenplus","detektor","feuerwerkr","feuerwerkg","feuerwerkb","feuerwerkw","gmandeln","gwein","kakao","praline","rollator","perlen","mahagoni","football","zschachtel_voll","joint","aluminium","banane","goetzikopf","goetzitorso","goetziglied","johnkopf","johntorso","johnglied","bertramkopf","bertramtorso","bertramglied","ronkopf","rontorso","ronglied","momphredkopf","momphredtorso","momphredglied","goetzi","bertram"];

_blau = ["kidney","krankmeldung","protestschild","netz","guthabenpremium","feuerwerk","defibrillator","dublonen","goldbar","bottledwhiskey","perlenp","darkuni","wschokolade","airhorn","stahl","blueprintsport","blueprintprowler","blueprintqilin","blueprintscooter","ron","zigarre"];

_lila = ["gpsTracker","pressluft","schmuck","reichtum","bottledshine","blueprintorca","blueprintcaesar","momphred","volleyball"];

_rot = ["laterne","timemachine","darkorb","geschenk"];

switch(true) do {
	case (_classname in _grau): {["Unnütz",[0.6,0.6,0.6,1],"#999999"]};
	case (_classname in _weiss): {["Gewöhnlich",[1,1,1,1],"#ffffff"]};
	case (_classname in _gruen): {["Ungewöhnlich",[0,1,0,1],"#00FF00"]};
	case (_classname in _blau): {["Selten",[0,0.4,1,1],"#0066FF"]};
	case (_classname in _lila): {["Episch",[0.5,0.2,0.8,1],"#7F33CC"]};
	case (_classname in _rot): {["Legendär",[1,0.5,0,1],"#FF7F00"]};
	default {["Fehler",[0.6,0.6,0.6,1],"#999999"]};
};