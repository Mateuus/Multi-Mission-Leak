disableSerialization;

_mode = _this select 0;

switch(_mode) do {

	//Laden von Personen
	case 0: {
	
		_display = finddisplay 4900;
		_playerbox = _display displayCtrl 4901;
		_activitytext = _display displayCtrl 4902;
		_activityinfo = _display displayCtrl 4903;
		_rang = _display displayCtrl 4904;
		_befoerdern = _display displayCtrl 4905;
		_degradieren = _display displayCtrl 4906;
		_suspendieren = _display displayCtrl 4907;
		
		{_x ctrlEnable false} foreach [_befoerdern,_degradieren,_suspendieren];
		
		{
			_playerbox lbadd format["%1",_x select 0];
			_playerbox lbSetData[(lbSize _playerbox)-1,format ["%1",[_x select 1,_x select 2]]];
		} foreach life_protocol;
		
		_playerbox lbSetCurSel 0;
	};
	
	//Personenwechsel
	case 1: {
	
		_display = finddisplay 4900;
		_playerbox = _display displayCtrl 4901;
		_activitytext = _display displayCtrl 4902;
		_activityinfo = _display displayCtrl 4903;
		_rang = _display displayCtrl 4904;
	
		_arr = call compile (_playerbox lbData (lbCurSel _playerbox));
		_level = parsenumber (_arr select 0);
		_activity = _arr select 1;
	
		_rangname = [_level,playerside] call life_fnc_getrang;
		_rang ctrlSetText format["Rang: %1",_rangname];
		_activitytext ctrlSetText format["Aktivitätspunkte: %1 / 75",_activity];
	
		_name = _playerbox lbText (lbCurSel _playerbox);
		switch(true) do {

			case (_activity < 5): {_activityinfo ctrlSetStructuredText parsetext format["Die Behörden empfehlen den Beamten %1 wegen unzureichendem Erscheinen am Arbeitsplatz beziehungsweise unsachgemäßem Nachgang seiner Arbeitspflicht zu entlassen.",_name]};
			case (_activity > 5 && _activity < 15): {_activityinfo ctrlSetStructuredText parsetext format["Die Behörden empfehlen den Beamten %1 strikt zu kontrollieren und seine Aktivität in Betracht zu ziehen. Es sollte ein deutliches Wort mit dem Beamten gewechselt werden!",_name]};
			case (_activity > 15 && _activity < 30): {_activityinfo ctrlSetStructuredText parsetext format["Kollege %1 hat sich gut gehalten und geht seiner Arbeit in geordnetem Maße nach. Es ist keine besondere Aktivität zu vermerken.",_name]};
			case (_activity > 30 && _activity < 60): {_activityinfo ctrlSetStructuredText parsetext format["Kollege %1 ist positiv aufgefallen und hat gute Arbeit geleistet. Es sind besondere Aktivitäten zu vermerken!",_name]};
			case (_activity > 60): {_activityinfo ctrlSetStructuredText parsetext format["Kollege %1 leistet exzellente Arbeit! Die Behörden empfehlen definitiv eine Beförderung in Betracht zu ziehen!",_name]};
		};	
	};
};