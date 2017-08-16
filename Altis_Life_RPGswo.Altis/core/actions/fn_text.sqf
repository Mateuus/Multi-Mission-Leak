//hint "Du bist nicht im Naturschutzgebiet!";

private["_place","_title","_text","_textArray"];
_place = _this select 3;

_textArray = [];
_text = [];


switch (_place) do
{
	case "oel":  // Oel
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Ölroute!</t>"],
			format ["<t align='left'>Um mit Öl zu Handeln brauchst du eine Lizenz dazu. Diese Lizenz kannst du bei der Ölverarbeitung erwerben.</t>"],
			format ["<t align='left'>Dann fährst du zum Ölvorkommen, baust dort das rohe Öl ab und fährst damit zur Ölverarbeitung.</t>"],
			format ["<t align='left'>Wenn du damit fertig bist kommst du noch einmal zu mir und wir verhandeln dann über den Wert des verarbeiteten Öls.</t>"]
		];
	};

	case "metallhaendler":  // Metallhändler
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Metallhändler!</t>"],
			format ["<t align='left'>Bei diesem Händler kannst du die verschiedensten Metalle wie Kupfer, Gold, Platin und Silber verkaufen.</t>"],
			format ["<t align='left'>Um mit mir um die Preise zu verhandeln benötigst du die jeweilige Lizenz dazu. Diese erhälst du bei den jeweiligen Verarbeitungsstätten.</t>"],
			format ["<t align='left'>Also schnapp dir eine Spitzhacke und fang an. Wenn du fertig bist kommst du zu mir und ich sage dir wie viel die Rohstoffe Wert sind.</t>"]
		];
	};
	
	case "fruechte":   // Fruchtpressen
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Fruchtpresse</t>"],
			format ["<t align='left'>Hier kannst du aus Äpfeln und Pfirsichen Saft herstellen.</t>"],
			format ["<t align='left'>Den Apfel- oder Pirsichsaft kann du dann beim Supermarkt verkaufen</t>"]
		];
	};

	case "supermarkt":  // Supermarkt
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Supermarkt</t>"],
			format ["<t align='left'>Hier kannst du du dich mit Lebensmittel und anderen Gütern eindecken die man so für das Leben in Altis braucht.</t>"],
			format ["<t align='left'>Der Supermarkt nimmt auch Waren an. z.B. kannst du hier Äpfel und Pfirsiche sowie den daraus hergestellten Saft verkaufen</t>"],
			format ["<t align='left'>In den Städten Athira, Pyrgos und Sofia kannst du Spawnpässe für die jeweilige Stadt kaufen, damit du da Spawnen kannst.</t>"]
		];
	};
	
	case "fluglizenzen":  // Fluglizenzen
	{
        _text = [
			format ["<t align='left'>Es gibt verschiedene Fluglizenzen</t>"],
			format ["<t align='left'>Mit der Lizenz Zivilpilot kann man den M-900 und Hummingbird kaufen. Diese Lizenz erwirbst du bei der Lizenzbehörde.</t>"],
			format ["<t align='left'>Mit der Lizenz Gewerbepilot kann man alle legalen Helikopter bis auf M-900 und Hummingbird kaufen. Diese Lizenz erwirbst du ebenfalls bei der Lizenzbehörde.</t>"],
			format ["<t align='left'>Mit der Lizenz Kampfpilot kann man alle illegalen Helikopter kaufen. Diese Lizenz erhälst du im Rebellenshop.</t>"],
			format ["<t align='left'>Mit der Lizenz Jetpilot kann man alle Jets kaufen. Diese Lizenz musst du beim Jethändler kaufen.</t>"]
		];
	};
	
	case "Tankstelle":  // Tankstelle
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Tankstelle.</t>"],
			format ["<t align='left'>Hier kannst du du dich mit Lebensmittel und anderen Gütern eindecken die man so für das Leben in Altis braucht.</t>"],
			format ["<t align='left'>An der Tankstelle kannst du auch dein Auto mit einer Alarmanlage schützen. So hörst du jederzeit wenn jemand dann Fahrzeug klaut.</t>"],
			format ["<t align='left'>Außerdem kannst du eine Wegfahrsperre installieren, damit kann niemand der KEINEN Schlüssel hat, dass Fahrzeug fahren.</t>"],
			format ["<t align='left'>Der Tankwart lackiert auch gerne dein Fahrzeug um wenn dir deine alte Lackierung nicht mehr gefällt.</t>"],
			format ["<t align='left'>Seid vorsichtig, denn einige Tankstellen können ausgeraubt werden.</t>"],
			format ["<t align='left'>Es gibt eine Chance von 80%, dass der Stille Alarmausgelöst wird, und die Polizei benachrichtigt wird.</t>"]
		];
	};
	
	case "Anwalt":  // Anwalt
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Anwaltskanzlei.</t>"],
			format ["<t align='left'>Hier kannst du eine Anwaltslizenz und einen Anzug kaufen, damit du deine Mandate vertretten kannst</t>"],
			format ["<t align='left'>Du darfst als Anwalt nicht auf der Fahndungsliste stehen oder musst dich vorher bei der Polizei stellen.</t>"],
			format ["<t align='left'>Als Anwalt musst du einen Anwaltsanzug tragen, ansonsten wirst du nicht von der Polizei als Anwalt anerkannt.</t>"]
		];
	};

	case "kupfer":  // Kupferverarbeiter
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Kupferverarbeitung!</t>"],
			format ["<t align='left'>Für die Verarbeitung von Kupfer musst du als aller erstes Kupfererz in der Kupfermine abbauen.</t>"],
			format ["<t align='left'>Anschließend kannst du mit mir zusammen das Kupfer verarbeiten damit du es anschließend beim Metallhändler verkaufen kannst.</t>"],
			format ["<t align='left'>Also schnapp dir eine Spitzhacke und fang an die Erze ab zubauen. Anschließend helf ich dir bei der Verarbeitung.</t>"]
		];
	};
	
	case "eisen":  // Eisenverarbeiter
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Eisenverarbeitung!</t>"],
			format ["<t align='left'>Für die Verarbeitung von Eisen musst du als aller erstes Eisenerz in der Eisenmine abbauen.</t>"],
			format ["<t align='left'>Anschließend kannst du mit mir zusammen das Eisen verarbeiten damit du es anschließend beim Metallhändler verkaufen kannst.</t>"],
			format ["<t align='left'>Also schnapp dir eine Spitzhacke und fang an die Erze ab zubauen. Anschließend helf ich dir bei der Verarbeitung.</t>"]
		];
	};
	
	case "juwelier":  // Juwelier
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Juwelier!</t>"],
			format ["<t align='left'>Hier kannst du die beim Schmied hergestellten Ringe aus Silber und Gold verkaufen.</t>"],
			format ["<t align='left'>Dazu musst du erst die Silber und Golderze in der jeweiligen Mine abbauen. Anschließend fährst du zur jeweiligen Verarbeitung um die Rohstoffe zu verarbeiten.</t>"],
			format ["<t align='left'>Wenn du damit fertig bist fährst du zum Schmied lässt bei ihm die Ringe anfertigen.</t>"],
			format ["<t align='left'>Wenn du mit allem fertig bistbtreffen wir uns wieder hier und ich werde dir den Wert der Ringe dann auszahlen.</t>"],
			format ["<t align='left'>Außerdem kannst du hier die Perlenkette verkaufen, die du ebenfalls beim Schmied aus Perlen herstellen kannst, diese du am Muschelstand sammeln kannst.</t>"]
		];
	};

	case "kokain":  // Kokainverarbeitung
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Kokainverarbeitung!</t>"],
			format ["<t align='left'>Für die Verarbeitung von Kokain musst du erstmal die Kokainpflanzen sammeln und ernten.</t>"],
			format ["<t align='left'>Anschließend kommst du zu mir und ich verarbeite dir die gesammelten Kokainpflanzen damit du sie beim Drogengroßabnehmer verkaufen oder strecken lassen kannst.</t>"],
			format ["<t align='left'>Gib aber acht das du nicht von der Polizei erwischt wirst ansonsten wird es teuer für dich.</t>"]
		];
	};

	case "drogengros":  // Großabnehmer
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Drogengroßabnehmer.</t>"],
			format ["<t align='left'>Hier kannst Du alle Sorten von Drogen verkaufen.</t>"],
			format ["<t align='left'>Allerdings kannst Du hier auch Deine Drogen strecken lassen, um sie danach beim Dealer zu einem höheren Preis verkaufen zu können.</t>"],
			format ["<t align='left'>Allerdings benötigst Du zum Strecken eine Strecklizenz für jede Drogensorte, welche Dich 100.000€ kostet.</t>"]
		];
	};

	case "drogendealer":  // Drogendealer
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Drogendealer.</t>"],
			format ["<t align='left'>Bei mir kannst Du alle Drogensorten verkaufen. Allerdings müssen diese zuvor beim Drogen Großabnehmer gestreckt werden.</t>"],
			format ["<t align='left'>Gestreckte Drogen bringen Dir um einiges mehr Geld ein!</t>"],
			format ["<t align='left'>Gestrecktes Marijuana und Heroin kannst bei mir auch verarbeiten, damit du es beim Drogenkunden für mehr Geld verkaufen kannst.</t>"]
		];
	};
	
	case "drogenkunde":  // drogenkunde
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Drogenkunden.</t>"],
			format ["<t align='left'>Bei mir kannst Du Heroinspritzen und Joints verkaufen. Allerdings müssen diese zuvor beim Drogendealer hergestellt werden.</t>"],
			format ["<t align='left'>Dies bringt dir mehr Geld als Gestecktes Zeug!</t>"]
		];
	};

	case "gold":  // Goldverarbeitung
	{
        _text = [
			format ["<t align='left'>Du befindest Dich auf der Gold- und Ringeroute.</t>"],
			format ["<t align='left'>Baue mit einer Spitzhacke Gold an der Goldmine ab und bringe das Erz zum Goldverarbeiter. Danach kannst Du das Gold entweder direkt beim Metallhändler verkaufen.</t>"],
			format ["<t align='left'>Oder Gold und Silber im selben Verhältnis beim Schmied zu Ringe verarbeiten unm diese dann beim Juwelier zu verkaufen.</t>"]
		];
	};

	case "silber":  // Silberverarbeitung
	{
        _text = [
			format ["<t align='left'>Du befindest Dich auf der Silber- und Ringetour.</t>"],
			format ["<t align='left'>Baue mit einer Spitzhacke Silber an der Silbermine ab und bringe das Erz zum Silberverarbeiter. Danach kannst Du das Silber entweder direkt beim Metallhändler verkaufen.</t>"],
			format ["<t align='left'>Oder Gold und Silber im selben Verhältnis beim Schmied zu Ringe verarbeiten unm diese dann beim Juwelier zu verkaufen.</t>"]
		];
	};

	case "schmied":  // Schmiede
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Schmied..</t>"],
			format ["<t align='left'>Hier kannst Du das verarbeitete Gold und Silber zu Ringe vereinen lassen.</t>"],
			format ["<t align='left'>Aus Perlen bau ich dir eine wunderschöne Perlenkette.</t>"],
			format ["<t align='left'>Mit der Perlenkette oder den Ringen kannst Du dann zum Juwelier fahren und diese dort zu verkaufen.</t>"]
		];
	};

	case "canabis":  // Canabisverarbeitung
	{
        _text = [
			format ["<t align='left'>Du befindest Dich bei der Canabisverarbeitung.</t>"],
			format ["<t align='left'>Baue am Canabisfeld Canabisblätter ab und bringe diese zur Canabisverarbeitung.</t>"],
			format ["<t align='left'>Nachdem Du das Canabis bei mir verarbeitet lassen hast, kannst Du es entweder beim Großabnehmer direkt verkaufen oder es dort strecken lassen, um es dann beim Dealer zu höheren Preisen verkaufen zu können.</t>"]
		];
	};

	case "wong":  // WongCity
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Wong City Wok.</t>"],
			format ["<t align='left'>Hier kannst Du Schildkröten, Froschschenkel, Froschsuppe, Hundefleisch, Schlangengift und Schwarzgebrannten verkaufen.</t>"],
			format ["<t align='left'>Um Schildkröten verkaufen zu können, musst Du mit einem Boot, Taucherausrüstung und einer SDAR mit Unterwassermunition ins Naturschutzgebiet fahren und dort Schildkröten sammeln. Bringe diese dann direkt zu mir.</t>"]
		];
	};

	case "diamant":  // Diamantverarbeitung
	{
        _text = [
			format ["<t align='left'>Du befindest Dich auf der Diamant-Route.</t>"],
			format ["<t align='left'>Baue mit der Spitzhacke Diamanten in der Diamantmine ab und bringe es zur Diamantverarbeitung. Danach kannst du die geschliffenen Diamanten beim Diamanthändler verkaufen</t>"]
		];
	};

	case "meth":  // Methtour
	{
        _text = [
			format ["<t align='left'>Du befindest Dich auf der Methtour.</t>"],
			format ["<t align='left'>Sammle an Dr. Breaking Bad`s Labor Meth und bringe das unfertige Meth zuerst zu Walter White und danach zu Jesse Pinkmann.</t>"],
			format ["<t align='left'>Das fertige Methamphetamin kannst Du entweder beim Drogen Großabnehmer direkt verkaufen oder es strecken lassen, um es dann beim Dealer zu höhren Preisen zu verkaufen.</t>"]
		];
	};

	case "dmt":  // DMT-Tour
	{
        _text = [
			format ["<t align='left'>Du befindest Dich auf der DMT-Tour.</t>"],
			format ["<t align='left'>Sammle am Sumpf Aga Kröten und bringe diese zuerst zum Tierqäuler und danach zum DMT-Extrahierer.</t>"],
			format ["<t align='left'>Das fertige DMT kannst Du entweder beim Drogen Großabnehmer direkt verkaufen oder es strecken lassen, um es dann beim Dealer zu höhren Preisen zu verkaufen.</t>"]
		];
	};

	case "heroin":  // Heroinverarbeiter
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Heroinverarbeiter.</t>"],
			format ["<t align='left'>Sammle am Heroinfeld unreines Heroin und bringe es zum Heroinverarbeiter.</t>"],
			format ["<t align='left'>Das reine Heroin kannst Du entweder beim Drogen Großabnehmer direkt verkaufen oder es strecken lassen, um es dann beim Dealer zu höhren Preisen zu verkaufen.</t>"]
		];
	};

	case "zaupilz":  // Zauberpilze
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Zauberpilzverarbeiter.</t>"],
			format ["<t align='left'>Sammle am Zauberpilzwald Zauberpilze und bringe diese zum Zauberpilzverarbeiter.</t>"],
			format ["<t align='left'>Die fertigen Zauberpilze kannst Du entweder beim Drogen Großabnehmer direkt verkaufen oder es strecken lassen, um es dann beim Dealer zu höhren Preisen zu verkaufen.</t>"]
		];
	};

	case "schenkel":  // Schenkel
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Schenkelreißer.</t>"],
			format ["<t align='left'>Sammle am Sumpf Aga Gröten und bringe diese zum Schenkelreißer.</t>"],
			format ["<t align='left'>Danach kannst Du die verarbeiteten Forschschenkel beim Wong City Wok verkaufen.</t>"]
		];
	};

	case "schwarzbrenner":  // Schwarzbrenner
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Schwarzbrenner.</t>"],
			format ["<t align='left'>Sammle am Traubenfeld reife Trauben und bringe diese zum Schwarzbrenner.</t>"],
			format ["<t align='left'>Danach kannst Du den Schwarzgebrannten beim Wong City Wok verkaufen.</t>"]
		];
	};

	case "froschsuppe":  // Froschsuppe
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Küchenchef.</t>"],
			format ["<t align='left'>Sammle am Sumpf Aga Kröten und bringe diese zum Küchenchef.</t>"],
			format ["<t align='left'>Danach kannst Du die Froschsuppe beim Wong City Wok verkaufen.</t>"]
		];
	};

	case "zement":  // Zementhändler
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Zementhändler.</t>"],
			format ["<t align='left'>Baue mit einer Spitzhacke Steine am Steinbruch ab und bringe diese dann zum Steinverarbeiter</t>"],
			format ["<t align='left'>Das fertige Zement kannst Du nun beim Zementhändler verkaufen.</t>"]
		];
	};

	case "stein":  // Steinverarbeiter
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Steinverarbeiter.</t>"],
			format ["<t align='left'>Baue mit einer Spitzhacke Steine am Steinbruch ab und bringe diese dann zum Steinverarbeiter</t>"],
			format ["<t align='left'>Das fertige Zement kannst Du nun beim Zementhändler verkaufen.</t>"]
		];
	};

	case "pfeffer":  // Pfefferverarbeitung
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Pfefferverarbeiter.</t>"],
			format ["<t align='left'>Sammle am Pfefferfeld Pfeffer und bringe es zur Pfefferverarbeitung.</t>"],
			format ["<t align='left'>Den feinen Pfeffer kannst Du nun beim Gewürzhändler verkaufen.</t>"]
		];
	};


	case "salz":  // Salzverarbeitung
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Salzverarbeiter.</t>"],
			format ["<t align='left'>Baue an der Salzmine Salz mit einer Spitzhacke ab und bringe es zum Salzverarbeiter.</t>"],
			format ["<t align='left'>Das feine Salz kannst Du nun beim Gewürzhändler verkaufen.</t>"]
		];
	};


	case "gewuerz":  // Gewürzhändler
	{
        _text = [
			format ["<t align='left'>Du befindest Dich beim Gewürzhändler.</t>"],
			format ["<t align='left'>Beim Gewürzhändler kannst Du Pfeffer, Salz, Curry und Zimt verkaufen.</t>"],
			format ["<t align='left'>Salz kannst Du bei der Salzmine mit einer Spitzhacke abbauen. Bringe es danach zum Salzverarbeiter</t>"],
			format ["<t align='left'>Pfeffer kannst Du im Pfefferfeld abbauen. Bringe es danach zum Pfefferverarbeiter.</t>"],
			format ["<t align='left'>Curry kannst Du auf dem Currykrautfeld abbauen. Bringe es danach zum Curryverarbeiter.</t>"],
			format ["<t align='left'>Zimt kannst Du auf dem Zimtfeld abbauen. Bringe es danach zum Zimtverarbeiter.</t>"]
		];
	};

	case "pilzsuppe":  // Pilzsuppe
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Pilzsuppenverarbeitung.</t>"],
			format ["<t align='left'>Sammle im Pilzwald Pilze und bringe diese zum Pilzsuppenverarbeiter.</t>"],
			format ["<t align='left'>Die fertigen Pilzsuppen können nun beim Pilzsuppenhändler verkauft werden.</t>"]
		];
	};
	
	case "organ":  // Organe
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei beim Organhändler.</t>"],
			format ["<t align='left'>Kaufe ein Skalpell, schlage jemanden nieder und entnehme Ihn eine Niere.</t>"],
			format ["<t align='left'>Die entnommenen Nieren kannst du dann hier bei mir für gutes Geld Verkaufen.</t>"],
			format ["<t align='left'>Sollte dir eine Niere fehlen, kannst du bei mir auch eine Niere kaufen und diese bei dir wieder einsetzten, damit es dir wieder gut geht.</t>"]
		];
	};
	
	case "bankgold":  // bankgold
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei beim Bank Gold Käufer.</t>"],
			format ["<t align='left'>Bei mir kannst du das Bank Gold verkaufen, welches du aus deinem Bankraub erbeutet hast.</t>"]
		];
	};
	
	case "uranium":  // uranium
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Uraniumverarbeitung.</t>"],
			format ["<t align='left'>Ich empfehle dir einen Anti-Strahlen-Anzug beim Uranium-Shop zu kaufen.</t>"],
			format ["<t align='left'>Sammle beim Radioaktiven Abfall Uraniummüll und bringe diesen zur Uraniumfilterung.</t>"],
			format ["<t align='left'>Kaufe Uraniumfilter im Rebellenshop und gehe zusammen mit dem Roh-Uranium zur Uraniumreinigung.Pro Roh-Uranium benötigst du einen Filter, besorge dir also genügend Filter.</t>"],
			format ["<t align='left'>Das Gereinigte Uranium muss dann zur Uraniumtrennung gebracht werden.</t>"],
			format ["<t align='left'>Das Uranium Konzentrat bringst du dann zur Uraniumtrocknung.</t>"],
			format ["<t align='left'>Das fertige Uranium muss nun zum Uranium-Shop gebracht und verkauft werden.</t>"]
		];
	};
	
	case "dhl":  // dhl
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei einer Lieferstelle.</t>"],
			format ["<t align='left'>Du kannst bei den verschiedenen Lieferstellen Pakete abholen.</t>"],
			format ["<t align='left'>Diese Pakete bringst du dann zu der vorgegebenen DHL Station.</t>"],
			format ["<t align='left'>Durch die Übergabe des Paketes bekommst du eine Summe Bar auf die Hand ausgezahlt.</t>"]
		];
	};
	
	case "schrottplatz":  // fahrzeugschieber
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei einem Schrottpaltz.</t>"],
			format ["<t align='left'>Dir wurde dein Fahrzeug geklaut oder es wurde zerstört?</t>"],
			format ["<t align='left'>Kein Problem komm innerhalb von 24 Stunden zu mir.</t>"],
			format ["<t align='left'>Gegen einen Aufpreis verkaufe ich dir dein Fahrzeug repariert zurück.</t>"]
		];
	};
	
	case "fahrzeugschieber":  // fahrzeugschieber
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei einem Fahrzeugschieber.</t>"],
			format ["<t align='left'>Du hast ein Auto geklaut und weißt nicht was du damit machen sollst?.</t>"],
			format ["<t align='left'>Bringe das Fahrzeug zu mir und ich kaufe es dir ab.</t>"],
			format ["<t align='left'>Ich zahle dir das Geld direkt Bar auf die Hand aus.</t>"],
			format ["<t align='left'>Je nach Fahrzeug und Zustand bekommst du mehr oder weniger Geld.</t>"],
			format ["<t align='left'>Zivilisten Fahrzeuge kaufe ich erst, wenn der Verkaufspreis über 200.000€ ist.</t>"],
			format ["<t align='left'>Ich kaufe keine Feuerwehr Fahrzeuge aber alle Polizei Fahrzeuge.</t>"],
			format ["<t align='left'>Dir wurde dein Fahrzeug geklaut oder es wurde zerstört?</t>"],
			format ["<t align='left'>Kein Problem fahr innerhalb von 24 Stunden zu meinem Freunden vom Schrottplatz.</t>"]
		];
	};
	
	case "fahrzeughaendler":  // fahrzeughaendler
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei einem Fahrzeughändler.</t>"],
			format ["<t align='left'>Für den Autokauf musst du zuerst einen Führerschein bei der Lizenzbehörde kaufen.</t>"],
			format ["<t align='left'>Anschließend kommst du zu mir und kannst dir ein Fahrzeug nach Wahl zulegen.</t>"],
			format ["<t align='left'>Die Fahrzeuge kannst du sowohl mieten als auch kaufen.</t>"]
	    ];
	};
	
	case "lkwhaendler":  // lkwhaendler
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei einem LKW Händler.</t>"],
			format ["<t align='left'>Für den Kauf eines LKWs benötigst du einen LKW Führerschein.</t>"],
			format ["<t align='left'>Den LKW Führerschein bekommst du bei der Lizenzbehörde.</t>"],
			format ["<t align='left'>Anschließend kommst du zu mir und kannst dir einen LKW nach Wahl zulegen.</t>"],
			format ["<t align='left'>Alle LKWs kannst du sowohl kaufen als auch mieten.</t>"]
	    ];
	};
	
	case "waffenfabrik":  // waffenfabrik
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Waffenfabrik.</t>"],
			format ["<t align='left'>Hier kannst du dir deine Waffen selbst bauen.</t>"],
			format ["<t align='left'>Wenn du wissen möchtest was du für die Waffen benötigst, kannst du mich jederzeit fragen.</t>"],
			format ["<t align='left'>Wenn du alle Materialien gesammelt hast kommst du wieder her und ich helfe dir beim Bau deiner Waffe.</t>"],
			format ["<t align='left'>Ich helfe dir natürlich auch beim Bau von Häuserkisten damit du deine Waffen in deinem Haus lagern kannst.</t>"],
			format ["<t align='left'>Apex Gegenstände funktionieren einwandfrei nur mit dem Apex DLC.</t>"]
		];
	};
	
	case "paintball":  // paintball arena
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Paintball Arena.</t>"],
			format ["<t align='left'>Gegen eine kleine Geld Summe kannst du die Lobby betreten.</t>"],
			format ["<t align='left'>In der Lobby angekommen kannst, du ebenfalls gegen eine kleine Geldsumme, dem Team deiner Wahl beitreten.</t>"],
			format ["<t align='left'>Wenn du in der Arena angekommen bist kann es auch schon los gehen.</t>"],
			format ["<t align='left'>Sobald du 5 mal von einem Gegner getroffen wurdest bist du wieder in der Lobby.</t>"]
		];
	};
	
	case "glas":  // glashaendler
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Glashändler.</t>"],
			format ["<t align='left'>Wenn du Sand verarbeitet hast, kannst du zu mir kommen und ich kaufe dir das fertige Glas dann ab.</t>"],
			format ["<t align='left'>Den Wert des Glases zahle ich dir direkt auf die Hand aus.</t>"],
			format ["<t align='left'>Du solltest dir natürlich vorher eine Lizenz zulegen das du auch befugt bist mit Glas zu handeln.</t>"],
			format ["<t align='left'>Diese Lizenz kannst du beim Sandverarbeiter erwerben.</t>"]
		];
	};
	
	case "garage":  // garage
	{
        _text = [
			format ["<t align='left'>Du befindest dich an deiner Garage.</t>"],
			format ["<t align='left'>Hier kannst du deine Fahrzeuge ein und auch wieder ausparken.</t>"],
			format ["<t align='left'>Deine Helikopter hingegen musst du an der Helikopter Garage am Flugfeld ein und ausparken.</t>"],
			format ["<t align='left'>Jedes Fahrzeug was du ausparkst zieht dir eine kleine Geldsumme, als Ausparkgebühr, von deinem Konto ab.</t>"]
		];
	};
	
		case "casino":  // casino
	{
        _text = [
			format ["<t align='left'>Du befindest dich im Casino.</t>"],
			format ["<t align='left'>Hier kannst du sowohl Blackjack als auch Slotmaschine spielen.</t>"],
			format ["<t align='left'>Je nachdem wie viel Geld du setzt ist der mögliche Gewinn höher oder niedriger.</t>"],
			format ["<t align='left'>Im Casion findest du einen Geldautomaten und kannst dir auch etwas zu essen und zu trinken kaufen.</t>"],
			format ["<t align='left'>Möge das Glück mit dir sein.</t>"]
		];
	};
	
	case "rebellenshop":  // rebellenshop
	{
        _text = [
			format ["<t align='left'>Du befindest dich am Rebellenshop.</t>"],
			format ["<t align='left'>Hier kannst du mit der Rebellenlizenz schwerere Waffen erwerben sowie erweitertes Equip.</t>"],
			format ["<t align='left'>Du solltest allerdings bedenken, dass die Waffen und das Equip zum größen Teil illegal sind.</t>"],
			format ["<t align='left'>Mit der Rebellenlizenz kannst du natürlich auch unsere Rebellenfahrzeuge erwerben, diese besorgst du dir bei meinem Kollegen neben an.</t>"],
			format ["<t align='left'>Übrigens du findest irgendwo auf der Karte einen Freund von mir, der verkauft dir einen Spawnpass für das Rebellen HQ. Du kannst ihn überall finden nur nicht auf Straßen und im Wasser.</t>"]
		];
	};
	
	case "kart":  // kartbahn
	{
        _text = [
			format ["<t align='left'>Du befindest dich an der Kartbahn.</t>"],
			format ["<t align='left'>Hier kannst du mit deinen Freunden ein kleines Rennen veranstalten.</t>"],
			format ["<t align='left'>Du solltest allerdings bedenken, dass die Karts auf der Strecke bleiben müssen, da es sonst für dich Konsequenzen für dich haben wird.</t>"],
			format ["<t align='left'>Sollten wir dich mit einem Kart im öffentlichen Straßenverkehr erwischen wirst du mit einem Kick oder Bann bestraft.</t>"],
			format ["<t align='left'>Und nun auf die Strecke, fertig, los.</t>"]
		];
	};
	
	case "boot":  // boothändler
	{
        _text = [
			format ["<t align='left'>Du befindest dich am Bootshädnler.</t>"],
			format ["<t align='left'>Hier kannst du die neusten Boote kaufen oder mieten.</t>"],
			format ["<t align='left'>Um bei mir ein Boot zu erwerben benötigst du allerdings einen Bootsschein den du in der Lizenzbehörde beantragen musst.</t>"],
			format ["<t align='left'>Wenn du dein Boot hast, kannst du damit zum Beispiel Fische fangen.</t>"],
			format ["<t align='left'>Am besten du probierst es gleich aus, kaufe dir noch heute dein eigenes Boot.</t>"]
		];
	};
	
	case "verwahrstelle":  // verwahrstelle
	{
        _text = [
			format ["<t align='left'>Du befindest dich an der Verwahrstelle.</t>"],
			format ["<t align='left'>Wenn die Polizei eines deiner Fahrzeuge beschlagnahmt hat, findest du es hier wieder.</t>"],
			format ["<t align='left'>Du kannst dann dein beschlagnahmtes Fahrzeug hier gegen eine Geldsumme auslösen.</t>"],
			format ["<t align='left'>Diese Geldsumme ist von Fahrzeug zu Fahrzeug unterschiedlich.</t>"],
			format ["<t align='left'>Wenn ein Fahrzeug innerhalb von sieben Tagen nicht abgeholt wird, verkauf iche s nach Russland.</t>"],
			format ["<t align='left'>Am besten du lässt dein Fahrzeug nicht von der Polizei beschlagnahem, damit kannst du eine menge Geld sparen.</t>"]
		];
	};
	
	case "bankfilliale":  // bankfilliale
	{
        _text = [
			format ["<t align='left'>Du befindest dich in einer Bankfilliale.</t>"],
			format ["<t align='left'>Du kannst mit 3 Kollegen von dir die Bankfilliale auch ausrauben.</t>"],
			format ["<t align='left'>Alles was du dafür benötigst ist mindestens eine Person mit einer Waffe und 2 weitere Personen die in der Nähe stehen.</t>"],
			format ["<t align='left'>Versuche dein Glück bei dem Raub, du solltest allerdings mit Gegenwehr der Polizei rechnen.</t>"]
		];
	};
	
	case "helistation":  // helistation
	{
        _text = [
			format ["<t align='left'>Du befindest dich an der Servicestation für Helikopter.</t>"],
			format ["<t align='left'>Hier kannst du deinen Helikopter sowohl betanken als auch reparieren.</t>"],
			format ["<t align='left'>Den Service den du hier erhälst bekommst du natürlich nicht um sonst, eine kleine Geldsumme musst du zahlen.</t>"],
			format ["<t align='left'>Aber diese Geldsumme zahlt sich aus. Wir bringen deinen Helikopter wieder auf Vordermann so das er wieder funktioniert als wäre er neu.</t>"],
			format ["<t align='left'>Du glaubst mir das nicht ? Probiere es selbst aus und überzeuge dich von dem Ergebniss.</t>"]
		];
	};
	
	case "waffenshop":  // waffenshop
	{
        _text = [
			format ["<t align='left'>Du befindest dich im Waffenladen.</t>"],
			format ["<t align='left'>Hier kannst du mit einer Schusswaffenlizenz Handfeuerwaffen und ein SMG erwerben.</t>"],
			format ["<t align='left'>Die Waffen die du von mir bekommst sind mit der Schusswaffenlizenz legal und können dir nur bei einer Straftat von der Polizei abgenommen werden.</t>"],
			format ["<t align='left'>Mit diesen Waffen kannst du dich zu mindest ein wenig vor einem Überfall retten.</t>"],
			format ["<t align='left'>Die passende Munition bekommst du selbstverständlich auch von mir.</t>"],
			format ["<t align='left'>Also kaufe dir jetzt eine Waffe und du wirst merken das du damit sicherer Unterwegs bist als ohne Waffe.</t>"]
		];
	};
	
	case "tauchshop":  // tauchershop
	{
        _text = [
			format ["<t align='left'>Du befindest dich im Tauchergeschäft.</t>"],
			format ["<t align='left'>Hier kannst du dir deine eigene Taucherausrüstung zusammenstellen und kaufen.</t>"],
			format ["<t align='left'>Mithilfe der Taucherausrüstung kannst auf die Suche nach Schildkröten und anderen Meeresbewohnern gehen.</t>"],
			format ["<t align='left'>Allerdings um Schildkröten zu sehen solltest du mal bei einem Bekannten von mir vorbei sehen, der kann dir für wenig Geld ein Boot anbieten dann brauchst du nicht so weit schwimmen.</t>"],
			format ["<t align='left'>Ich würde mich freuen, wenn wir uns mal auf eine Tauchtour treffen könnten.</t>"]
		];
	};
	
	case "brooker":  // brooker
	{
        _text = [
			format ["<t align='left'>Hallo ich bin einer der Brooker hier auf der Insel.</t>"],
			format ["<t align='left'>Ich kann dir Auskunft über die Marktpreise von jedem Rohstoff auf dieser Insel geben.</t>"],
			format ["<t align='left'>Du musst mir nur sagen für welches Material du dich interessierst und ich gebe dir alle nötigen Informationen dafür.</t>"],
			format ["<t align='left'>Also schnapp dir dein Fahrzeug und leg los, ich helfe dir mit Sicherheit bei der Wahl was du als nächstes Farmen möchtest.</t>"]
		];
	};
	
	case "knastnpc":  // knastnpc
	{
        _text = [
			format ["<t align='left'>Was hast du denn angestellt das du jetzt bei mir im Knast gelandet bist ?.</t>"],
			format ["<t align='left'>Ich bin der Gefängnisswärter und Versorge dich während deines Aufenthalts bei uns mit Essen und Trinken.</t>"],
			format ["<t align='left'>Wenn dir langweilig ist, kannst du dich auf unseren Multifunktionsplatz ein wenig auspowern.</t>"],
			format ["<t align='left'>Ich wünsche dir noch einen angenehmen Aufenthalt und hoffe das du aus deinen Fehlern lernst.</t>"]
		];
	};
	
	case "bekleidungsgeschaeft":  // bekleidungsgeschaeft
	{
        _text = [
			format ["<t align='left'>Herzlich Willkommen in unserem Bekleidungsgeschäft.</t>"],
			format ["<t align='left'>Hier kannst du dich neu einkleiden.</t>"],
			format ["<t align='left'>Wir bieten alles an was du benötigst wie Hosen, T-Shirts und vielen anderen Artikel aus unserer Sommer Mode.</t>"],
			format ["<t align='left'>Guck dich ruhig ein wenig um. Ich bin mir sicher du wirst etwas finden was dir gefällt.</t>"]
		];
	};
	
	case "gemischtwaren":  // gemischtwaren
	{
        _text = [
			format ["<t align='left'>Herzlich Willkommen im Gemischtwarenladen.</t>"],
			format ["<t align='left'>Hier findest du alles was du im Alltag benötigen kannst.</t>"],
			format ["<t align='left'>Wir bieten dir nicht nur Nachtsichtgeräte und Werkzeugkästen sondern auch viele andere Gegenstände für einen fairen Preis.</t>"],
			format ["<t align='left'>Schau dich ruhig etwas um ich bin mir sicher du wirst etwas finden was du früher oder später mal gebrauchen wirst.</t>"]
		];
	};
	
	case "lizenzbehoerde":  // lizenzbehörde
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Lizenzbehörde.</t>"],
			format ["<t align='left'>Hier kannst du einige Lizenzen beantragen.</t>"],
			format ["<t align='left'>Die Lizenzen brauchst du um dir ein Fahrzeug zu kaufen.</t>"],
			format ["<t align='left'>Such dir die Lizenz aus die du benötigst und ich erledige den Rest.</t>"]
		];
	};
	
	case "arzt":  // arzt
	{
        _text = [
			format ["<t align='left'>Guten Tag ich bin der Arzt.</t>"],
			format ["<t align='left'>Ich helfe dir wenn du dich verletzt hast.</t>"],
			format ["<t align='left'>Ich helfe dir bei jeder Verletzung die du nicht selbst behandeln kannst, allerdings kostet dich das 100€ da die Versicherungen die Behandlungen bei mir nicht zahlen.</t>"],
			format ["<t align='left'>Du kannst mit jeder Verletzung zu mir kommen, ich helfe dir jederzeit.</t>"]
		];
	};
	
	case "gangversteck":  // gangversteck
	{
        _text = [
			format ["<t align='left'>Du befindest dich im Gangversteck.</t>"],
			format ["<t align='left'>Du kannst mit deiner Gang dieses Gangversteck jederzeit einnehmen, ihr müsst einfach nur zum Fahnenmast gehen und eure Gangflagge hochziehen.</t>"],
			format ["<t align='left'>In dem Gangversteck könnt ihr sowohl Equipment kaufen als auch die Beteubungsmittel Kokain, Heroin und Cannabis verarbeiten.</t>"],
			format ["<t align='left'>Schaut euch ein wenig in eurem neuen Versteck um.</t>"]
		];
	};
	
	case "vip":  // vip
	{
        _text = [
			format ["<t align='left'>Du befindest dich am Donatorshop.</t>"],
			format ["<t align='left'>Hier hast du mit dem Donatorstatus 50% Rabatt auf alle Zivilisten Fahrzeuge und eine größere Auswahl an Waffen.</t>"],
			format ["<t align='left'>Diesen Status kann man nicht mehr erwerben, da die Richtlinien von BI dies nicht zulassen.</t>"],
			format ["<t align='left'>Im Forum findest du Informationen zum neuen VIP System</t>"],
			format ["<t align='left'>Wir freuen uns sehr über deine Spende.</t>"]
		];
	};
	
	case "deaktiviert":  // deaktiviert
	{
        _text = [
			format ["<t align='left'>Ich bin auf unbestimmte Zeit deaktiviert.</t>"]
		];
	};

	case "muschel":  // muscheln
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Perlenkettenroute!</t>"],
			format ["<t align='left'>Für die Verarbeitung von Perlenketten musst du als aller erstes Muscheln am Muschelstrand sammeln.</t>"],
			format ["<t align='left'>Anschließend kannst du beim Muschelknacker die Muscheln aufbrechen lassen.</t>"],
			format ["<t align='left'>Wenn du die Perlen hast, kannst du beim Schmied eine Perlenkette herstellen lassen und diese beim Juwelier verkaufen.</t>"]
		];
	};
	
	case "curry":  // curry
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Curryroute!</t>"],
			format ["<t align='left'>Das Currykraut kannst du auf dem Currykrautfeld gesammelt.</t>"],
			format ["<t align='left'>Bei der Curry verarbeitung kannst du aus dem Kraut Currypulver herstellen.</t>"],
			format ["<t align='left'>Anschließend wartet der Gewürzhändler auf dich und kauft dir mit vergnügen das Curry ab.</t>"]
		];
	};
	
	case "zimt":  // zimt
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Zimtroute!</t>"],
			format ["<t align='left'>Zimtstangen kannst du auf dem Zimtfeld gesammelt.</t>"],
			format ["<t align='left'>Bei der Zimt verarbeitung kannst du aus den Stangen Zimtpulver herstellen.</t>"],
			format ["<t align='left'>Anschließend wartet der Gewürzhändler auf dich und kauft dir mit vergnügen das Zimt ab.</t>"]
		];
	};
	
	case "gemuese":  // Gemüsehändler
	{
        _text = [
			format ["<t align='left'>Du befindest Dich auf der Gemüseroute.</t>"],
			format ["<t align='left'>Beim Gemüsehändler kannst Du Kartoffeln und Salatlöpfe verkaufen.</t>"],
			format ["<t align='left'>Kartoffeln kannst Du auf dem Kartoffelfeld sammeln. Bringe diese danach zum Gemüsereiniger</t>"],
			format ["<t align='left'>Salat kannst Du auf dem Salatfeld sammeln. Bringe diesen danach zum Gemüsereiniger</t>"],
			format ["<t align='left'>Statt die Kartoffeln beim Gemüsehändler zu verkaufen, kannst du diese beim Gemüseverarbeiter zu Pommes verarbeiten.</t>"],
			format ["<t align='left'>Statt den Salatkopf beim Gemüsehändler zu verkaufen, kannst du diesen beim Gemüseverarbeiter zu Salatbätter verarbeiten.</t>"],
			format ["<t align='left'>Salatblätter und Pommes kannst du dann im Imbiss für gutes Geld verkaufen.</t>"]
		];
	};
	
	case "adventslose":  // adventslose
	{
        _text = [
			format ["<t align='left'>Bei mir kannst du Weihnachtslose kaufen.</t>"],
			format ["<t align='left'>Du kannst dir täglich eine beliebige Zahl an Losen kaufen.</t>"],
			format ["<t align='left'>Je mehr Lose von dir im Topf sind, desto höher ist deine Gewinnchance.</t>"],
			format ["<t align='left'>Ich ziehe täglich 23:59 Uhr blind ein Los aus der Trommel.</t>"],
			format ["<t align='left'>Der Gewinner wird aum darauffolgenden Tag im Forum bekannt gegeben.</t>"],
			format ["<t align='left'>Mit etwas glück kannst du einen der tollen Preis gewinnen.</t>"],
			format ["<t align='left'>Zu gewinnen gibt unter anderem:</t>"],
			format ["<t align='left'>jede Menge Geld, Fahrzeuge und vieles Mehr! </t>"],
			format ["<t align='left'>An manchen Tagen gibt es auch spezielle Überraschungen.</t>"]
		];
	};
	
	case "krokoinfo":  // Brutstätte
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Krokodilbabys.</t>"],
			format ["<t align='left'>Sammle Krokodileier und brüte diese bei der Brutstätte aus.</t>"],
			format ["<t align='left'>Die geschlüpften Krokodilbabys kannst du dann auf dem Schwarzmarkt verkaufen.</t>"],
			format ["<t align='left'>Anstatt die Krokodilbabys direkt auf dem Schwarzmarkt zu verkaufen, kannst du diese auch zum Häuter bringen und das gewonnene Krokodilleder beim Tiermode Händler für mehr Geld verkaufen.</t>"]
		];
	};
	
	case "kriegsschrottinfo":  // Kriegswaffen
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Kriegswaffen.</t>"],
			format ["<t align='left'>Sammle in der alten Bunkeranlage alte Waffen und bringe diese zur Waffenreinigung.</t>"],
			format ["<t align='left'>Der Antiquitätenhändler freut sich dann über deiner gereinigten Kriegswaffen.</t>"],
			format ["<t align='left'>Wenn du die gereinigten Kriegswaffen für noch mehr Geld verkaufen willst, kannst du sie beim Antiquitätenhändler verpacken und beim nächsten Warenschieber verkaufen gehen.</t>"]
		];
	};
	
	case "anakondainfo":  // Schlangenhaut
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für für Schlangenhäute.</t>"],
			format ["<t align='left'>Sammle im Schlangensumpf Anakondas und bringe diese zum Häuter.</t>"],
			format ["<t align='left'>Die abgezogenen Häute können dann auf dem Schwarzmarkt verkauft werden.</t>"],
			format ["<t align='left'>Um noch mehr Geld zu bekommen, kannst du die Häute auch auf dem Schwarzmarkt zu Schlangenhauttaschen verarbeiten und beim Tiermode Händler verkaufen.</t>"]
		];
	};
	
	case "lehminfo":  // Ziegel
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Ziegel.</t>"],
			format ["<t align='left'>Hole frischen Lehm aus der Lehmgrube mit deiner Spitzhacke und brenne diesen in der Ziegelbrennerei zu Ziegeln.</t>"],
			format ["<t align='left'>Die fertigen Ziegel können daraufhin beim Baustoffhändler verkauft werden.</t>"]
		];
	};
	
	case "kautschukinfo":  // gummi
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Gummi.</t>"],
			format ["<t align='left'>Ernte Kautschuk bei den Kautschukbäumen und verarbeite diesen in der Gummiverarbeitung zu Gummi.</t>"],
			format ["<t align='left'>Das Gummi kann dann beim Gummihändler verkauft werden.</t>"],
			format ["<t align='left'>Alternativ kannst du auch jeweils einmal Gummi und einmal eine Platinfelge beim Reifenhersteller zu Reifen verarbeiten und beim Reifenhändler bei der Rennstrecke verkaufen.</t>"]
		];
	};
	
	case "tropenholzinfo":  // Bauholz
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Bauholz.</t>"],
			format ["<t align='left'>Hacke Holz im Tropenwald mit der Spitzhacke und verarbeite es im Sägewerk zu stabilen Bauholz.</t>"],
			format ["<t align='left'>Dein fertiges Bauholz kauft dir dann der Baustoffhändler ab.</t>"]
		];
	};
	
	case "kakaoinfo":  // Kakao
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Kakaopulver.</t>"],
			format ["<t align='left'>Sammle Kakaoschoten auf dem Kakaofeld und verarbeite diese in der Kakaoverarbeitung.</t>"],
			format ["<t align='left'>Das Kakaopulver kauft dir dann der Sammelverkäufer ab.</t>"],
			format ["<t align='left'>Alternativ kannst du auch jeweils einmal Zucker und einmal fertiges Kakaopulver beim Schokoladenmacher zu Schokolade verarbeiten und beim Sammelverkäufer verkaufen.</t>"]
		];
	};
	
	case "tabakinfo":  // Tabak
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Tabak.</t>"],
			format ["<t align='left'>Sammle Tabak auf dem Tabakfeld und trockne diesen in der Tabaktrocknung.</t>"],
			format ["<t align='left'>Den getrockneten Tabak kannst du dann im nächsten Tabakshop verkaufen.</t>"]
		];
	};
	
	case "magmainfo":  // geschliffener Obsidian
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Obsidian.</t>"],
			format ["<t align='left'>Sammle Obsidian im Vulkan mit der Spitzhacke und schleife ihn beim Schleifer.</t>"],
			format ["<t align='left'>Der Steinhauer kauft dir den geschliffenen Obsidian gerne für seine neuen Kunstwerke ab.</t>"]
		];
	};
	
	case "schlafmohninfo":  // Opium
	{    
    _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Opium.</t>"],
			format ["<t align='left'>Sammle Schlafmohn und verarbeite dieses bei der Opiumherstellung zu hochwertigen Opium.</t>"],
			format ["<t align='left'>Das fertige Opium kannst du auf dem Schwarzmarkt für gutes Geld verkaufen gehen.</t>"],
			format ["<t align='left'>Wenn du das Opium auf dem Schwarzmarkt streckst, wirst du es beim Warenschieber sogar für noch mehr Geld verkaufen können.</t>"]
		];
	};
	
	case "zuckerrohrinfo":  // Zucker
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Zucker.</t>"],
			format ["<t align='left'>Sammle Zuckerrohr auf dem Zuckerrohrfeld und verarbeite dieses in der Zuckerrohrverarbeitung zu Zucker.</t>"],
			format ["<t align='left'>Den Zucker kauft dir dann der Sammelverkäufer ab.</t>"],
			format ["<t align='left'>Alternativ kannst du auch jeweils einmal Zucker und einmal fertiges Kakaopulver beim Schokoladenmacher zu Schokolade verarbeiten und beim Sammelverkäufer verkaufen.</t>"]
		];
	};
	
	case "kohleinfo":  // Kohlebriketts
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Kohlebriketts.</t>"],
			format ["<t align='left'>Baue Kohle mit deiner Spitzhacke ab und lasse sie bei der Brikettherstellung zu Briketts pressen.</t>"],
			format ["<t align='left'>Die Briketts kannst du dann beim Briketthändler verkaufen.</t>"]
		];
	};
	
	case "platininfo":  // Platin
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Platinfelgen.</t>"],
			format ["<t align='left'>Sammle Platinerz mit deiner Spitzhacke im Platinvorkommen und schmelze es zu Platinfelgen bei der Platinschmelze um.</t>"],
			format ["<t align='left'>Die Felgen kauft dir dann der Autotuner ab.</t>"],
			format ["<t align='left'>Alternativ kannst du auch jeweils einmal Gummi und einmal eine Platinfelge beim Reifenhersteller zu Reifen verarbeiten und beim Reifenhändler bei der Rennstrecke verkaufen.</t>"]
		];
	};
	
	case "reliktinfo":  // Relikt
	{
        _text = [
			format ["<t align='left'>Du befindest dich auf der Route für Relikte.</t>"],
			format ["<t align='left'>Sammle alte Relikte im Relikttempel und lasse ihren Wert beim Reliktschätzer schätzen.</t>"],
			format ["<t align='left'>Die geschätzten Relikte kannst du dann beim Antiquitätenhänlder verkaufen oder dort verpacken und beim Warenschieber für mehr Geld verschiffen.</t>"]
		];
	};
	
	case "safttanoainfo":  // Säfte
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Saftpresse auf Tanoa.</t>"],
			format ["<t align='left'>Hier kannst du allerlei tropische Früchte weiterverarbeiten.</t>"],
			format ["<t align='left'>Melonen kannst du zu Meloneneis, Kokosnüsse zu Kokosmilch oder Bananen zu Bananenmilch verarbeiten.</t>"],
			format ["<t align='left'>Bananen und Kokosnüsse lass sich zusätzlich hier zu köstlicher Kokos-Bananenmilch verarbeiten.</t>"],
			format ["<t align='left'>Die Produkte kannst du anschließend auf dem Markt verkaufen.</t>"]
		];
	};
	
	case "schokoinfo":  // Schokolade
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Schokoladenmacher.</t>"],
			format ["<t align='left'>Hier kannst du auch jeweils einmal Zucker und einmal fertiges Kakaopulver zu Schokolade verarbeiten und beim Sammelverkäufer teuer verkaufen.</t>"]
		];
	};
	
	case "schwarzmarktinfo":  // Schwarzmarkt
	{
        _text = [
			format ["<t align='left'>Du befindest auf dem Schwarzmarkt.</t>"],
			format ["<t align='left'>Hier kannst du illegale Waren, wie Opium, Schlangenhaut oder Krokodilbabys verkaufen.</t>"],
			format ["<t align='left'>Desweiteren kannst du aber auch hier das Opium strecken oder aus der Schlangenhaut eine Tasche herstellen.</t>"],
			format ["<t align='left'>Die Schlangenhauttasche verkaufst du beim Tiermode Händler, das gestreckte Opium beim Warenschieber.</t>"]
		];
	};
	
	case "antiinfo":  // Antiquitätenhändler
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Antiquitätenhändler.</t>"],
			format ["<t align='left'>Hier wirst du gereinigte Kriegswaffen oder wertvollen Relikte los.</t>"],
			format ["<t align='left'>Beide Produkte kannst du hier aber auch verpacken und beim Warenschieber verschiffen.</t>"]
		];
	};
	
	case "warenschieberinfo":  // warenschieber
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Warenschieber.</t>"],
			format ["<t align='left'>Hier wirst du dein gestrecktes Opium, deine verpackten Relikte oder auch verpackte Kriegswaffen los.</t>"]
		];
	};
	
	case "tiermodeinfo":  // tiermode
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Tiermode Händler.</t>"],
			format ["<t align='left'>Hier kannst du Schlangenhauttaschen und Krokodilleder verkaufen.</t>"]
		];
	};
	
	case "sammeltraderinfo":  // sammelverkäufer
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Sammelverkäufer.</t>"],
			format ["<t align='left'>Hier kannst du Kakao, Zucker und Schokolade verkaufen.</t>"]
		];
	};
	
	case "baustoffinfo":  // baustoffhändler
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Baustoffhändler.</t>"],
			format ["<t align='left'>Hier kannst du Ziegel und Bauholz verkaufen.</t>"]
		];
	};
	
	case "reifeninfo":  // baustoffhändler
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei der Reifenherstellung.</t>"],
			format ["<t align='left'>Hier kannst du aus jeweils einmal Gummi und einmal eine Paltinfelge zu einem Reifen verarbeiten.</t>"],
			format ["<t align='left'>Die fertigen Reifen kauft dir der Reifenhändler bei der Rennstrecke ab.</t>"]
		];
	};
	
	case "reifentraderinfo":  // baustoffhändler
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Reifenhändler.</t>"],
			format ["<t align='left'>Hier kannst du die fertigen Reifen von der Reifenherstellung verkaufen.</t>"]
		];
	};
	
	case "gummitraderinfo":  // baustoffhändler
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Gummihändler.</t>"],
			format ["<t align='left'>Hier kannst du dein fertiges Gummi verkaufen.</t>"]
		];
	};
	
	case "felgentraderinfo":  // baustoffhändler
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Autotuner.</t>"],
			format ["<t align='left'>Hier kannst du deine fertigen Platinfelgen verkaufen.</t>"]
		];
	};

	
	case "muell":  // Mülldeponie
	{
        _text = [
			format ["<t align='left'>Du befindest dich bei Muelly's Mülldeponie.</t>"],
			format ["<t align='left'>Hier kannst du den gesammelten Müll von der Schatzinsel verkaufen.</t>"]
		];
	};
	
	case "EXAMPLE": 
	{
        _text = [
			format ["<t align='left'>Wenn das dein erster Besuch auf unserem Server ist, bitten wir dich, die Regeln genauestens durchzulesen. Dies kannst du auf der Homepage http://bruuudis.enjin.com tun oder alternativ auf der Karte indem du <t color='#FF8000'>M</t> drueckst.</t>"],
			format ["<t align='left'>Solltest du dich nun fragen welcher Rohstoff dir am schnellsten und meisten Geld bringt, begebe dich zu deinem lokalen Broker. Dieser hat für eine kleine Spende immer die aktuellsten Informationen zu den Rohstoffpreisen für dich, da wir in einer dynamischen Wirtschaft leben werden die Preise sich auch immer ändern im Verhältniss zu der Menge an Rohstoffen die gerade verfügbar sind.</t>"],
			format ["<t align='left'>Desyncs: Die meisten desyncs sind durch die Clients bedingt, bei einer Framerate unter 30 FPS ist der Armaclient überlastet und hat Probleme die Netzwerkkommunikation zu verwalten.</t>"],
			format ["<t align='left'><t color='#ff1111'>Altis Life befindet sich gegenwärtig in der BETAPHASE. Verluste und Schäden durch Serverabstürze, Bugs etc. werden NICHT erstattet!!!</t>"],
			format ["<t align='left'>Die Admins wünschen dir viel Spaß auf diesem Server.</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : 176.57.141.222:1335</t>"],
			format ["<t align='left' color='#428BCA'>Homepage : http://bruuudis.enjin.com/</t>"]
		];
	};

	case "illegal_handel":  // Illegalen Handel Übernehmen Info
	{
        _text = [
			format ["<t align='left'>Wenn du diesen Bereich einnimmst und hältst</t>"],
			format ["<t align='left'>kannst du mit deiner Gang den gesammten Illegalen Handel Kontollieren</t>"],
			format ["<t align='left'>und ihr bekommt 10% aller illegalen Verkäufe auf der Insel</t>"],
			format ["<t align='left'>Der Bereich muss 15 Minuten gehalten werden bevor ihr euren Anteil bekommt!</t>"]
		];
	};

	
	case "Auktionshaus":  // Illegalen Handel Übernehmen Info
	{
        _text = [
			format ["<t align='left'>Du befindest dich beim Auktionshaus!</t>"],
			format ["<t align='left'>Hier kannst du deine I- und T- Inventar Items verkaufen</t>"],
			format ["<t align='left'>Du kannst einen bestimmten Preis eingeben.</t>"],
			format ["<t align='left'>Andere Spieler haben dann die Möglichkeit, diese zu kaufen!</t>"]
		];
	};
	
	default		// Standardnachricht wenn keine definierte Nachricht / Information für diesen NPC bzw. Beruf vorliegt
	{
        _text = [
			format ["<t align='left'>Informationen zu diesem Händler oder Verarbeiter sind leider noch nicht verfügbar.</t>"],
			format ["<t align='left'>Wir arbeiten daran dies möglichst schnell zu ändern</t>"],
			format ["<t align='left'>Informationen über diesen Beruf findest du, wenn du <t color='#FF8000'>M</t> drueckst unter der Kategorie ""Neue Berufe""</t>"]
		];
	};
};


{
	_textArray pushBack (parseText _x);
	false;
} count _text;

"INFORMATION" hintC _textArray;