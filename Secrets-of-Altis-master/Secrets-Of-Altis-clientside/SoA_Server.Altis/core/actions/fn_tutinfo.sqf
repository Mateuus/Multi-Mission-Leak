_mode = _this select 3;

switch(_mode) do {

	case "allgemein": {
		hintC format ["Sehr geehrte/r %1, auf der Karte unter 'M' oder auf Ihrem GPS-Gerät (r Strg + M) sind Abbaugebiete mit einem Kreis, Verarbeiter mit einem Viereck und Verkäufer mit einem Dreieck markiert. Leicht grau hinterlegte Gebiete (Gebiete mit 'Safezonesymbol' (unten links)) sind absolute Sicherheitszonen, dort kann Ihnen eine hunderprozentige Lebensgarantie garantiert werden! Halten Sie sich am besten von rötlichen Markierungen dieser Art fern, diese kennzeichnen illegale Gebiete.  Der Wirtschaftsminister", name player]
	};

	case "oliven": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Der Handel mit Oliven oder Orangen ist eine gute Möglichkeit den Einstieg in das Leben auf Altis zu wagen. Sie können die gesammelten Oliven und Orangen dann bei einem Lebensmittelladen bzw. dem 'Fast Banana Supermarkt' in Kavala verkaufen.  Der Wirtschaftsminister", name player]
	};

	case "kupfer": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die Kupferherstellung ist aufgrund der 'Safezone' (Symbol unten links), eine sehr gut gegen Verbrecher geschützter Arbeitsweg. Sie besteht aus 3 Stationen: Der Kupfermine, der Kupferschmelze und dem Metallhandel Altis. Eine Spitzhacke ist bei dieser Arbeit essentiell.  Der Wirtschaftsminister", name player]
	};

	case "eisen": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die Eisenherstellung ist eine etwas längere Variante der Edelmetallherstellung, welche gut als Anschlussmöglichkeit zu Diamanten genutzt werden kann. Sie besteht aus 3 Stationen: Der Eisenader, der Eisenschmelze und dem Metallhandel Altis. Eine Spitzhacke ist bei dieser Arbeit essentiell.  Der Wirtschaftsminister", name player]
	};

	case "sand": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die Glasherstellung ist eine gute Möglichkeit den Norden der Insel ein wenig zu erkunden. Sie besteht aus 3 Stationen: Der Quarzgrube, der Glasmanufaktur und dem Glasankauf. Eine Spitzhacke ist bei dieser Arbeit essentiell.  Der Wirtschaftsminister", name player]
	};

	case "zement": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die Zementherstellung ist eine zentral-östlich gelegene Möglichkeit legal gutes Geld zu machen. Sie besteht aus 3 Stationen: Dem Steinbruch, dem Steinmetz und dem Baustoffhandel. Eine Spitzhacke ist bei dieser Arbeit essentiell.  Der Wirtschaftsminister", name player]
	};

	case "salz": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die Salzherstellung ist eine Arbeitsmöglichkeit, welche aufgrund ihrer großen Strecke, für den Luftverkehr ausgelegt ist. Hier werden einige Herstellungsverfahren angewendet, die von normalen Arbeitsabläufen abweichen. Sie besteht aus 3 Stationen: Der Salzgewinnungsanlage, der Salzraffinierie und dem Salzankauf.  Der Wirtschaftsminister", name player]
	};

	case "diamant": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Für die Diamantherstellung benötigen Sie grundlegend erst einmal eine Spitzhacke, mit welcher Sie die Diamanten im Diamantbergwerk abbauen können. Von dort aus fahren Sie zur Diamantschleiferei und im Anschluss zum Juwelier, bei dem sie ihre Ware verkaufen.  Der Wirtschaftsminister", name player]
	};

	case "schoko": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die Schokoladenherstellung ist eine sehr weitreichende Möglichkeit ausgehend von der Kakaoplantage zu arbeiten. An der Flaschenabfüllanlage kann der Kakao in Flaschen abgefüllt werden (die Flaschen sind via WeCraft-App auszudrucken). Der abgefüllte Kakao ist anschließend am Marktplatz zu verkaufen. Der Kakao kann alternativ an der Schokoladenfabrik zu einer Schokoladentafel verarbeitet werden und einfach in der Konditorei verkauft werden. Die Herstellung von Pralinen an der Schokoladenfabrik aus Schnaps und Kakao ist ebenfalls möglich. Diese können auch an der Konditorei verkauft werden.  Der Wirtschaftsminister", name player]
	};

	case "schmuck": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die Perlen-/Schmuckherstellung fängt an den 'Ewigen Muschelgründen' an, wo sie nach den wertvollen Meerestieren tauchen gehen. Die ungewaschenen Perlen können beim inseleigenen Juwelier verkauft werden. Lukrativer ist es jedoch die Perlen via WeCraft-App mit Diamanten zu Schmuck zu verarbeiten und im Anschluss dem Juwelier zu verkaufen.  Der Wirtschaftsminister", name player]
	};

	case "oil": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die Ölherstellung beginnt mit dem Ölfördern auf der Bohrinsel im Süd-Westen der Insel. Der anschließende Weg führt Sie zur Ölraffinerie, um Ihr gesammeltes Rohöl zu reinem, raffiniertem Öl zu verarbeiten. Absetzen können Sie das Endprodukt beim inselansässigen Öl-Schaich 'Abd-El-Faggot'.  Der Wirtschaftsminister", name player]
	};

	case "kunststoff": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Kunststoff können Sie aus Plastikmüll herstellen, Welchen Sie in einigen offenen Abfalleimern in den vier Großstädten Kavala, Athira, Sofia und Pyrgos finden. Auch bei dem Verkauf von abgelieferten Abfalltonnen (siehe Tutorial in 'Einstiegs Tipps-App') können Sie Plastikmüll erhalten. Diesen Müll können Sie an der Recyclinganlage aufwerten und beim Baustoffhandel verkaufen.  Der Wirtschaftsminister", name player]
	};

	case "alkohol": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die drei Alkoholsorten können aus verschiedenen Bestandteilen hergestellt werden, exakte Informationen dazu erhalten Sie auf Ihrem Tablet (Z-Menü) in der 'Einsteiger Hilfe-App'.  Der Wirtschaftsminister", name player]
	};

	case "plutonium": {
		hintC format ["%1 dies ist eine WARNUNG! Der Aufenthalt in dem Gebiet, in welchem Sie sich derzeitig befinden ist illegal! Bitte verlassen Sie dieses umgehend. Die Polizei wird Ihnen bei Sichtung in folgenden Gebieten dieser Art ein Bußgeld ausstellen: 'Radioaktives Gebiet', 'Atommüllverarbeitung' und dem 'Russischen Chemiefrachter'! Falls Sie sich ein kleines Accessoire mitnehmen wollen, sind ein Strahlenschutzanzug und eine Spitzhacke dringenst zu empfehlen.  Der Wirtschaftsminister", name player]
	};

	case "heroin": {
		hintC format["%1 dies ist eine WARNUNG! Der Aufenthalt in dem Gebiet, in dem Sie sich gerade befinden ist illegal! Bitte verlassen Sie dieses umgehend. Die Polizei wird Ihnen bei Sichtung in folgenden Gebieten dieser Art ein Bußgeld ausstellen: 'Schlafmohnplantage', 'Mohnfermentation' sowie jeglichen Drogendealern!  Der Wirtschaftsminister", name player]
	};

	case "kokain": {
		hintC format ["%1 dies ist eine WARNUNG! Der Aufenthalt in dem Gebiet, in dem Sie sich gerade befinden ist illegal! Bitte verlassen Sie dieses umgehend. Die Polizei wird Ihnen bei Sichtung in folgenden Gebieten dieser Art ein Bußgeld ausstellen: 'Kokablattplantage', 'Kokalaboratorium' sowie jeglichen Drogendealern!  Der Wirtschaftsminister", name player]
	};

	case "marihuana": {
		hintC format ["Sehr geehrter Pflanzenzüchter %1, dies ist eine WARNUNG! Der Besitz und die Verwendung der Pflanze aus diesem Gebiet ist unter bestimmten Bedingungen nicht gestattet. Die Polizei wird Ihnen bei Sichtung in folgenden Gebieten dieser Art ein Bußgeld ausstellen: 'Hanfblütentrocknung' sowie jeglichen Drogendealern!  Der Wirtschaftsminister", name player]
	};

	case "salat": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Aus Salat und Atomtomaten ist es Ihnen möglich einen gemischten Salat... nun ja zu mischen! Dazu sollten Sie zunächst das Salatfeld bzw. die Atomtomatenplantage nahe Kavala aufsuchen und die gesammelten Gemüse bei der 'Iss Mal Salat e.V.' zusammenmischen. Verkaufen können Sie die Tomaten, die Salatköpfe und den gemischten Salat beim Fast Banana-Shop am Kavala Markt, sowie jeglichen Imbissständen und anderen Instanzen dieser Art.  Der Wirtschaftsminister", name player]
	};

	case "baumwolle": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Weitere Informationen über die Weiterverwendung von Baumwolle finden Sie in Ihrer WeCraft-App auf Ihrem Tablet (Z-Menü). Der Stoff kann nicht verkauft werden.  Der Wirtschaftsminister", name player]
	};

	case "eis": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Die Eisherstellung ist insbesondere in den Sommermonaten sehr lukrativ und sinnvoll für das Allgemeinwohl. Nachdem Sie die Eisfabrik aufgesucht haben, können Sie das Eis an einem Imbissstand sowie jeglichen weiteren Instanzen dieser Art verkaufen oder anderen Mitbürgern eine 'coole' Erfrischung überreichen.  Der Wirtschaftsminister", name player]
	};

	case "indigo": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Weitere Informationen über die Weiterverwendung von Indigo finden Sie in Ihrer WeCraft-App auf Ihrem Tablet (Z-Menü). Der Stoff kann nicht verkauft werden.  Der Wirtschaftsminister", name player]
	};

	case "holz": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Holz aus einem Waldgebiet ist eine gute Möglichkeit zur Erschaffung neuer Objekte, weitere Informationen dazu finden Sie in Ihrer WeCraft-App auf Ihrem Tablet (Z-Menü). Die Weiterverarbeitung an einem Sägewerk ist Ihnen ebenfalls möglich. Die Möbelhäuser der Insel entlohnen Sie für jede Holzlieferung!  Der Wirtschaftsminister", name player]
	};

	case "jagen": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Für die Personen, die die Ruhe und Ausgewogenheit in einem Wald als lohnend betrachten, ist das Jagen von Tieren wohl die beste Möglichkeit neben der Entspannung auch noch Geld zu verdienen. Hierzu müssen Sie einen National-/Wildpark aufsuchen und sich am örtlichen Jagdbedarf eine Waffe mit entsprechenden Waffenschein zuzulegen. Die erlegten Tiere können Sie dann zu einem Schlachthof bringen und anschließend bei einer Metzgerei verkaufen. Für ihr Jagdvorhaben ist ein Jagdmesser und ein Jagdhorn von äußerster Bedeutung.  Das Forstamt Altis", name player]
	};

	case "grabung": {
		hintC format ["Sehr geehrter Präparator %1, um Ihnen ein paar Ortskenntnisse, bezüglich Ihrer neuen Arbeitsstelle, mitzugeben, finden Sie hier ein paar Informationen. Um die vom Institut beauftragten Skelette zu finden, sollten Sie eine Schaufel verwenden, eine Spitzhacke würde hier eher negative Auswirkungen hervorrufen. Wenn Sie alle 3 Teile eines Skeletts gefunden haben können Sie diese beim Institut für Archäologie, mit Hilfe einer Lupe, zusammensetzen lassen. Das Zentrum für Archäologie wartet danach sicherlich schon sehnsüchtig auf weitere Leichentransporte!  Der Wirtschaftsminister", name player]
	};

	case "banane": {
		hintC format ["Moin moin %1, schön, dass du den Weg auf unsere kleine Bananeninsel gefunden hast. Hiermit erteilen wir - Die Inselverwaltung - die Erlaubnis die prächtigsten Bananen der ganzen Welt zu sammeln. Bestimmt wird einer der vielen Lebensmittelhändler Ihnen einige Bananen abkaufen.  Ihre Biquita GmbH", name player]
	};

	case "tabak": {
		hintC format ["Hallo %1, um Ihnen einen einfachen Einstieg in Ihre neue Arbeit zu gewährleisten, finden Sie hier ein paar Informationen. Hier, auf der Tabakplantage, können Sie haufenweise Tabak sammeln, um Zigaretten und Zigarren in Ihrer WeCraft-App auszudrucken. Diese Tabakwaren können Sie dann bei einem Tabakwarengeschäft Ihrer Wahl verkaufen.  Der Wirtschaftsminister", name player]
	};
};