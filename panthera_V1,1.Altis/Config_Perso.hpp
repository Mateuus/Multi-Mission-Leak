/*
	Konfig für Perso	
*/
class Personalausweis {
	// Körpergröße von-bis in cm # Bodysize from-to in cm
	koerpergroesse[] = {170,220};
	// Geburtsjahre von-bis # year of birth from-to
	// Wird mit dem Missionsdatum gegengerechnet # would be calculate with mission date
	jahre[] = {1950,2015};
	// Körpergewicht in kg von-bis # body weight from-to in kg
	gewicht[] = {55,135};
	// Geschlecht M=Männlich, W=Weiblich # sex 'M'=man, change 'W' to 'F' for female
	geschlecht[] = {"M","W"};
	// Polizeimarke o. Logo (Pfad) # police badge destination
	logoWest = "#(rgb,8,8,3)color(0.07,0.06,0.83,0.5)";
	// Sanitäter-Logo (Pfad) # medical badge destination
	logoIndep = "#(rgb,8,8,3)color(0,0.93,0.05,0.5)";
	// Zivilisten-Logo (Pfad), ja Farben können angegeben werden # civilian badge destination, yes you can use color
	logoCiv = "#(rgb,8,8,3)color(0.49,0.06,0.44,0.5)";
	// Opfor-Logo (Pfad)/Unbekannte Fraktion # opfor badge destination/unkown side
	logoUnkn = "#(ai,64,64,1)Fresnel(0.3,3)";
	// Blutgruppen # bloodtypes
	blutgr[] = {"A","B","AB","0"};
	// Wohnort # living city
	class persoOrt {
		class 39071 {
			id = 1;
			name = "Abdera";
			plz = 39071;
			str[] = { {"Kleine Felswand", 5},{"Kleiner Felsbogen",3},{"Ruhender Platz",2} };
		};	
		class 34142 {
			id = 2;
			name = "Aggelochori";
			plz = 34142;
			str[] = { {"Strandmarsch",2},{"Kavalastrasse",12},{"Renergusstrasse",12},{"Meerblick",9},{"Zur Fabrik",12},{"Zum Sportplatz",13} };
		};	
		class 32892 {
			id = 3;
			name = "Agios Dionysios";
			plz = 32892;
			str[] = {{"Hauptstrasse",30},{"Palmenarm",12},{"Zum Mischwalde",6}};
		};	
		class 35557 {
			id = 4;
			name = "Alikampos";
			plz = 35557;
			str[] = {{"Schlesienstrasse",13},{"Muehlenberg",9}};
		};	
		class 32449 {
			id = 5;
			name = "Anthrakia";
			plz = 32449;
			str[] = {{"Frickestrasse",12},{"An der Kirche",9},{"Zur Traenke",3}};
		};	
		class 39136 {
			id = 6;
			name = "Athira";
			plz = 39136;
			str[] = {{"Zum Sportplatz",12},{"Am Markt",9},{"Poststrasse",8},{"Zur Fabrik",3},{"Richtung Glauben",10}};
		};	
		class 32632 {
			id = 7;
			name = "Chalkeia";
			plz = 32632;
			str[] = {{"Ueber den Huegel",8},{"Zur Urne",5},{"Friedensstrasse",2}};
		};	
		class 34949 {
			id = 8;
			name = "Charkia";
			plz = 34949;
			str[] = {{"Muehlenblick",5},{"Zweigstrasse",5},{"Am Industriepark",15}};
		};	
		class 31593 {
			id = 9;
			name = "Dorida";
			plz = 31593;
			str[] = {{"Zum Lichtschein",2},{"Zum Felde",6}};
		};	
		class 39895 {
			id = 10;
			name = "Feres";
			plz = 39895;
			str[] = {{"Ruinenstrasse",8},{"Industriehof",3}};
		};	
		class 38441 {
			id = 11;
			name = "Frini";
			plz = 38441;
			str[] = {{"Vom Walde",5}};
		};	
		class 33300 {
			id = 12;
			name = "Galati";
			plz = 33300;
			str[] = {{"Am Berg",12},{"Am Blumenbeet",4}};
		};	
		class 30932 {
			id = 13;
			name = "Gravia";
			plz = 30932;
			str[] = {{"Halbstrasse",5},{"Zum Flugfeld",7},{"Vom Sportplatz",3}};
		};	
		class 35682 {
			id = 14;
			name = "Kalithea";
			plz = 35682;
			str[] = {{"Meerblick",2},{"Fischerhafen",3}};
		};	
		class 30352 {
			id = 15;
			name = "Kalochori";
			plz = 30352;
			str[] = {{"Matschweg",10},{"Stettinerstrasse",3}};
		};	
		class 39159 {
			id = 16;
			name = "Katalaki";
			plz = 39159;
			str[] = {{"Anglerpier",4},{"Ueber den Kies",3}};
		};	
		class 37690 {
			id = 17;
			name = "Kavala";
			plz = 37690;
			str[] = {{"Burgblick",4},{"Hauptstrasse",25},{"Am Krankenhaus",9},{"Palmenweg",8},{"Ruhrstrasse",6}};
		};	
		class 38212 {
			id = 18;
			name = "Kore";
			plz = 38212;
			str[] = {{"Scharfer Blick",5},{"Huegelweg",3}};
		};	
		class 38023 {
			id = 19;
			name = "Lakka";
			plz = 38023;
			str[] = {{"Hauptstrasse",3},{"Fliegerwiese",4}};
		};	
		class 35026 {
			id = 20;
			name = "Molos";
			plz = 35026;
			str[] = {{"Zur Salzindustrie",8},{"Kreuzstrasse",8}};
		};	
		class 38319 {
			id = 21;
			name = "Negades";
			plz = 38319;
			str[] = {{"Am Hang",12},{"Zum Meer",2}};
		};
		class 30854 {
			id = 22;
			name = "Neochori";
			plz = 30854;
			str[] = {{"Am Walde",12},{"Am Markt",4},{"Hafenstrasse",3},{"Fischerweg",2},{"Gradestrasse",5},{"Feldstrasse",4}};
		};	
		class 39394 {
			id = 23;
			name = "Neri";
			plz = 39394;
			str[] = {{"Kirchenblick",4},{"Am Felsbruch",5},{"Mannsweg",5}};
		};	
		class 39399 {
			id = 24;
			name = "Oreokastro";
			plz = 39399;
			str[] = {{"Im Oberland",9},{"Burgstrasse",3}};
		};	
		class 37410 {
			id = 25;
			name = "Panagia";
			plz = 37410;
			str[] = {{"Mischweg",8},{"Kreuzstrasse",4}};
		};	
		class 35865 {
			id = 26;
			name = "Panochori";
			plz = 35865;
			str[] = {{"Kavalablick",9},{"Unter dem Hang",6}};
		};	
		class 37708 {
			id = 27;
			name = "Paros";
			plz = 37708;
			str[] = {{"Hauptstrasse",21},{"Astweg",6},{"Zweigstrasse",1},{"Kaeufermarkt",4},{"Zum Unterstand",6}};
		};	
		class 35182 {
			id = 28;
			name = "Poliakko";
			plz = 35182;
			str[] = {{"Huettenstrasse",8},{"Zur Wende",2}};
		};	
		class 36893 {
			id = 29;
			name = "Pyrgos";
			plz = 36893;
			str[] = {{"Hauptstrasse",12},{"Kanalweg",8},{"Muehlenstrasse",5},{"Inselweg",4},{"Felsenfest",4},{"Weinsbergwiese",8}};
		};	
		class 36602 {
			name = "Rodopoli";
			plz = 36602;
			str[] = {{"An zwei Muehlen",4},{"Hauptstrasse",5},{"Kuesterweg",4}};
		};	
		class 30081 {
			id = 30;
			name = "Sofia";
			plz = 30081;
			str[] = {{"Hauptstrasse",16},{"Am Sportplatz",6},{"Radarweg",7},{"Langensberg",6}};
		};	
		class 34301 {
			id = 31;
			name = "Stavros";
			plz = 34301;
			str[] = {{"An der Nadel",12},{"Im Nadelwald",4},{"Agia Marinaweg",4}};
		};	
		class 37083 {
			id = 32;
			name = "Syrta";
			plz = 37083;
			str[] = {{"Girnaweg",11},{"Millerweg",2}};
		};	
		class 31535 {
			id = 33;
			name = "Telos";
			plz = 31535;
			str[] = {{"Vierer Rad",14},{"Hauptstrasse",3},{"Finanzweg",5}};
		};	
		class 35427 {
			id = 34;
			name = "Therisa";
			plz = 35427;
			str[] = {{"Sonnenweg",6},{"Am Feldplatz",3}};
		};	
		class 38255 {
			id = 35;
			name = "Topolia";
			plz = 38255;
			str[] = {{"Ygontweg",2}};
		};	
		class 31167 {
			id = 36;
			name = "Zaros";
			plz = 31167;
			str[] = {{"Glaubensweiser",12},{"Am Sportplatz",6},{"Zur Hauptstrasse",8},{"Am Wald",4}};
		};	
	};
	// Vorhandene Gesichter # some faces
	class persoBild
	{
		class 1
		{
			id = 1;
			name = "Bayh";
			pfad = "textures\persobilder\Bayh.jpg";
		};
		class 2
		{
			id = 2;
			name = "Burr";
			pfad = "textures\persobilder\Burr.jpg";
		};
		class 3
		{
			id = 3;
			name = "Byrne";
			pfad = "textures\persobilder\Byrne.jpg";
		};
		class 4
		{
			id = 4;
			name = "Campbell";
			pfad = "textures\persobilder\Campbell.jpg";
		};
		class 5
		{
			id = 5;
			name = "Christou";
			pfad = "textures\persobilder\Christou.jpg";
		};
		class 6
		{
			id = 6;
			name = "Coburn";
			pfad = "textures\persobilder\Coburn.jpg";
		};
		class 7
		{
			id = 7;
			name = "Collins";
			pfad = "textures\persobilder\Collins.jpg";
		};
		class 8
		{
			id = 8;
			name = "Dayton";
			pfad = "textures\persobilder\Dayton.jpg";
		};
		class 9
		{
			id = 9;
			name = "Dorgan";
			pfad = "textures\persobilder\Dorgan.jpg";
		};
		class 10
		{
			id = 10;
			name = "Doukas";
			pfad = "textures\persobilder\Doukas.jpg";
		};
		class 11
		{
			id = 11;
			name = "Gikas";
			pfad = "textures\persobilder\Gikas.jpg";
		};
		class 12
		{
			id = 12;
			name = "Halliwell";
			pfad = "textures\persobilder\Halliwell.jpg";
		};
		class 13
		{
			id = 13;
			name = "Hasan";
			pfad = "textures\persobilder\Hasan.jpg";
		};
		class 14
		{
			id = 14;
			name = "Jesus";
			pfad = "textures\persobilder\Jesus.jpg";
		};
		class 15
		{
			id = 15;
			name = "Johnson";
			pfad = "textures\persobilder\Johnson.jpg";
		};
		class 16
		{
			id = 16;
			name = "Kanelloupou";
			pfad = "textures\persobilder\Kanelloupou.jpg";
		};
		class 17
		{
			id = 17;
			name = "Kelly";
			pfad = "textures\persobilder\Kelly.jpg";
		};
		class 18
		{
			id = 18;
			name = "Kirby";
			pfad = "textures\persobilder\Kirby.jpg";
		};
		class 19
		{
			id = 19;
			name = "Martinez";
			pfad = "textures\persobilder\Martinez.jpg";
		};
		class 20
		{
			id = 20;
			name = "O Brien";
			pfad = "textures\persobilder\O_Brien.jpg";
		};
		class 21
		{
			id = 21;
			name = "O Conner";
			pfad = "textures\persobilder\O_Conner.jpg";
		};
		class 22
		{
			id = 22;
			name = "O Sullivan";
			pfad = "textures\persobilder\O_Sullivan.jpg";
		};
		class 23
		{
			id = 23;
			name = "Reed";
			pfad = "textures\persobilder\Reed.jpg";
		};
		class 24
		{
			id = 24;
			name = "Santorum";
			pfad = "textures\persobilder\Santorum.jpg";
		};
		class 25
		{
			id = 25;
			name = "Savalas";
			pfad = "textures\persobilder\Savalas.jpg";
		};
		class 26
		{
			id = 26;
			name = "Smith";
			pfad = "textures\persobilder\Smith.jpg";
		};
		class 27
		{
			id = 27;
			name = "Snowe";
			pfad = "textures\persobilder\Snowe.jpg";
		};
		class 28
		{
			id = 28;
			name = "Walsh";
			pfad = "textures\persobilder\Walsh.jpg";
		};
		class 29
		{
			id = 29;
			name = "Williams";
			pfad = "textures\persobilder\Williams.jpg";
		};
	};
};