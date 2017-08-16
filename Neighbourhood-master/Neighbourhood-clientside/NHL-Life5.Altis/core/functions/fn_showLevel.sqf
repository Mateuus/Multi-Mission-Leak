/* 
	Author: Don Richter
	Description: Show Level
	
*/
private["_level","_boni","_ansehen","_lvlnext","_boni2","_bexp","_benexp"];
switch (true) do {

	case ((life_erfahrung >= 0) AND (life_erfahrung <=99)):
	{
	
	_level = 0;
	_boni = "Du bist gerade erst angekommen, daher hast du noch keine Vorteile....";
	_ansehen = "Flüchtling";
	_boni2 = "Du hast nun Zugang zum Auktionshaus";
	_benexp = 100 - life_erfahrung;
	
	};
	case ((life_erfahrung >= 100) AND (life_erfahrung <=249)):
	{
	
	_level = 1;
	_boni = "Du hast nun Zugang zum Auktionshaus";
	_ansehen = "Flüchtling";
	_boni2 = "Du kannst das Kraftwerk hacken.";
	_benexp = 250- life_erfahrung;
	
	
	
	};
	case ((life_erfahrung >= 250) AND (life_erfahrung <=424)):
	{
	
	_level = 2;
	_boni = "Du kannst nun das Kraftwerk hacken.";
	_ansehen = "Flüchtling";
	_boni2 = "Du erhälst ein zusätzliches Gehalt von $500.";
	_benexp = 425- life_erfahrung;
	
	
	};
	case ((life_erfahrung >= 425) AND (life_erfahrung <=624)):
	{
	
	_level = 3;
	_boni = "Du erhälst ein zusätzliches Gehalt von $500.";
	_ansehen = "Flüchtling";
	_boni2 = "Du sammelst eine Einheit mehr bei illegalen Ressourcen.";
	_benexp = 625- life_erfahrung;
	
	};
	case ((life_erfahrung >= 625) AND (life_erfahrung <=849)):
	{
	
	_level = 4;
	_boni = "Du sammelst eine Einheit mehr bei illegalen Ressourcen.";
	_ansehen = "Asylbewerber";
	_boni2 = "Die Chance bei Banküberfällen erwischt zu werden wird verringert.";
	_benexp = 850- life_erfahrung;
	
	};
	case ((life_erfahrung >= 850) AND (life_erfahrung <=1099)):
	{
	
	_level = 5;
	_boni = "Du wirst bei Banküberfällen seltener erwischt.";
	_ansehen = "Asylbewerber";
	_boni2 = "Du kannst zwei weitere Gegenstände in das Auktionshaus inserieren.";
	_benexp = 1100- life_erfahrung;
	
	};
	case ((life_erfahrung >= 1110) AND (life_erfahrung <=1374)):
	{
	
	_level = 6;
	_boni = "Du kannst zwei weitere Gegenstände in das Auktionshaus inserieren.";
	_ansehen = "Asylbewerber";
	_boni2 = "Dein Reperaturkasten ist hochwertiger und verbraucht sich seltener.";
	_benexp = 1375- life_erfahrung;
	
	};
	case ((life_erfahrung >= 1375) AND (life_erfahrung <=1674)):
	{
	
	_level = 7;
	_boni = "Dein Reperaturkasten ist hochwertiger und verbraucht sich seltener.";
	_boni2 = "Dein Gehalt erhöht sich um $1.500.";
	_ansehen = "Immigrant";
	_benexp = 1675- life_erfahrung;
	
	};
	case ((life_erfahrung >= 1675) AND (life_erfahrung <=1999)):
	{
	
	_level = 8;
	_boni = "Dein Gehalt erhöht sich um $1.500.";
	_boni2 = "Du sammelst eine Einheit mehr bei legalen Ressourcen.";
	_ansehen = "Immigrant";
	_benexp = 2000- life_erfahrung;
	
	};
	case ((life_erfahrung >= 2000) AND (life_erfahrung <=2399)):
	{
	
	_level = 9;
	_ansehen = "Immigrant";
	_boni2 = "Du sammelst zwei Einheiten mehr bei illegalen Ressourcen.";
	_boni = "Du sammelst eine Einheit mehr bei legalen Ressourcen.";
	_benexp = 2400- life_erfahrung;
	
	};
	case ((life_erfahrung >= 2400) AND (life_erfahrung <=2874)):
	{
	
	_level = 10;
	_boni = "Du sammelst zwei Einheiten mehr bei illegalen Ressourcen.";
	_boni2 = "Du erhälst einen höheren Erlös beim verkauf von Ressourcen.";
	_ansehen = "Immigrant";
	_benexp = 2875- life_erfahrung;
	
	};
	case ((life_erfahrung >= 2875) AND (life_erfahrung <=3424)):
	{
	
	_level = 11;
	_boni = "Du erhälst einen höheren Erlös beim verkauf von Ressourcen.";
	_boni2 = "Du erbeutest 10% mehr Geld bei Banküberfällen.";
	_ansehen = "Bürger";
	_benexp = 3425- life_erfahrung;
	
	};
	case ((life_erfahrung >= 3425) AND (life_erfahrung <=4049)):
	{
	
	_level = 12;
	_boni2 = "Dein Start-Gear enthält nun einen Rucksack,eine NS-Brille, ein GPS, einen Reperaturkasten und einen Erste-Hilfe-Kasten.";
	_boni = "Du erbeutest 10% mehr Geld bei Banküberfällen.";
	_ansehen = "Bürger";
	_benexp = 4050- life_erfahrung;
	
	};
	case ((life_erfahrung >= 4050) AND (life_erfahrung <=4749)):
	{
	
	_level = 13;
	_boni = "Dein Start-Gear enthält nun einen Rucksack,eine NS-Brille, ein GPS, einen Reperaturkasten und einen Erste-Hilfe-Kasten.";
	_boni2 = "Du kannst in nun Zaros spawnen.";
	_ansehen = "Bürger";
	_benexp = 4750- life_erfahrung;
	
	};
	case ((life_erfahrung >= 4750) AND (life_erfahrung <=5524)):
	{
	
	_level = 14;
	_boni2 = "Die Chance, dass ein Dietrich klappt wurde erhöht.";
	_boni = "Du kannst in nun Zaros spawnen.";
	_ansehen = "Bürger";
	_benexp = 5525- life_erfahrung;
	
	};
	case ((life_erfahrung >= 5525) AND (life_erfahrung <=6374)):
	{
	
	_level = 15;
	_boni = "Die Chance, dass ein Dietrich klappt wurde erhöht.";
	_boni2 = "Du sammelst eine weitere Einheit mehr bei legalen Ressourcen.";
	_ansehen = "Bürger";
	_benexp = 6375- life_erfahrung;
	
	};
	case ((life_erfahrung >= 6375) AND (life_erfahrung <=7299)):
	{
	
	_level = 16;
	_boni2 = "Du wirst bei Banküberfällen deutlich seltener erwischt.";
	_boni = "Du sammelst eine weitere Einheit mehr bei legalen Ressourcen.";
	_ansehen = "Ehrenbürger";
	_benexp = 7300- life_erfahrung;
	
	};
	case ((life_erfahrung >= 7300) AND (life_erfahrung <=8299)):
	{
	
	_level = 17;
	_boni = "Du wirst bei Banküberfällen deutlich seltener erwischt.";
	_boni2 = "Du zahlst nur noch 5% Steuern im Auktionshaus";
	_ansehen = "Ehrenbürger";
	_benexp =8300- life_erfahrung;
	
	};
	case ((life_erfahrung >= 8300) AND (life_erfahrung <=9374)):
	{
	
	_level = 18;
	_boni2 = "Du erhälst 50% mehr Geld bei DP-Missionen.";
	_boni = "Du zahlst nur noch 5% Steuern im Auktionshaus";
	_ansehen = "Ehrenbürger";
	_benexp =9375- life_erfahrung;
	
	};
	case ((life_erfahrung >= 9375) AND (life_erfahrung <=10600)):
	{
	
	_level = 19;
	_boni = "Du erhälst 50% mehr Geld bei DP-Missionen.";
	_boni2 = "Du erhälst 25% mehr Erlös beim verkauf aller Ressourcen.";
	_ansehen = "Ehrenbürger";
	_benexp =10600- life_erfahrung;
	
	};
	case (life_erfahrung >=10600):
	{
	
	_level = 20;
	_boni2 = "Glückwunsch - Du hast das höchste Level erreicht";
	_boni = "Du erhälst 25% mehr Erlös beim verkauf aller Ressourcen.";
	_ansehen = "Ehrenbürger";
	_benexp =100000- life_erfahrung;
	
	};





};

_lvlnext = _level + 1;
hint parseText format["
<t size='2'>%1</t><br/>
<t size='1.5'><t color='#2472ff'>Level: %2<br/><br/></t>
<t size='1' align='left' color='#2472ff'>Erfahrung:</t><t align='right' size='1'> %3</t><br/>
<t size='1' align='left' color='#2472ff'>Nächstes Level in:</t><t align='right' size='1'> %7</t> <br/>
______________________________<br/><br/>
<t size='1' align='left' color='#2472ff'>Aktuelle Freischaltung:</t><t size='1' align='right' color='#2472ff'> Level %2</t><br/>
<t size='0.9' align='left'>%4</t> <br/><br/>
<t size='1' align='left' color='#ff6600'>Nächste Freischaltung:</t><t size='1' align='right' color='#ff6600'> Level %6</t><br/>
<t size='0.9' align='left'>%5<br/></t>
",
_ansehen,
_level,
life_erfahrung,
_boni,
_boni2,
_lvlnext,
_benexp
];

