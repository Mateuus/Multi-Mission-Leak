

private ["_mode","_sel","_arr"];


_mode = param[0,0,[0]];
_sel = param[1,0,[0]];

_arr = [
		["[ADAC]","core\textures\icons\donatorabzeichen\adac.paa",1],
		["[Amateurkriminologe]","core\textures\icons\donatorabzeichen\amateurkriminologe.paa",1],
		["[Anwalt]","core\textures\icons\donatorabzeichen\anwalt.paa",1],
		["[Auftragskiller]","core\textures\icons\donatorabzeichen\auftragskiller.paa",1],
		["[Bankraeuber]","core\textures\icons\donatorabzeichen\bankraeuber.paa",1],
		["[Batman]","core\textures\icons\donatorabzeichen\batman.paa",1],
		["[Biologe]","core\textures\icons\donatorabzeichen\biologe.paa",1],
		["[Buchhalter]","core\textures\icons\donatorabzeichen\buchhalter.paa",1],
		["[Buergerbrater]","core\textures\icons\donatorabzeichen\buergerbrater.paa",1],
		["[Dealer]","core\textures\icons\donatorabzeichen\Dealer.paa",1],
		["[DJ]","core\textures\icons\donatorabzeichen\dj.paa",1],
		["[Drogenschmuggler]","core\textures\icons\donatorabzeichen\drogenschmuggler.paa",1],
		["[Ehrenbuerger]","core\textures\icons\donatorabzeichen\ehrenbuerger.paa",1],
		["[Einbrecher]","core\textures\icons\donatorabzeichen\einbrecher.paa",1],
		["[Farmer]","core\textures\icons\donatorabzeichen\farmer.paa",1],
		["[Filialleiter]","core\textures\icons\donatorabzeichen\filialleiter.paa",1],
		["[Filmstar]","core\textures\icons\donatorabzeichen\filmstar.paa",1],
		["[Filou]","core\textures\icons\donatorabzeichen\filou.paa",1],
		["[Freiherr]","core\textures\icons\donatorabzeichen\freiherr.paa",1],
		["[Gamer]","core\textures\icons\donatorabzeichen\gamer.paa",1],
		["[Gangster]","core\textures\icons\donatorabzeichen\gangster.paa",1],
		["[Gastwirt]","core\textures\icons\donatorabzeichen\gastwirt.paa",1],
		["[Geschaeftsmann]","core\textures\icons\donatorabzeichen\geschaeftsmann.paa",1],
		["[Hacker]","core\textures\icons\donatorabzeichen\hacker.paa",1],
		["[Informatiker]","core\textures\icons\donatorabzeichen\informatiker.paa",1],
		["[Jedi]","core\textures\icons\donatorabzeichen\jedi.paa",1],
		["[Joker]","core\textures\icons\donatorabzeichen\joker.paa",1],
		["[Journalist]","core\textures\icons\donatorabzeichen\journalist.paa",1],
		["[Kindergaertner]","core\textures\icons\donatorabzeichen\kindergaertner.paa",1],
		["[Konsul]","core\textures\icons\donatorabzeichen\konsul.paa",1],
		["[Kopfgeldjaeger]","core\textures\icons\donatorabzeichen\kopfgeldjaeger.paa",1],
		["[Laborant]","core\textures\icons\donatorabzeichen\laboran.paa",1],
		["[Markler]","core\textures\icons\donatorabzeichen\makler.paa",1],
		["[Millionaer]","core\textures\icons\donatorabzeichen\millionaer.paa",1],
		["[Monteur]","core\textures\icons\donatorabzeichen\monteur.paa",1],
		["[Ninja]","core\textures\icons\donatorabzeichen\ninja.paa",1],
		["[Pirat]","core\textures\icons\donatorabzeichen\pirat.paa",1],
		["[Playboy]","core\textures\icons\donatorabzeichen\playboy.paa",1],
		["[Professor]","core\textures\icons\donatorabzeichen\professor.paa",1],
		["[Psychologe]","core\textures\icons\donatorabzeichen\psychologe.paa",1],
		["[Psychopat]","core\textures\icons\donatorabzeichen\psychopat.paa",1],
		["[Rebell]","core\textures\icons\donatorabzeichen\rebell.paa",1],
		["[Rennfahrer]","core\textures\icons\donatorabzeichen\rennfahrer.paa",1],
		["[Rockstar]","core\textures\icons\donatorabzeichen\rockstar.paa",1],
		["[Schoenling]","core\textures\icons\donatorabzeichen\schoenling.paa",1],
		["[Seniorenpfleger]","core\textures\icons\donatorabzeichen\seniorenpfleger.paa",1],
		["[Stormtrooper]","core\textures\icons\donatorabzeichen\stormtrooper.paa",1],
		["[Stuntman]","core\textures\icons\donatorabzeichen\stuntman.paa",1],
		["[Superman]","core\textures\icons\donatorabzeichen\superman.paa",1],
		["[Taschendieb]","core\textures\icons\donatorabzeichen\taschendieb.paa",1],
		["[Taxifahrer]","core\textures\icons\donatorabzeichen\taxifahrer.paa",1],
		["[Terrorist]","core\textures\icons\donatorabzeichen\terrorist.paa",1],
		["[Toxikologe]","core\textures\icons\donatorabzeichen\toxikologe.paa",1],
		["[Twitcher]","core\textures\icons\donatorabzeichen\twitcher.paa",1],
		["[Unternehmensberater]","core\textures\icons\donatorabzeichen\unternehmensberater.paa",1],
		["[Waffenhaendler]","core\textures\icons\donatorabzeichen\waffenhaendler.paa",1],
		["[Wissenschaftler]","core\textures\icons\donatorabzeichen\wissenschaftler.paa",1],
		["[Youtuber]","core\textures\icons\donatorabzeichen\youtuber.paa",1]


	];

if(_mode == 1) then {
	_arr = _arr select (_sel - 1);



};




_arr;