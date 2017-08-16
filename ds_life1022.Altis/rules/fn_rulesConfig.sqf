/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns server rules
*/

_returnRule = "";

switch(_this select 0)do {
	case 0: { //RDM
		switch(_this select 1)do {
			case 0: { //Desc
				_returnRule = "Killing other players and cops is part of the core gameplay, however there are conditions that must be met before killing another player otherwise it is considered as an RDM (Random Death Match)";
			};
			case 1: { //Civs deccing
				_returnRule = "<t color='#87CEEB'>Both players on foot</t><br/><br/>";
				_returnRule = _returnRule + "A declaration may be sent via direct chat or text message. The player must be given a chance to comply, if he is clearly non-compliant then killing him is not RDM<br/><br/>";
				_returnRule = _returnRule + "<t color='#87CEEB'>Target is in vehicle, your are not</t><br/><br/>";
				_returnRule = _returnRule + "If you are right next to a stopped vehicle you can declare using direct chat (Within 5m) Otherwise a declaration must only be sent via text message since it is possible your target may not hear direct chat<br/><br/>";
				_returnRule = _returnRule + "<t color='#87CEEB'>Both you and your target are in vehicles</t><br/><br/>";
				_returnRule = _returnRule + "A declaration must only be sent via text message";
				_returnRule = _returnRule + "<t color='#87CEEB'>Your target is a police officer</t><br/><br/>";
				_returnRule = _returnRule + "The same declaration rules as above apply however a text message to the entire police force with the location, reason and demands for your declaration us also sufficient";
			};
			case 2: { //Cops deccing
				_returnRule = "<t color='#87CEEB'>Both players on foot</t><br/><br/>";
				_returnRule = _returnRule + "A declaration may be sent via direct chat or text message. The player must be given a chance to comply<br/><br/>";
				_returnRule = _returnRule + "<t color='#87CEEB'>Target is in vehicle, your are not</t><br/><br/>";
				_returnRule = _returnRule + "If you are right next to a stopped vehicle you can declare using direct chat (Within 5m) Otherwise a declaration must only be sent via text message since it is possible your target may not hear direct chat<br/><br/>";
				_returnRule = _returnRule + "<t color='#87CEEB'>Both you and your target are in vehicles</t><br/><br/>";
				_returnRule = _returnRule + "A declaration can either be the usage of sirens, police horns (Control keys), text message or highway patrol auto-dec";
				_returnRule = _returnRule + "<t color='#87CEEB'>Your target is a member of a gang or wearing clan tags</t><br/><br/>";
				_returnRule = _returnRule + "It can be assumed by police that anyone in the same gang or wearing the same tags have communications with each other, because of this an officer can inform any gang member that his group has been declared on";
			};
		};
	};
	case 1: { //VDM
		switch(_this select 1)do {
			case 0: { //test 1
				_returnRule = "Test 3";
			};
			case 1: { //test 2
				_returnRule = "Test 4";
			};
		};
	};
};

if(_returnRule isEqualTo "")then {
	_returnRule = "No category selected";
};

_returnRule;

