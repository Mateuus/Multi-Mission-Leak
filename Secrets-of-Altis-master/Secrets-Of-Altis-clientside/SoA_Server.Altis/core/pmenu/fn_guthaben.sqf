disableSerialization;

_mode = _this select 0;

switch(_mode) do {

	case 0: {
		createdialog "guthaben";

		_dialog = finddisplay 3600;
		_guthaben = _dialog displayCtrl 3601;

		_guthaben ctrlSetText format["Derzeitiges Guthaben: %1€",[life_guthaben] call life_fnc_numberText];
	};

	case 1: {
		_dialog = finddisplay 3600;
		_guthaben = _dialog displayCtrl 3601;
		if(life_inv_guthaben == 0 && life_inv_guthabenplus == 0) exitWith {hint "Du benötigst eine Guthaben-Karte!"};
		
		if(life_inv_guthabenplus > 0 && life_inv_guthaben > 0) then {
			_action = [
				"Du besitzt Guthaben-Karten von unterschiedlichen Typen. Welche möchtest du einlösen?",
				"Zahlungsvorgang",
				"Guthaben",
				"Guthaben +"
			] call BIS_fnc_guiMessage;
			
			if(_action) then {
				if([false,"guthaben",1] call life_fnc_handleinv) then {
					hint "Guthaben wird aufgeladen...";
					sleep 2;
					life_guthaben = life_guthaben + 5000;
				};
			} else {
				if([false,"guthabenplus",1] call life_fnc_handleinv) then {
					hint "Guthaben wird aufgeladen...";
					sleep 2;
					life_guthaben = life_guthaben + 1000000;
				};
			};	
		} else {
		if(life_inv_guthaben > 0) then {
			hint "Guthaben wird aufgeladen...";
			sleep 2;
			if([false,"guthaben",1] call life_fnc_handleinv) then {life_guthaben = life_guthaben + 5000;};
			} else {
				hint "Guthaben wird aufgeladen...";
				sleep 2;
				if(life_inv_guthabenplus > 0) then {
					if([false,"guthabenplus",1] call life_fnc_handleinv) then {life_guthaben = life_guthaben + 1000000;};
				};
			};
		};
		hint "Dein Guthaben wurde aufgeladen.";
	};
};