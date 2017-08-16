
private["_city"];
if((call life_coplevel) < 2) exitWith {hint "Du bist für diese Aktion nicht berechtigt!"};

_city = _this select 3;

switch(_city) do {
	case 0: {
		hint "Katastrophenalarm Kavala ausgelöst!";
		[lautsprecher_1, "warnung"] remoteExecCall ["say3D",0];
		[lautsprecher_hq, "warnung"] remoteExecCall ["say3D",0];
	};

	case 1: {
		hint "Katastrophenalarm Athira ausgelöst!";
		[lautsprecher_2, "warnung"] remoteExecCall ["say3D",0];
	};

	case 2: {
		hint "Katastrophenalarm Pyrgos ausgelöst!";
		[lautsprecher_3, "warnung"] remoteExecCall ["say3D",0];
	};

	case 3: {
		hint "Katastrophenalarm Sofia ausgelöst!";
		[lautsprecher_4, "warnung"] remoteExecCall ["say3D",0];
	};
	
	case 4: {
		hint "Globalen Katastrophenalarm ausgelöst!";
		[lautsprecher_1, "warnung"] remoteExecCall ["say3D",0];
		[lautsprecher_2, "warnung"] remoteExecCall ["say3D",0];
		[lautsprecher_3, "warnung"] remoteExecCall ["say3D",0];
		[lautsprecher_4, "warnung"] remoteExecCall ["say3D",0];
		[lautsprecher_hq, "warnung"] remoteExecCall ["say3D",0];
	};
};