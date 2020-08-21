waitUntil {!isNull player && player == player};
if(player diarySubjectExists "controls") exitWith {};

player createDiarySubject ["serverrules","Regulamin"];
player createDiarySubject ["money","Zarabianie"];
player createDiarySubject ["controls","Klawiszologia"];
player createDiarySubject ["credits","Credits"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
					TEXT HERE<br/><br/>
				"
		]
	];
*/

	player createDiaryRecord ["credits",
		[
			"ALtisLand Niespodzianki",
				"
					rmaLife is a GitHub project which aims to update and keep adding new features to the original 'Altis Life RPG' by Tonic.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Poszanowanie życia i obrona własna ALN",
				"
				1. Każdy obywatel ma obowiązek szanować życie swoje i kompanów, tj. wszelakie próby rambo będą uznawane za brak poszanowania życia i będą karane.<br/>
				2. lester złodziej napadnięty i napastnik grozi mubronią palną -musi się poddać, jeśli spróbuje dobyć broni (napastnik jest z nim w bezpośrednim kontakcie wzrokowym i nie dzieli ich żadna osłona np. mur, domek) napastnik ma prawo go zabić i oskarżyć o nieposzanowanie życia.<br/>
				3. Prawo do obrony własnej respektowane jest tylko, jeśli postrzału / mordu dokonano w obronie życia swojego lub kompanów, by uniknąć konsekwencji należy niezwłocznie powiadomić policję, przedstawić sytuację i posiadać świadków.<br/>
				4. Wyjątkiem od reguł są strefy czerwone, inaczej zwane strefą RDM.<br/>
				5. Zabronione jest używanie pojazdu do tzw kamikadze, chyba, że posiada się kamizelkę samobójcy i zamierza się wysadzić jako terrorysta -wtedy atak uznawany jest za użycie samochodu pułapki.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Posterunki Plik Acid",
				"
				1. Strefa niebieska jest traktowana jako strefa zielona, zakazane jest tam pvp, strzelanie i temu podobne.<br/>
				2. Cywile w celu załatwienia spraw z policją, złożenia zgłoszenia lub czegokolwiek mają prawo wejść jedynie na teren posterunku Kavala.<br/>
				3. Wszystkie posterunki po za KG Kavala są niedostępne dla cywili, próba wtargnięcia na nie może zakończyć się śmiercią.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Ochrona",
				"
				1. Każdy obywatel posiadający licencję ochroniarza zasila szeregi ochrony.<br/>
				2. Ochrona ma prawo do posiadania broni automatycznej zgodnej z ich licencją.<br/>
				3. Ochrona ma prawo chodzić z przygotowaną bronią, tylko, jeśli jest na służbie -w mundurze ochrony.<br/>
				4. Ochrona ma prawo do konwojowania, eskortowania i pilnowania obywateli w zamian za wynagrodzenie od w/w obywateli.<br/>
				5. Skargi na brak wynagrodzenia od obywatela będą rozpatrywane tylko z dowodem zawarcia umowy -tj SS'em przedstawiającym na chacie w grze, iż obywatel wyraża zgodę na warunki i ustaloną kwotę wzamian za usługę.<br/>
				6. Ochrona nie może dokonywać nielegalnych czynności, dokonanie ich skutkuje wyrzuceniem z szeregów ochrony.<br/>
				7. Ochrona ma prawo dokonać neutralizacji celuniebezpiecznego i/lub napastnika w obronie własnej lub swojego klienta, w takim wypadku ma niezwłoczny obowiązek powiadomić policję o całym zdarzeniu.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Nielegalne pojazdy",
				"
				1. Każdy pojazd opancerzony (hunter, ifrit, strider) jest nielegalny.<br/>
				2. Każdy pojazd, który posiadał lub posiada w bagażniku nielegalne przedmioty, kontrabandę jest nielegalny.<br/>
				3. Policja ma prawo dokonać zarekwirowania pojazdu nielegalnego i następnie neutralizacji go na komendzie głównej jak i ostrzelania go podczas próby ucieczki.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"EMS",
				"
				1. Medyk jest osobą bezstronną i nietykalną, nie wolno go porywać ani zabijać. Wyjątkiem od reguły zabicia jest akcja, jeśli medyk wtargnie na miejsce akcji i nie opuści jej po poinformowaniu go, gracz lub policjant ma prawo go zastrzelić.<br/>
				2. Medyk ma obowiązek odgrywać RP, a uleczony gracz wykonywać jego polecenia.<br/>
				3. Medyk ma prawo stwierdzić zgon, jeśli doszło do potrącenia, wypadku, wybuchu lub strzelaniny.<br/>
				4. Medyk ma obowiązek stawić się na każde wezwanie, jeśli akurat nie trwa tam akcja.<br/>
				5. Medyk ma obowiązek wykonywać polecenia uzbrojonego cywila lub policjanta, jeśli przyjechał na miejsce wypadku, gdzie doszło do kolizji / strzelaniny.<br/>
				6. Medyk nie ma prawa podnosić policjantów i cywili podczas akcji.<br/>
				7. Podwójne życie obowiązuje jedynie, jeśli na serwerze jest powyżej 2 medyków na służbie. Jeśli medyk na cywilu jest poszukiwany, ma kategoryczny zakaz przelogowania się na medyka, wyjątkiem od reguły jest niska liczba medyków online (poniżej 2). W takim przypadku należy zgłosić się na komendę zaraz po powrocie na cywila w celu uiszczenia kary.<br/>
				8. Medyk ma prawo odmówić podniesienia gracza, który łamie regulamin lub trolluje.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"BANK",
				"
				1. Bank może być napadnięty od 5 policjantów na serwerze.<br/>
				2. Bank musi zostać zainicjowany minimum godzinę przed restartem.<br/>
				3. Podczas jednego restartu bank wolno napaść maksymalnie dwa razy z zachowaniem przerwy od napadu, która wynosi godzinę.<br/>
				4. Gracze i policja mają prawo użyć każdego dostępnego sprzętu i każdej dostępnej broni.<br/>
				5. Nie wolno chować sztabek złota do domku.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Okupacje miast i ataki terrorystyczne",
				"
				1. Okupacja miasta dozwolona jest od 8 policjantów na serwerze.<br/>
				2. Gracze chcący dokonać okupacji miasta muszą powiadomić policję 20 minut przed faktem i dać jej czas na przygotowanie się, powiadomienie cywili i wybór miasta.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Odbicia z komendy i przejęcia, więźnia",
				"
				1. Gracze, którzy chcą dokonać odbicia aresztowanego z komendy policji muszą dokonać następujących czynności:<br/>
				-Upewnić się, iż na serwerze przebywa minimum 5 policjantów.<br/>
				-Powiadomić o tym fakcie policję za pomocą S MS'a 15 minut przed rozpoczęciem akcji.<br/>
				-Przebywać minimum 2 kilometry od wyznaczonej na odbicie komendy.<br/>
				2. Policjanci, którzy biorą udział w akcji odbijania aresztowanego z komendy policji muszą dokonać następujących czynności:<br/>
				-Powiadomić cywili o dokonywanym odbiciu i zabezpieczyć teren.<br/>
				-Przygotować się na odbicie.<br/>
				-Osadzić aresztowanego w bezpiecznym miejscu na terenie komendy wraz z strażnikiem oddelegowanym do pilnowania go.<br/>
				3. Gracze oraz Policjanci mogą wykorzystać każdy dostępny im ekwipunek podczas akcji odbicia.<br/>
				4. Gracze oraz policjanci mają prawo wrócić na teren akcji po 10 minutach, chyba, że akcja trwa powyżej 40 minut -w tym wypadku powroty są zakazane i ostatnie starcie decyduje o powodzeniu lub niepowodzeniu akcji.<br/>
				5. Gracze, którzy zamierzają odbić więźnia z transportu (więźniowie transportowani są w konwoju) nie muszą powiadamiać policji o tym fakcie.<br/>
				6. Gracze chcący odbić więźnia z terenu więzienia nie muszą powiadamiać policji o tym fakcie.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Wykroczenia, mandaty i czynności nielegalne",
				"
				1. Osoba której mandat przekroczył 10.000.000 automatycznie trafia do więzienia bez możliwości zapłacenia mandatu.<br/>
				2. Osoba, która popełniła wykroczenie zostanie ukarana mandatem karnym, w przypadku trzykrotnego odrzucenia mandatu odesłana do więzienia.<br/>
				3. Osoba osadzona w więzieniu traci wszystkie nielegalne przedmioty i nielegalne licencje.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Policja Altis",
				"
				1. Policjant podczas zatrzymania ma obowiązek wylegitymować się (stopień i nazwisko) jak i podać powód zatrzymania, tylko i wyłącznie w sytuacji braku zagrożenia dla życia i zdrowia. Wyjątek stanowią oddziały SPAP, BOA, GROM, które noszą maski w celu ochrony swojej tożsamości.<br/>
				2. Podczas akcji policyjnej zabrania się przebywania w obrębie akcji i utrudniania pracy policji. Każdy przebywający na terenie akcji odgórnie jest uznany za podejrzanego lub zamieszanego w akcję.<br/>
				3. Gracz, który został skuty i umieszczony w pojeździe policyjnym ma kategoryczny zakaz opuszczania go bez pomocy osób trzecich.<br/>
				4. Policjant ma prawo dokonać konfiskaty broni osoby podejrzanej, jeśli była użyta w przestępstwie lub czynności nielegalnej.<br/>
				5. Policjant ma prawo dokonać konfiskaty broni osoby, która nie posiada stosownego pozwolenia i kalibru (pozwolenie na broń krótką, licencja ochrony, kaliber nie może przekroczyć .45 ACP). <br/>
				6. Policjant ma prawo zakuć i wylegitymować każdą osobę, która ma założoną maskę.<br/>
				7. Policja ma prawo otworzyć ogień z broni ostrej, jeśli: podejrzany ma wyciągniętą broń i celuje z niejlub stwarza zagrożenie, podejrzany ucieka pojazdem, podejrzany rozpoczyna interakcję po przez strzelanie.<br/>
				8. Policja ma prawo zastrzelić bez interakcji każdego terrorystę, który posiada kamizelkę samobójcy.<br/>
				9. Policja ma prawo rozstawić punkt kontrolny na drodze i sprawdzać każdy przejeżdżający przez niego pojazd, obowiązkiem policji jest poinformować cywili o takim fakcie po przez odpowiednie oznakowanie punktu. Wyjątkiem od reguły są zasadzki i blokady drogowe.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Miasta i strefy zielone",
				"
				1. W strefie zielonej obowiązuje kategoryczny zakaz używania broni i dokonywania jakichkolwiek przestępstw.<br/>
				2. Osoba która posiada wyciągniętą broń w mieście jest traktowana jako zagrożenie dla cywili i będzie neutralizowana przez policję.<br/>
				3. Zakazane jest uciekanie na strefę zieloną z miejsca akcji.<br/>
				4. Próby VDM'ów, niszczenia mienia i celowego trollingu będą karane.<br/>
				5. Notoryczne obrażanie, znęcanie się, uniemożliwianie czynności, blokowanie wjazdów i bankomatów będzie karane.<br/>
				6. Napadanie przy bankomatach i/lub groże nie bronią będzie karane.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Interakcje, napady i akcje",
				"
				1. W celu dokonania napadu należy dokonać interakcji z ofiarą -słownej -po przez direct chat lub werbalnej -po przez widoczne grożenie bronią i celowanie w ofiarę. Wszelakie inne metody będą traktowane jako RDM.<br/>
				2. W celu dokonania napadu na jadący pojazd należy dokonać interakcji z ofiarą -po przez grożenie bronią np. z paki offroada lub przestrzelenie opon. Zaraz po zatrzymaniu pojazdu należy dokonać interakcji słownej lub werbalnej. Wszelakie inne metody będą traktowane jako RDM.<br/>
				3. W celu dokonania porwana należy dokonać interakcji z ofiarą -słownej -po przez direct chat lub werbalnej -po przez widoczne grożenie bronią i celowanie w ofiarę. Wszelakie inne metody będą traktowane jako RDM. Ofiara porwania ma obowiązek wykonywać polecenia porywacza.<br/>
				4. Zezwala się na taranowanie pojazdu naziemnego za pomocą pojazdu naziemnego w celu dokonania interakcji pod warunkiem dokonania interakcji słownej lub werbalnej po zatrzymaniu taranowanego pojazdu.<br/>
				5. Zabrania się ostrzelania policji, która jedzie na sygnałach dźwiękowych lub świetlnych w celu dokonania interakcji. Wyjątkiem od reguły jest ostrzelanie opon w celu dokonania interakcji a następnie dokonanie interakcji słownej lub werbalnej.<br/>
				6. Kolczatka drogowa może być uznana za inicjalizację interakcji tylko w przypadku zasadzki lub napadu, pojazd, który padnie jej ofiarą nie może zostać ostrzelany bez uprzedniej interakcji słownej lub werbalnej.<br/>
				7. Jeśli policjant zatrzymuje lub skuwa gracza jest to uznawane za interakcję wobec osoby skutej / zatrzymanej i jej towarzyszy np. pasażerów auta. W każdym innym przypadku gracz musi zainicjować interakcję werbalnie lub słownie.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Postanowienia ogólne",
				"
				1. Graj zawsze RP - wszelakie odstępstwa od gry Role Play będą karane banem.<br/>
				2. Wszelakie przejawy trollingu lub utrudniania gry innym w sposób niezgodny z regulaminem będą karane banem.<br/>
				3. Spam na chacie lub komunikacja głosowa po przez kanały główne (side channel, global channel) będzie karana banem.<br/>
				4. Jeżeli uczestniczysz w akcji (strzelanina, porwanie, napad, itp) nie możesz wejść na zieloną strefę ani wylogować się.<br/>
				5. Notoryczne prześladowanie, groźby karalne kierowane wobec innego gracza, znęcanie się psychiczne będą karane banem.<br/>
				6. Gracz, który dokonuje tzw RDM'a -Random DeatchMatch lub VDM'a -Vehicle DeatchMatch będzie ukarany permem.<br/>
				7. Gracz może jednorazowo użyć pojazdu w celu samoobrony, jednak tylko w uzasadnionych przypadkach!<br/>
				8. Zakazane jest zabijanie lub napadanie na graczy którzy dopiero się zrespawnowali np. w budynku, na ulicy.<br/>
				9. Zabijanie, porywanie, ogłuszanie oraz okradanie graczy przy bankomacie (obręb ok. 15m), oraz sklepach, garażach, hangarach. Jest surowo zabronione i będzie karane banem.<br/>
				10. Strefy czerwone są strefami RDM, oznacza to iż, na w/w strefach nie trzeba dokonywać interakcji w celu zabójstwa gracza.<br/>
				11. Wykorzystywanie błędów i bugów gry będzie karane banem lub vipe.<br/>
				12. Zabrania się dokonywania kradzieży pojazdów po przez holowanie lub podczepienie pod helikopter bez uprzedniego wyłamania zamka w pojeździe.<br/>
				13. Próba wejścia na sloty whitelistowane (policyjne, medyczne) bez posiadania whitelisty -przydziału jest zabroniona.<br/>
				14. Zabrania się rozstawiania bomb, min, IED'ów, kolczatek i blokad przed posterunkami policji, wyjazdami z zielonych stref jak i na zielonych i niebieskich strefach.<br/>
				15. Dokonywanie tzw combatloga lub battleloga po śmierci jest zakazane. Każdy gracz ma obowiązek odrodzić się.<br/>
				16. Policja jak i gracze mają prawo powrócić na akcję po upłynięciu czasu 10 minut, wyjątek stanowi liczba policjantów poniżej 5, w takim przypadku policja ma prawo wracać po upływie 5 minut.<br/>
				17. Wszelakie przejawy reklamy innych serwerów, TS'ów, serwisów i temu podobnych będą karane banem.<br/>
				"
		]
	];

	player createDiaryRecord ["money",
		[
			"Multi Processy",
				"
				1. Bimber<br/>
				Jabłko + Woda = Zacier<br/>
				Zacier + Drożdże = Bimber<br/>
				Bimber + Butelka = Butelkowany Bimber<br/><br/>
				2. Butelki<br/>
				Piasek -> Szkło<br/>
				Szkło -> Butelki<br/><br/>
				3. Piwo<br/>
				Drożdże + Chmiel = Whiskey<br/>
				Piwo + Butelka = Butelkowane Piwo<br/><br/>
				4. Uran<br/>
				Kopalnia uranu<br/>
				.<br/><br/>
				5. Whiskey<br/>
				Drożdże + Żyto = Whiskey<br/>
				Whiskey + Butelka = Butelkowana Whiskey<br/><br/>
				6. Biżuteria<br/>
				Oszlifowany Diament + Srebro = Biżuteria<br/><br/>
				7. Uran<br/>
                 a) Legalny<br/>
                 Kopalnia uranu+Oczyszczanie Uranu+Przetwarzanie Uranu+Wzbogacanie uranu+Produkcja Prętów Paliwowych=Pręty Paliwowe<br/>
				 b) Nielegalny<br/>
                 Kopalnia uranu+Oczyszczanie Uranu+Przetwarzanie Uranu+Produkcja Brudnego Uranu= Brudny Uran (Skup u Dilera)<br/><br/>
				"
		]
	];

	player createDiaryRecord ["money",
		[
			"Spis prac",
				"
				1. LEGALNE<br/>
				-Brzoskwinie<br/>
				-Butelki<br/>
				-Cement<br/>
				-Diamenty<br/>
				-Jabłka<br/>
				-Miedź<br/>
				-Piwo<br/>
				-Polowanie<br/>
				-Ropa<br/>
				-Ryby<br/>
				-Sól<br/>
				-Szkło<br/>
				-Whiskey<br/>
				-Żelazo<br/>
				-Diamenty<br/>
				-Biżuteria<br/>
				2. NIELEGALNE<br/>
				-Bimber<br/>
				-Heroina<br/>
				-Kokaina<br/>
				-Marihuana<br/>
				-Żółwie<br/><br/>
				-Brudny Uran<br/>
				"
		]
	];

// Controls Section

	player createDiaryRecord ["controls",
		[
			"Klawiszologia",
				"
				Y: Menu Gracza<br/>
				U: Otwieranie/zamykanie pojazdów<br/>
				F: Syreny (Policja|Medyk)<br/>
				T: Bagażnik pojazdów<br/>
				O: Otwieranie szlabanów (Policja|Medyk)<br/>
				TAB: Poddanie się/Światła awaryjne<br/>
				Q: Kierunkowskaz w lewo<br/>
				E: Kierunkowskaz w prawo<br/>
				1: Lista Poszukiwanych<br/>
				Lewy Shift + P: Zatyczki do uszu<br/>
				Lewy Shift + R: Skucie/Związanie<br/>
				Lewy Shift + G: Powalenie<br/>
				Lewy Windows: Przycisk główny. Pozwala na wiele interakcji.<br/>
				Lewy Windows + T: Podniesienie pieniędzy/itemów z ziemi<br/>
				Lewy Shift + L: Aktywuje swiatła (Policja|Medyk)<br/>
				Lewy Shift + H: Schowanie broni<br/>
				Lewy Ctrl + H: Wyciągniecie broni<br/>
				"
		]
	];

