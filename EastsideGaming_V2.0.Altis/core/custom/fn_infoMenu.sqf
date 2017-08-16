/*
	Author: Basti | John Collins
	Description:
	This Script was written for Eastside-Gaming.de
	Used for the Information Menu
*/
private _mode = param[0, 0, [-1]];
_content = [["Willkommen","0"],["Serverteam","1"],["Steuerung","2"],["Anfängertipps","3"],["Fahrzeugpreise","4"],["Lizenzpreise","5"],["Legale Farmrouten","6"],["Illegale Farmrouten","7"]];
switch(_mode) do {
	case 0: {
		disableSerialization;
		if (!(isNull (findDisplay 4354))) exitWith {systemchat "error";};
		createDialog "ESG_infoMenu";
		_display = findDisplay 4354;
		_list = _display displayCtrl 1997;
		{
			_index = _list lbadd format["%1", _x select 0];
			_list lbSetData[(lbSize _list) - 1, _x select 1];
		} foreach _content;
		_list lbSetCurSel 0;
	};
	
	case 1: {
		disableSerialization;
		_display = findDisplay 4354;
		_contentlist = _display displayCtrl 1997;
		_header = _display displayCtrl 1000;
		_ctrlgruppe = _display displayCtrl 121212;
		//_infos = _ctrlgruppe controlsGroupCtrl 6565;
		_data = _contentlist lbData (lbcursel _contentlist);
		if (_data isEqualTo "") exitWith {hint "Es ist ein Fehler aufgetreten."};

		_contenttext = switch (_data) do {
			case "0": {
				['Willkommen auf Eastside','Herzlich Willkommen auf Eastside-Gaming!<br/>Wir hoffen du hast dein Ziel erreicht und wir wünschen dir viel Spaß! Solltest du Probleme haben oder Bugs finden, dann besuche uns doch auf unserem Teamspeak Server. IP: server.Eastside-Gaming.de<br/><br/>Wir können dir auf unserem Teamspeak auch einen eigenen Clanbereich einrichten und eine eigene Clan-Servergruppe erstellen. Dieses Angebot gilt, sobald ihr mehr als 5 aktive Leute im Clan seid!<br/><br/>Wir haben auch ein Forum, welches du unter Eastside-Gaming.de erreichst, in dem wir aktuelle Neuigkeiten und Ankündigungen posten. Dort kannst du dich auch für die jeweiligen Fraktionen bewerben.<br/><br/>Falls du neu bist kannst du unter dem Punkt "Anfängertipps" wissenswerte Sachen erfahren. Außerderm kannst du natürlich Frau Sommer am Marktplatz ansprechen und nach Hilfe fragen.'];
			};
			case "1": {
				['Serverteam','<t font="PuristaBold">Serverleitung</t><br/>		- Rainer Blödsinn<br/>		- Livinya Sommer<br/>		- Pantyshot<br/><br/><t font="PuristaBold">Projektmanagement</t><br/>		- Basti<br/>		- Niel Skyfall<br/><br/><t font="PuristaBold">Supportleitung</t><br/>		- Dominik<br/>		- Harmy<br/><br/><t font="PuristaBold">Leitender Developer</t><br/>		- Basti<br/><br/><t font="PuristaBold">Developer</t><br/>		- Gesucht -<br/><br/><t font="PuristaBold">Grafiker Leitung</t><br/>		- Gesucht -<br/><br/><t font="PuristaBold">Grafiker</t><br/>		- Gesucht -<br/><br/><t font="PuristaBold">Fraktionsleitung - Polizei</t><br/>		- Niel Skyfall<br/>		- Gustav Krone<br/><br/><t font="PuristaBold">Fraktionsleitung - Feuerwehr</t><br/>		- Michael McSilver<br/>		- Hermann Bauer'];
			};
			case "2": {
				['Steuerung','<t font="PuristaBold">Allgemeine Steuerung</t><br/><t size="0.9">Format: Taste | Beschreibung</t><br/><br/>    Windowstaste | Interaktionstaste (Interaktionsmenü, Abbauen, Items aufheben)<br/>    Shift + B | Ergeben<br/>    Shift + H | Waffe Holstern<br/>    Strg + H | Waffe ziehen (Wenn geholstert)<br/>    Shift + G | Niederschlagen<br/>    T | Fahrzeuginventar öffnen<br/>    Shift + C | Personen festnehmen (Kabelbinder benötigt)<br/>    Shift + O | Ohrstöpsel<br/>    U | Fahrzeug auf/abschließen<br/><br/><t font="PuristaBold">Behördensteuerung</t><br/>    F | Sirene 1<br/>    Shift + F | Sirene 2<br/>    C | Yelp Sirene (Polizei)<br/>    Shift + R | Festnehmen<br/>    Shift + L | Blaulicht<br/>    Shift + K | Fuelkiller Konsole<br/>    Shift + Ä | Tore öffnen'];
			};
			case "3": {
				['Anfängertipps','<t font="PuristaBold">Einleitung</t><br/><br/>Lieber Spieler,<br/>ich schätze wenn du dies liest bist du neu hier auf dieser Insel.<br/>In diesem kleinen Guide erkläre ich dir ein paar Sachen die du in deinem späteren Leben gut gebrauchen kannst.<br/><br/><br/><t font ="PuristaBold">Z-Inventar:</t><br/><br/>In diesem Inventar findest du sämtliche Angaben über deinen Charakter.<br/>Oben links findest du Informationen über dein Kontostand. Direkt recht daneben findest du deine Lizenzen, welche du benötigst um z.B. ein Auto zu fahren.<br/>Rechts siehst du dein aktuelles Inventar. Hier kannst du deine Virtuellen Items verwalten, sie löschen oder benutzen.<br/>Direkt darunter findest du eine Dropdown-Liste, welche Spieler in deiner Nähe auflistet.<br/><br/>Unten im Menü siehst du alle Funktionen die du mit dem Z-Inventar ausführen kannst. Eine Funktion ist z.B. dein Telefon, mit welchem du Personen anschreiben kannst und Notrufe absetzen kannst.<br/><br/><br/><t font="PuristaBold">I-Inventar:</t><br/><br/>In diesem Inventar findest du alle Items die du z.B. im Baumarkt kaufen kannst, oder später auch deine Waffen.<br/>Im General Store kaufst du zum Start am besten ein Werkzeugkasten, ein GPS und eine Nachtsichtbrille.<br/><br/><br/><t font="PuristaBold">Wie fange ich denn nun wirklich an ?</t><br/><br/>Diese Frage werden sich wahrscheinlich die meisten von euch stellen.<br/>Nun, am besten fangt ihr damit an, indem ihr euch ein Auto beim Auto Laden kauft, nachdem ihr den Führerschein erworben habt.<br/>Nun fahrt ihr zum Apfel oder Pfirsichfeld und pflückt dort euer Obst, welches ihr am Markt verkaufen könnt.<br/>Später, wenn ihr mehr Geld habt könnt ihr auch eine Ausbildung zum Saftpresser machen. Durch diese Ausbildung könnt ihr aus dem Obst Saft herstellen.'];
			};
			case "4": {
				['Fahrzeugpreise', [2]call ESG_fnc_infoMenu];
			};
			case "5": {
				['Lizenzpreise',[3]call ESG_fnc_infoMenu];
			};
			case "6": {
				['Legale Farmrouten','<t font="PuristaBold">Farmrouten ohne Spitzhacke</t><br/><br/><t font="PuristaBold" size="0.8">Äpfel:</t><br/>   Apfelfeld >> Markt<br/><br/><t font="PuristaBold" size="0.8">Pfirische:</t><br/>   Pfirsichfeld >> Markt<br/><br/><t font="PuristaBold" size="0.8">Kirschen:</t><br/>   Kirschfeld >> Markt<br/><br/><t font="PuristaBold" size="0.8">Bananen:</t><br/>   Bananenfeld >> Markt<br/><br/><t font="PuristaBold" size="0.8">Apfelsaft:</t><br/>   Apfelfeld >> Saftpresse >> Markt<br/><br/><t font="PuristaBold" size="0.8">Pfirsichsaft:</t><br/>   Pfirsichfeld >> Saftpresse >> Markt<br/><br/><t font="PuristaBold" size="0.8">Kirschsaft:</t><br/>   Kirschfeld >> Saftpresse >> Markt<br/><br/><t font="PuristaBold" size="0.8">Bananensaft:</t><br/>   Bananenfeld >> Saftpresse >> Markt<br/><br/><t font="PuristaBold" size="0.8">KiBa (Kirsch-Bananensaft):</t><br/>   Kirschsaft + Banensaft >> Saftfabrik >> Markt<br/><br/><t font="PuristaBold" size="0.8">Glas:</t><br/>   Sandmine >> Glasschmelze >> Glasankauf<br/><br/><t font="PuristaBold" size="0.8">Holz:</t><br/>   Wald >> Sägewerk >> Holzexport<br/><br/><t font="PuristaBold" size="0.8">Weintrauben:</t><br/>   Weintraubenplantage >> Markt<br/><br/><t font="PuristaBold" size="0.8">Wein:</t><br/>   Weintraubenplantage >> Weinpresse >> Alkoholexport<br/><br/><t font="PuristaBold" size="0.8">Bier:</t><br/>   Hopfenfeld + Maische Zutaten >> Brauerei (Mischverhätnis 1:1) >> Alkoholexport<br/><br/><br/><t font="PuristaBold">Farmrouten mit Spitzhacke</t><br/><br/><t font="PuristaBold" size="0.8">Kupfer:</t><br/>   Kupfermine >> Kupferschmelze >> Kupferankauf<br/><br/><t font="PuristaBold" size="0.8">Eisen:</t><br/>   Eisenbergwerk >> Eisenschmelze >> Eisenankauf<br/><br/><t font="PuristaBold" size="0.8">Relikte:</t><br/>   Fundstätte >> Reliktreinigung >> Museum<br/><br/><t font="PuristaBold" size="0.8">Diamanten:</t><br/>   Diamantenmine >> Diamantenschleifer >> Schmuckhändler<br/><br/><t font="PuristaBold" size="0.8">Benzin:</t><br/>   Ölfeld >> Ölraffinerie >> Benzinlager<br/><br/><t font="PuristaBold" size="0.8">Salz:</t><br/>   Salzsee >> Salzraffinerie >> Salzankauf<br/><br/><t font="PuristaBold" size="0.8">Zement:</t><br/>   Steinbruch >> Zementherstellung >> Baustoffhändler<br/><br/><t font="PuristaBold" size="0.8">Kohle:</t><br/>   Kohlemine >> Kohleveredlung >> Kohlekraftwerk<br/><br/><t font="PuristaBold" size="0.8">Silber:</t><br/>   Silbermine >> Silberschmelze >> Schmuckhändler<br/><br/><br/><t font="PuristaBold">Farmrouten mit anderen Hilfsgegenständen</t><br/><br/><t font="PuristaBold" size="0.8">Fisch: (Angel benötigt)</t><br/>   Fischgründe >> Markt<br/><br/><t font="PuristaBold" size="0.8">Fischkonserven: (Angel benötigt)</t><br/>   Fischgründe >> Fischfabrik >> Markt<br/>'];
			};
			case "7": {
				['Illegale Farmrouten','<t font="PuristaBold">Illegale Farmrouten (mit Hilfgegenstände benannt)</t><br/><br/><t font="PuristaBold" size="0.8">Heroin: (Kein Hilfsgegenstand benötigt)</t><br/>   Heroinplantage >> Heroinlabor >> Drogendealer<br/><br/><t font="PuristaBold" size="0.8">Cannabis: (Kein Hilfsgegenstand benötigt)</t><br/>   Hanfplantage >> Hanftrockner >> Drogendealer<br/><br/><t font="PuristaBold" size="0.8">Kokain: (Kein Hilfsgegenstand benötigt)</t><br/>   Kokainfeld >> Kokainextraktor >> Drogendealer<br/><br/><t font="PuristaBold" size="0.8">Pilze: (Kein Hilfsgegenstand benötigt)</t><br/>   Pilzvorkommen >> Pilztrockner >> Drogendealer<br/><br/><t font="PuristaBold" size="0.8">Moonshine: (Kein Hilfsgegenstand benötigt)</t><br/>   Gerstefeld + Maische Zutaten >> Destillierer (Mischverhätnis 1:1) >> Alkoholschmuggler<br/><br/><t font="PuristaBold" size="0.8">Schildkröten: (SDAR (Unterwasserwaffe) zum töten der Schildkröten)</t><br/>   Schildkrötenfanggebiet >> Fischfabrik >> Suppenküche<br/><br/><t font="PuristaBold" size="0.8">Uran: (Spitzhacke)</t><br/>   Uranbergwerk >> Uranganreicherung >> Illegaler Chemikalienhandel<br/>'];
			};
		};
		
		_header ctrlSetStructuredText parseText ("<t font='PuristaBold'>" + (_contenttext select 0) + "</t>");
		_ctrlgruppe ctrlSetStructuredText parseText (_contenttext select 1);
		_h = ctrlTextHeight _ctrlgruppe;
		_w = ((ctrlPosition _ctrlgruppe) select 2);
		_ctrlgruppe ctrlSetPosition [0, 0, _w, _h];
		_ctrlgruppe ctrlCommit 0;
	};
	
	case 2: {
		_return = "<t font='PuristaBold' underline='true'>Fahrzeugshops</t><br/><br/>";
		{
			_return = _return + format["<t font='PuristaBold'>%1:</t><br/>",getText(_x >> "title")];
			{
				_return = _return + format["   - %1 (Lagerplatz: %2 | Preis: %3$)<br/>",getText(configFile >> "CfgVehicles" >> (_x select 0) >> "Displayname"),[getNumber(missionConfigFile >> "LifeCfgVehicles" >> (_x select 0) >> "vItemSpace")] call life_fnc_numberText,[getNumber(missionConfigFile >> "LifeCfgVehicles" >> (_x select 0) >> "price_civ")] call life_fnc_numberText];
			}foreach getArray(_x >> "vehicles");
			_return = _return + "<br/>";
		}foreach ("true" configClasses (missionConfigFile >> "CarShops"));
		_return;
	};
	
	case 3: {
		_return = "<t font='PuristaBold' underline='true'>Lizenzpreise</t><br/><br/>";
		{
			_return = _return + format["%1 (Preis: %2)<br/>",localize getText(_x >> "displayName"),[getNumber(_x >> "price")]call life_fnc_numberText];
		}foreach ("true" configClasses (missionConfigFile >> "Licenses"));
		_return;
	};
};