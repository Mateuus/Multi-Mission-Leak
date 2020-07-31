if (!hasInterface) exitWith {};
waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Aktualizacje serwera"];
player createDiarySubject ["Mandaty","Mandaty"];


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
	player createDiaryRecord["changelog",
		[
			"Aktualizacje Serwera",
				"
					4 lipca 2016 <br/> <br/>
					
					Dodano: <br/>
					Briefing na mapie <br/> <br/>
					
					Zmieniono: <br/>
					Nerf broni oraz wyposazenia Policji<br/>
					Wylaczono deszcz oraz zmiany pogody <br/>
					Zwiekszono wirtualny ekwipunek Policji oraz EMT <br/>
					Dodano parametry do niektorych obiektow na mapie <br/> <br/>
					
					Usunieto: <br/>
					Lawki z mapy - zostala tylko jedna przed bankiem <br/>
					
				"
		]
	];
	
	player createDiaryRecord ["Mandaty",
		[
			"Mandaty", 
				"
					 Wyciaganie broni w miejscu publicznym - $25,000 + konfiskata <br/>
					 Lekkomyslna jazda - $10,000 + odholowanie <br/>
					 Agresywna jazda - $8,000 <br/>
					 Przekraczanie predkosci - $5,000 <br/>
					 Zaklocanie spokoju - $8,000 <br/>
					 Nieustapienie pierwszenstwa pojazdom uprzywilejowanym - $15,000 <br/>
					 Niezatrzymanie sie przy znaku stop - $5,000 <br/>
					 Prowadzenie pojazdu bez prawa jazdy - $25,000 + odholowanie <br/>
					 Nieustapienie pierwszenstwa - $4,500 <br/>
					 Przejazd na czerwonym swietle - $4,500 <br/>
					 Jazda bez odpowiednich swiatel - $6,000 <br/>
					 Przebywanie w miejscu przestepstwa - $5,000 <br/>
					 Ukrywanie tozsamosci - $2,500 + prace spoleczne + przeszukanie <br/>
				"
		]
	];
	
