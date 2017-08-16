private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch(_var) do
{
	//Erfolge Block
	case "erfolg_level5": 			{"Gut dabei"};
	case "erfolg_level10": 			{"Alteingesessen"};
	case "erfolg_donator":			{"Donator"};
	case "erfolg_10mio": 			{"Millionär"};
	case "erfolg_25mio": 			{"Reichtum"};
	case "erfolg_50mio": 			{"Richie Rich"};
	case "erfolg_100mio": 			{"Rockefeller"};
	case "erfolg_halloween":		{"Geisterjäger"};
	case "erfolg_gang": 			{"Teamwork"};
	case "erfolg_rarzeug1": 		{"Glücksritter I"};
	case "erfolg_rarzeug2": 		{"Glücksritter II"};
	case "erfolg_rarzeug3": 		{"Glücksritter III"};
	case "erfolg_rarzeug4": 		{"Glücksritter IIII"};
	case "erfolg_rarzeug": 			{"Mit ein wenig Glück"};
	case "erfolg_herstellung": 		{"Do it yourself"};
	case "erfolg_schatzsuche": 		{"Schatz Ahoi!"};
	case "erfolg_muell": 			{"Putzkolonne"};
	case "erfolg_laterne": 			{"Es werde Licht"};
	case "erfolg_timemachine": 		{"Zurück in die Zukunft"};
	case "erfolg_house3":			{"Eigenheim, Glück allein"};
	case "erfolg_house7":			{"Architekt"};
	case "erfolg_pyromane":			{"Pyromane"};
	case "erfolg_lizenzen":			{"Grundaustattung"};
	case "erfolg_berufepol":		{"Räuber und Verbrecher"};
	case "erfolg_berufemed":		{"Ausnahmezustand"};
	case "erfolg_christmas":		{"Es weihnachtet sehr"};
	case "erfolg_wschokolade":		{"So cremig!"};
	case "erfolg_toilet": 			{"Stilles Örtchen"};
	case "erfolg_flieger": 			{"Fliegerass"};	
	case "erfolg_post": 			{"Postmeister"};
	case "erfolg_brummi":			{"Brummifahrer"};
	case "erfolg_bankraub":			{"Endlich Reich"};
	case "erfolg_kunstraub":		{"Meisterdieb"};
	case "erfolg_andreas":			{"Halt Stopp"};
	case "erfolg_euro2016":			{"EM-2016"};
	case "erfolg_ingenieur": 		{"Ingenieur"};
	case "erfolg_schneider":		{"Tapferes Schneiderlein"};
	case "erfolg_muellsammlung":	{"Müllsammler"};
	case "erfolg_bananarama":		{"Bananarama"};
	case "erfolg_pirat":			{"Storzenteller's Rückkehr!"};
};