_karte = _this select 0;

switch(_karte) do {

	case "guthaben": {
		if!(life_guthabencode IsEqualTo [-1,""]) exitWith {};
		life_guthabencode = call compile format["[0,""%1""]",[10000,99999] call life_fnc_RandomRound];
	};

	case "guthabenplus": {
		if!(life_guthabencode IsEqualTo [-1,""]) exitWith {};
		life_guthabencode = call compile format["[1,""%1""]",[10000,99999] call life_fnc_RandomRound];
	};

	case "guthabenpremium": {
		if!(life_guthabencode IsEqualTo [-1,""]) exitWith {};
		life_guthabencode = call compile format["[2,""%1""]",[10000,99999] call life_fnc_RandomRound];
	};
};

[format["Dein Guthabencode lautet: %1. Rufe diese Nummer an um dein Guthaben aufzuladen.",(life_guthabencode select 1)],"Guthabencode",true,false] call BIS_fnc_guiMessage;