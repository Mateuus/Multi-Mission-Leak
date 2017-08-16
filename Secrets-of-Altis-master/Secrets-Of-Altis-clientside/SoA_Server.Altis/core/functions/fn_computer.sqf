
_action = ["Die Benutzung des Computers kostet 1€!","Links aufrufen?","Ja","Nein"] call bis_fnc_GUImessage;

if(_action) then {
	if(life_beatgeld < 1) exitWith {hint "Du hast keinen Euro bar!"};
	life_beatgeld = life_beatgeld - 1;

	[parseText "<br/><t>Zur Website:</t><br/><a color='#ff1000' href='http://secretsofaltis.de'>Website</a><br/><br/><t>Auf unseren TeamSpeak</t><br/><a color='#ff1000' href='http://tinyurl.com/pzxf42h'>TeamSpeak</a><br/><br/><t>Spannende Trailer</t><br/><a color='#ff1000' href='http://youtube.com/user/overpgamingyt'>Youtube</a><br/>","Website | TS³ und Youtube","Schließen",false] call bis_fnc_GUImessage;
};